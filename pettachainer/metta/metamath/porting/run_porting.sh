#!/bin/bash
set -euo pipefail

# Run structural parsing over port_logic.metta and write final KB facts directly.
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT_FILE="$SCRIPT_DIR/port_logic.metta"
OUTPUT_FILE="$SCRIPT_DIR/../metamath_axioms.metta"
PARSER_FILE="$SCRIPT_DIR/../metamath_parsing.py"

python3 "$PARSER_FILE" --input "$INPUT_FILE" --output "$OUTPUT_FILE"

echo "Porting complete. Results saved to $OUTPUT_FILE"
