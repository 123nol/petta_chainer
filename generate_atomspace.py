import json
import os

def load_implications(json_filepath):
    """Loads the extracted implications from the JSON file."""
    if not os.path.exists(json_filepath):
        raise FileNotFoundError(
            f"JSON file not found: {json_filepath}. Please run 'extract_mathlib.py' first."
        )
    with open(json_filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def render_rule(name, premises, conclusion, kb_name="kb", stv="1.0 1.0"):
    """
    Renders a PeTTaChainer compileadd rule in the exact same format as the
    Metamath-to-PeTTaChainer parser.
    """
    if premises:
        premises_lines = "\n".join(
            f"            (Provable {p})" for p in premises
        )
        premises_block = f"\n{premises_lines}\n         "
    else:
        premises_block = ""

    return (
        f"!(compileadd {kb_name}\n"
        f"   (: (no_inverse {name})\n"
        f"      (Implication\n"
        f"         (Premises{premises_block})\n"
        f"         (Conclusions\n"
        f"            (Provable {conclusion})\n"
        f"         )\n"
        f"      )\n"
        f"      (STV {stv})\n"
        f"   )\n"
        f")"
    )


def render_direct_fact(name, conclusion, kb_name="kb", stv="1.0 1.0"):
    """
    Renders a direct Provable fact in the exact same format as the
    Metamath-to-PeTTaChainer parser when there are no meta-level premises.
    """
    return (
        f"!(compileadd {kb_name}\n"
        f"   (: (no_inverse {name})\n"
        f"      (Provable {conclusion})\n"
        f"      (STV {stv})\n"
        f"   )\n"
        f")"
    )


def generate_metta_expressions(data, kb_name="kb", stv="1.0 1.0", direct_facts=False):
    """
    Translates JSON implications into MeTTa/AtomSpace S-expressions that match
    the format produced by the Metamath-to-PeTTaChainer parser.

    For each Mathlib class inheritance relation (e.g. CommGroup extends Group):
      - Premise:    (CommGroup $x)
      - Conclusion: (Group $x)

    This produces rules that are structurally identical to ported Metamath theorems,
    so PeTTaChainer can use them uniformly for backward/forward chaining.
    """
    lines = [
        ";; ============================================================",
        ";; Mathlib Mined Implications — PeTTaChainer AtomSpace Format",
        ";; Matches metamath_to_pettachainer_parser_v2.py output format",
        ";; ============================================================",
        "",
    ]

    implications = data.get("implications", [])

    for impl in implications:
        name       = impl["source_theorem"]
        antecedent = impl["antecedent"]
        consequent = impl["consequent"]


        premises   = [f"({antecedent} $x)"]
        conclusion = f"({consequent} $x)"

        if direct_facts and not impl.get("antecedent"):
            lines.append(render_direct_fact(name, conclusion, kb_name, stv))
        else:
            lines.append(render_rule(name, premises, conclusion, kb_name, stv))
        lines.append("")  

    return "\n".join(lines)


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Generate Mathlib-derived PeTTaChainer AtomSpace rules.")
    parser.add_argument("--kb", default="kb", help="Knowledge base name")
    parser.add_argument("--stv", default="1.0 1.0", help='Truth value, e.g. "1.0 1.0"')
    parser.add_argument("--direct-facts", action="store_true",
                        help="Emit premise-free theorems as direct Provable facts instead of zero-premise implications.")
    parser.add_argument("-o", "--output", default="mathlib_implications.metta", help="Output .metta file")
    args = parser.parse_args()

    json_file   = "mathlib_implications.json"
    output_file = args.output

    print(f"Reading implications from {json_file}...")
    data = load_implications(json_file)

    print("Generating MeTTa S-expressions (Metamath-compatible format)...")
    metta_content = generate_metta_expressions(data, kb_name=args.kb, stv=args.stv, direct_facts=args.direct_facts)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(metta_content)

    implications = data.get("implications", [])
    print(f"\nSuccessfully generated AtomSpace S-expressions!")
    print(f"  Rules written : {len(implications)}")
    print(f"  Saved to      : {output_file}")
    print()
    print("Sample output (first 3 rules):")
    print("---")
    sample = generate_metta_expressions({"implications": implications[:3]}, kb_name=args.kb, stv=args.stv, direct_facts=args.direct_facts)
    print(sample)


if __name__ == "__main__":
    main()
