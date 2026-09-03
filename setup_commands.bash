#!/bin/bash
# Setup script for test-environment organization
# Created by: Ken Qin
# Usage: bash setup_commands.bash
# Run from the repo root, with test-environment/ still containing the
# original, unorganized files (i.e. before Task 2 has been run).

# --- Task 1 / 2A: Create directory structure ---
echo "Creating directory structure..."
cd test-environment
mkdir -p docs models data/input data/output src/notebooks src/scripts temp

# --- Task 2B: Remove old/DELETE files using globbing ---
echo "Removing old files..."
rm -f *old* *DELETE*

# --- Task 2C: Count remaining files in one piped command ---
echo "Counting remaining files..."
ls | wc -l > temp-numfiles.txt
cat temp-numfiles.txt

# --- Task 2D: Move files into their target folders using globbing ---
echo "Organizing files into folders..."
mv temp-* temp/
mv *.md docs/
mv *.pkl *.h5 models/
mv in-data-part*.csv data/input/
mv *-output.csv data/output/
mv *.ipynb src/notebooks/
mv *.py src/scripts/

# --- Task 2E: Show the final directory tree ---
echo "Final test-environment structure:"
find . -type f | sort

# --- Task 3: Save command history ---
# NOTE: `history` only has content in an interactive shell session, so
# when this script is run non-interactively (bash setup_commands.bash),
# this will produce an empty (or near-empty) bash-history.txt. Included
# here to satisfy Task 3's automation requirement, but the real,
# meaningful bash-history.txt was generated interactively and committed
# separately.
echo "Saving command history..."
cd ..
history > bash-history.txt

echo "Setup complete."
