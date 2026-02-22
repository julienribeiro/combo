# combo_skill_test/python_scripts/fix_csv.py
import csv
import sys
import os
import glob
import argparse


def fix_csv(filepath):
    """
    Reads a CSV file, pads incomplete rows with empty values
    to match the header column count, and overwrites the file.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        header = next(reader)
        expected_cols = len(header)
        rows = [header]
        fixed_count = 0

        for i, row in enumerate(reader, start=2):
            if len(row) < expected_cols:
                original_len = len(row)
                row.extend([''] * (expected_cols - len(row)))
                fixed_count += 1
                print(f"  [FIXED] Line {i}: had {original_len} cols, padded to {expected_cols}")
            elif len(row) > expected_cols:
                print(f"  [WARNING] Line {i}: has {len(row)} cols, expected {expected_cols} — skipped")
                continue
            rows.append(row)

    with open(filepath, 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(rows)

    print(f"  → {fixed_count} lines fixed in {os.path.basename(filepath)}\n")


def parse_seed_names():
    """Parse les arguments de dbt seed pour extraire les noms après -s/--select."""
    parser = argparse.ArgumentParser()
    parser.add_argument('-s', '--select', nargs='+', default=[])
    args, _ = parser.parse_known_args()
    return args.select


# Détecte automatiquement le répertoire du projet
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(os.path.dirname(script_dir))
seeds_dir = os.path.join(project_root, 'combo_skill_test', 'seeds')

seed_names = parse_seed_names()

if seed_names:
    seed_files = []
    for name in seed_names:
        matches = glob.glob(os.path.join(seeds_dir, '**', f'{name}.csv'), recursive=True)
        if matches:
            seed_files.extend(matches)
        else:
            print(f"⚠️  No CSV found for seed '{name}'")
else:
    seed_files = glob.glob(os.path.join(seeds_dir, '**', '*.csv'), recursive=True)

for f in seed_files:
    print(f"Processing {f}...")
    fix_csv(f)

if not seed_files:
    print("✅ No CSV files to process.")