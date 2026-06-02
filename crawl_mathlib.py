#!/usr/bin/env python3
"""
crawl_mathlib.py

Crawls the official Mathlib4 documentation index to discover and download
module pages automatically. Focuses on mathematical content (Algebra, Logic,
Order, Topology, etc.) rather than infrastructure modules.

Usage:
    python crawl_mathlib.py                  # discover + download all math modules
    python crawl_mathlib.py --max 50         # limit to first 50 modules
    python crawl_mathlib.py --category Algebra  # only Algebra modules
    python crawl_mathlib.py --list-only      # print discovered URLs, don't download
"""

import argparse
import os
import time
import urllib.request
from urllib.parse import urljoin
from bs4 import BeautifulSoup

BASE_URL   = "https://leanprover-community.github.io/mathlib4_docs"
NAVBAR_URL = f"{BASE_URL}/navbar.html"
CACHE_DIR  = "mathlib_cache"

MATH_NAMESPACES = [
    "Mathlib.Algebra",
    "Mathlib.Analysis",
    "Mathlib.CategoryTheory",
    "Mathlib.Combinatorics",
    "Mathlib.Data",
    "Mathlib.FieldTheory",
    "Mathlib.GroupTheory",
    "Mathlib.LinearAlgebra",
    "Mathlib.Logic",
    "Mathlib.MeasureTheory",
    "Mathlib.ModelTheory",
    "Mathlib.NumberTheory",
    "Mathlib.Order",
    "Mathlib.RingTheory",
    "Mathlib.SetTheory",
    "Mathlib.Topology",
]


def fetch(url: str, retries: int = 3, delay: float = 1.0) -> str:
    """Download a URL with retry logic and a User-Agent header."""
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=15) as resp:
                return resp.read().decode("utf-8", errors="replace")
        except Exception as e:
            if attempt < retries - 1:
                print(f"  [retry {attempt+1}] {e}")
                time.sleep(delay)
            else:
                raise


def discover_module_urls(category_filter: str | None = None) -> list[str]:
    """
    Fetches the Mathlib4 documentation navbar and returns all module URLs
    that belong to our target mathematical namespaces.
    """
    print(f"Fetching module navbar from: {NAVBAR_URL}")
    html = fetch(NAVBAR_URL)
    soup = BeautifulSoup(html, "html.parser")

    urls = []
    for a in soup.find_all("a", href=True):
        href = a["href"]
        full_url = urljoin(f"{BASE_URL}/", href)

        if not full_url.endswith(".html"):
            continue
        if "/Mathlib/" not in full_url:
            continue

        if category_filter:
            if f"/Mathlib/{category_filter}/" not in full_url:
                continue
        else:
            module_path = full_url.replace(f"{BASE_URL}/", "").replace(".html", "").replace("/", ".")
            if not any(module_path.startswith(ns) for ns in MATH_NAMESPACES):
                continue

        if full_url not in urls:
            urls.append(full_url)

    return sorted(urls)


def url_to_filename(url: str) -> str:
    """Convert a doc URL to a safe local filename."""
    path = url.replace(f"{BASE_URL}/", "").replace("/", ".")
    return path  


def download_modules(urls: list[str], max_modules: int | None = None) -> list[str]:
    """
    Download each module HTML page to CACHE_DIR.
    Returns the list of local file paths successfully downloaded/cached.
    """
    os.makedirs(CACHE_DIR, exist_ok=True)
    if max_modules:
        urls = urls[:max_modules]

    downloaded = []
    for i, url in enumerate(urls, 1):
        filename  = url_to_filename(url)
        local_path = os.path.join(CACHE_DIR, filename)

        if os.path.exists(local_path):
            print(f"[{i:4d}/{len(urls)}] cached  {filename}")
            downloaded.append(local_path)
            continue

        try:
            print(f"[{i:4d}/{len(urls)}] downloading  {filename}")
            html = fetch(url)
            with open(local_path, "w", encoding="utf-8") as f:
                f.write(html)
            downloaded.append(local_path)
            time.sleep(0.3)   
        except Exception as e:
            print(f"  [!] Failed: {e}")

    return downloaded


def main():
    parser = argparse.ArgumentParser(description="Crawl Mathlib4 documentation")
    parser.add_argument("--max",       type=int,  default=None, metavar="N",
                        help="Maximum number of modules to download")
    parser.add_argument("--category",  type=str,  default=None, metavar="NAME",
                        help="Only download modules under Mathlib.<NAME> (e.g. Algebra)")
    parser.add_argument("--list-only", action="store_true",
                        help="Print discovered URLs without downloading")
    args = parser.parse_args()

    urls = discover_module_urls(category_filter=args.category)
    print(f"\nDiscovered {len(urls)} matching module pages.")

    if args.list_only:
        for u in urls:
            print(u)
        return

    paths = download_modules(urls, max_modules=args.max)

    print(f"\n✓  {len(paths)} module files ready in '{CACHE_DIR}/'")
    print("Run extract_mathlib.py next to parse them all into mathlib_implications.json")


if __name__ == "__main__":
    main()
