import json
import re
import os
import urllib.request
import bs4
from bs4 import BeautifulSoup



def clean_concept_name(name):
    """Strips parent namespaces and trailing type variables."""
    name = name.split('.')[-1]
    name = name.strip().split()[0]
    return name


def split_top_level_operator(text: str, op: str) -> tuple[str, str] | None:
    depth = 0
    for i, ch in enumerate(text):
        if ch in "([{":
            depth += 1
        elif ch in ")]}":
            depth -= 1
        elif ch == op and depth == 0:
            return text[:i].strip(), text[i + 1 :].strip()
    return None


def parse_atomic_concept(expr: str) -> str | None:
    expr = expr.strip()
    if not expr:
        return None
    if any(token in expr for token in ["∀", "forall", "→", "↔", "->", "<->", "(", ")", ":", ","]):
        return None
    name = clean_concept_name(expr)
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
        return None
    return name


def extract_implications_from_type(type_sig):
    """Detects implications in a Lean 4 type signature."""
    type_sig = re.sub(r'\s+', ' ', type_sig).strip()
    if not type_sig:
        return []

    normalized = type_sig.replace("<->", "↔").replace("->", "→").replace("=>", "→")
    implications: list[tuple[str, str]] = []

    for operator in ("↔", "→"):
        split = split_top_level_operator(normalized, operator)
        if split:
            left, right = split
            a = parse_atomic_concept(left)
            c = parse_atomic_concept(right)
            if a and c and a != c:
                implications.append((a, c))
                if operator == "↔":
                    implications.append((c, a))
            return implications

    return []


def download_file(url, filepath):
    """Downloads url → filepath with a browser-like User-Agent."""
    print(f"  Downloading {url}")
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    with urllib.request.urlopen(req, timeout=20) as resp:
        with open(filepath, 'wb') as f:
            f.write(resp.read())



def parse_mathlib_html_content(html_content, source_label):
    """
    Parses a doc-gen4 HTML page and returns (declarations, implications).

    Extracts:
      - Class/structure declarations and their `extends` parents
        → structural (inheritance) implications
      - Theorem/lemma type signatures
        → logical implications via forall / arrow patterns
    """
    soup = BeautifulSoup(html_content, 'html.parser')

    declarations = []
    implications = []

    module_header = soup.find('h2', class_='header_filename')
    module_name   = module_header.text.strip() if module_header else "Mathlib"

    decl_divs = soup.find_all('div', class_='decl')
    if not decl_divs:
        return declarations, implications   

    for decl in decl_divs:
        decl_id = decl.get('id', '')

        inner_div = next(
            (c for c in decl.children
             if isinstance(c, bs4.element.Tag) and c.name == 'div' and c.get('class')),
            None,
        )
        if not inner_div:
            continue

        kind = inner_div.get('class')[0]

        header_div = inner_div.find('div', class_='decl_header')
        if not header_div:
            continue

        name_span  = header_div.find('span', class_='decl_name')
        short_name = name_span.text.strip() if name_span else decl_id
        if not short_name:
            continue

        type_div = inner_div.find('div', class_='decl_type')
        type_sig = type_div.text.strip() if type_div else ""

        p_tags   = inner_div.find_all('p', recursive=False)
        docstring = "\n".join(p.text.strip() for p in p_tags)

        declarations.append({
            "full_name":      f"{module_name}.{short_name}",
            "name":           short_name,
            "kind":           kind,
            "type_signature": type_sig,
            "docstring":      docstring,
        })

        extends_span = header_div.find('span', class_='decl_extends')
        if extends_span:
            sibling = extends_span.next_sibling
            while sibling:
                if isinstance(sibling, bs4.element.Tag):
                    if sibling.get('class') and ':' in sibling.text:
                        break
                    if sibling.name in ('span', 'a') and not sibling.get('class'):
                        parent = clean_concept_name(sibling.text)
                        if parent:
                            implications.append({
                                "source_theorem": f"{short_name}_extends_{parent}",
                                "antecedent":     short_name,
                                "consequent":     parent,
                                "type":           "IMPLIES",
                            })
                elif isinstance(sibling, bs4.element.NavigableString):
                    if ':' in sibling:
                        break
                sibling = sibling.next_sibling

        if kind in ("theorem", "lemma", "def", "structure", "class"):
            for a, c in extract_implications_from_type(type_sig):
                implications.append({
                    "source_theorem": f"{short_name}_to_{a}_to_{c}",
                    "antecedent":     a,
                    "consequent":     c,
                    "type":           "IMPLIES",
                })

    return declarations, implications



SEED_URLS = [
    "https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html",
    "https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html",
    "https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Field/Defs.html",
]


def main():
    cache_dir = "mathlib_cache"
    os.makedirs(cache_dir, exist_ok=True)

    cached = sorted(f for f in os.listdir(cache_dir) if f.endswith(".html"))
    if not cached:
        print("Cache is empty — downloading seed Mathlib modules...")
        for url in SEED_URLS:
            filename   = url.split("/mathlib4_docs/")[1].replace("/", ".")
            local_path = os.path.join(cache_dir, filename)
            try:
                download_file(url, local_path)
            except Exception as e:
                print(f"  [!] Could not download {url}: {e}")
        cached = sorted(f for f in os.listdir(cache_dir) if f.endswith(".html"))

    total = len(cached)
    print(f"\nParsing {total} cached module file(s) in '{cache_dir}/'...\n")

    all_decls = []
    all_impls = []

    for i, filename in enumerate(cached, 1):
        local_path = os.path.join(cache_dir, filename)
        print(f"[{i:4d}/{total}] {filename}")
        try:
            with open(local_path, 'r', encoding='utf-8') as f:
                html = f.read()
            decls, impls = parse_mathlib_html_content(html, local_path)
            all_decls.extend(decls)
            all_impls.extend(impls)
        except Exception as e:
            print(f"        [!] Error: {e}")

    seen_d, unique_decls = set(), []
    for d in all_decls:
        if d["full_name"] not in seen_d:
            seen_d.add(d["full_name"])
            unique_decls.append(d)

    seen_i, unique_impls = set(), []
    for imp in all_impls:
        key = (imp["antecedent"], imp["consequent"], imp["source_theorem"])
        if key not in seen_i:
            seen_i.add(key)
            unique_impls.append(imp)

    output_data = {
        "concepts":     [d for d in unique_decls if d["kind"] in ("structure", "class", "def")],
        "theorems":     [d for d in unique_decls if d["kind"] in ("theorem", "lemma")],
        "implications": unique_impls,
    }

    output_file = "mathlib_implications.json"
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2)

    print(f"\nDone.")
    print(f"  Modules parsed : {total}")
    print(f"  Concepts       : {len(output_data['concepts'])}")
    print(f"  Theorems       : {len(output_data['theorems'])}")
    print(f"  Implications   : {len(output_data['implications'])}")
    print(f"  Saved to       : {output_file}")
    print()
    print("To expand coverage, run:")
    print("  python crawl_mathlib.py --max 200   # download more modules")
    print("  python extract_mathlib.py            # re-parse the full cache")


if __name__ == "__main__":
    main()
