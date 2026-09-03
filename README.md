# DSAN 6000 Lab 1: Linux Basics

## Goals

-   Using the Linux Shell and how it is critical for the cloud
-   BASH Exercise with practical file organization
-   Introduction to command-line data processing

**What you'll learn**:
- Essential BASH commands for file management
- Using globbing patterns safely
- Basic shell scripting with proper practices
- Command-line tools for data analysis (bonus)

## Submission

You will follow the submission process for all labs and assignments:

1. Add all your requested files to the GitHub assignment repo for the appropriate deliverable.
2. **Before committing**: Always run `git status` to check what files will be committed.
3. Use meaningful commit messages throughout your work (not just at the end).
4. Submit a final commit message called "final-submission" to your repo. This is critical so that the instructional team can evaluate your work. Do not change your GitHub repo after submitting the "final-submission" commit message.

**Pro Tip**: Use `git status` and `git diff` before each commit to review your changes.

Make sure you commit only the files requested.

The files to be committed and pushed to your repository for this assignment are:

- test-environment/ and its subfolders
- bash-history.txt
- temp-numfiles.txt
- setup_commands.bash (your cleaned-up script)
- hotels.json
- jq-analysis.txt
- hotel-analysis-answers.txt
- hotel_ratings.csv
- other files that came with the repo


## Shell Safety Tips for Beginners
- Use `ls` before `rm` to see what you'll delete
- Use `cp` instead of `mv` when learning (keeps original)
- Use Tab completion to avoid typos
- Use `history` to see what you did
- Press Ctrl+C to stop a running command

## Task 1: Repository Setup (5 marks)
There is a test environment folder in your Git repo that needs cleaning up. **You will use BASH commands only** to organize the files in this test environment.

All the work on this repo and environment need to be BASH commands executed in the GitHub Codespaces environment (or any Linux/Mac terminal, or Windows WSL2). That means changing directories, listing files, moving files, making directories, etc.

## Task 2: File Organization and Cleanup (15 marks)

### Target Directory Structure
Organize the files in the test-environment into this structure:

```
test-environment/
├── docs
├── models
├── data
│   ├── input
│   └── output
├── src
│   ├── notebooks
│   └── scripts
└── temp
```

### 2A. Create Directory Structure (2 marks)
First, create all the folders within [git repo]/test-environment/ as shown in the tree diagram above.

### 2B. Remove Old Files Using Globbing (3 marks)
Remove the files that are marked with an "old" or "DELETE". You must do this using **globbing**.

**Safety Tip**: First use `ls *old* *DELETE*` to see what files match your pattern, then use `rm *old* *DELETE*` with the same pattern.
**Expected files to be removed**: in-data-DELETE.csv, in-data-old.csv, in-data-part5-old5.csv, old-notebook-DELETE.ipynb, old-script.py

### 2C. Count Files with Pipes (2 marks)
Use pipes and arrows to find the number of files **currently remaining** in `test-environment` folder (after cleanup) and save into a file called `temp-numfiles.txt`. This step must be accomplished in one command.

**Hint**: The command should be `ls | wc -l > temp-numfiles.txt` run from inside the test-environment directory.

### 2D. Move Files to Appropriate Folders (5 marks)
Now navigate through your directory structure or effectively use `..` to move all the files into the appropriate folders. If you have any concerns about where the files should end up, run a comment command in BASH to justify your approach. The comment character in BASH is `#`. **You must use globbing at least twice during your moving operations.**

File placement rules:
- temp-related files go into the temp folder
- .csv files go into the appropriate data subfolders
- .pkl and .h5 files go into the models folder
- .md files go into the docs folder
- .ipynb and .py go into the appropriate src subfolders

### 2E. List Directory Tree (2 marks)
List the contents of your `test-environment` to show all the contents within this folder tree. Hint: are there flags that could help you avoid listing 7 directories?

### 2F. Commit Changes (1 mark)
Add, commit, and push your organized repo to GitHub.

## Task 3: Command History (5 marks)
Save your history of commands into a file in your Git repo using the command `history > bash-history.txt`. Add, commit, and push this file to your remote GitHub repo.

## Task 4: Create Automation Script (10 marks)
The final step is to clean up the `bash-history.txt` file and turn it into a clean BASH script that can be called in one command on the original repo to complete Tasks 1-3. You must call the command like: `bash setup_commands.bash`.

### Script Best Practices:
- Start your script with the shebang line: `#!/bin/bash`
- Make your script executable: `chmod +x setup_commands.bash`
- Add comments to explain what each section does

### Example Script Structure:
```bash
#!/bin/bash
# Setup script for test-environment organization
# Created by: [Your Name]

# Create directory structure
echo "Creating directory structure..."
# ... your commands here

# Clean up old files
echo "Removing old files..."  
# ... your commands here
```

### Testing Your Script:
You will need to review how to checkout a specific commit in order to test if the commands run correctly and in the right order. Be careful not to lose your bash script when you switch repo commits!

*Hint: Try to navigate out of your git repo in the terminal and clone your repo again into a new folder so you can develop the script and test on the original repo simultaneously.*

**Make sure you follow the steps in order, we are expecting to see multiple commits!**

---

## Command-Line Tools Overview

This lab introduces several powerful command-line tools. Here are helpful resources:

**Core Shell Tools:**
- [`sed`](https://www.gnu.org/software/sed/manual/sed.html) - Stream editor for text processing
- [`cut`](https://www.gnu.org/software/coreutils/manual/html_node/The-cut-command.html) - Extract columns/fields from text
- [`grep`](https://www.gnu.org/software/grep/manual/grep.html) - Search text patterns

**System Utilities:**
- [`ncdu`](https://dev.yorhel.nl/ncdu) - Interactive disk usage analyzer
- [`du`](https://www.gnu.org/software/coreutils/manual/html_node/du-invocation.html) - Disk usage reporting
- [`find`](https://www.gnu.org/software/findutils/manual/html_mono/find.html) - Search for files and directories

**Data Processing:**
- [`jq`](https://jqlang.org/) - JSON processor and query language
- [`wc`](https://www.gnu.org/software/coreutils/manual/html_node/wc-invocation.html) - Word, line, character, and byte count

## Quick Command Reference

Here's a handy reference for the commands you'll need:

```bash
# Navigation
pwd              # Where am I?
ls -la           # List all files with details
cd folder/       # Change directory
cd ..            # Go up one level
cd ~             # Go to home directory

# File Operations  
mkdir newfolder  # Create directory
touch file.txt   # Create empty file
cp file1 file2   # Copy file
mv file1 file2   # Move/rename file
rm file         # Remove file (careful!)
rm -r folder/   # Remove folder and contents

# Viewing Files
cat file.txt    # Show file contents
head -n 5 file  # Show first 5 lines
tail -n 5 file  # Show last 5 lines
less file.txt   # Page through file (q to quit)

# Finding and Counting
find . -name "*.csv"     # Find CSV files
ls *.py                  # List Python files (globbing)
wc -l file.txt          # Count lines in file
ls | wc -l              # Count files in directory

# Disk Usage and Space
du -h folder/   # Show folder size (human-readable)
du -sh *        # Show size of all items in current dir
df -h           # Show disk space on all drives

# Text Processing
cut -d',' -f1 file.csv   # Extract first column from CSV
sed 's/old/new/g' file   # Replace all 'old' with 'new'
sed -n '5,10p' file      # Print lines 5-10 only
grep "pattern" file      # Find lines containing pattern

# Git Commands
git status      # See what files have changed
git add .       # Stage all changes
git commit -m "message"  # Commit with message
git push        # Push to remote repository

# Getting Help
man command     # Manual for command
command --help  # Quick help
```

---

## Task 5: JSON Data Processing with `jq` (15 marks)

This exercise introduces command-line data processing with [`jq`](https://jqlang.org/) - an essential skill for data science.

### 5A. Create Sample Dataset (2 marks)
Create the `hotels.json` file as shown below in your repository root directory:

```bash
# Create hotels.json file with sample data
cat > hotels.json << 'EOF'
{
  "hotels": [
    {"name": "Grand Plaza", "city": "New York", "rating": 4.5, "rooms": 250, "price": 350},
    {"name": "Budget Inn", "city": "Boston", "rating": 3.2, "rooms": 45, "price": 89},
    {"name": "Luxury Suites", "city": "Miami", "rating": 4.8, "rooms": 180, "price": 450},
    {"name": "City Lodge", "city": "Chicago", "rating": 3.8, "rooms": 120, "price": 120},
    {"name": "Economy Stay", "city": "Austin", "rating": 2.9, "rooms": 60, "price": 65},
    {"name": "Comfort Zone", "city": "Seattle", "rating": 4.1, "rooms": 90, "price": 180},
    {"name": "Quick Rest", "city": "Denver", "rating": 3.5, "rooms": 55, "price": 95},
    {"name": "Elite Resort", "city": "Las Vegas", "rating": 4.9, "rooms": 500, "price": 600},
    {"name": "Simple Sleep", "city": "Portland", "rating": 3.1, "rooms": 40, "price": 75},
    {"name": "Business Hotel", "city": "San Francisco", "rating": 4.2, "rooms": 200, "price": 280}
  ]
}
EOF
```

### 5B. Execute jq Analysis Commands (6 marks)
Execute all the following jq commands and capture both the commands and their outputs in a file called `jq-analysis.txt`:

```bash
# 1. Count total number of hotels
jq '.hotels | length' hotels.json
# Expected output: 10

# 2. Find hotels with rating less than 4 stars
jq '.hotels[] | select(.rating < 4)' hotels.json

# 3. Count hotels with less than 4 star rating (main challenge!)
jq '[.hotels[] | select(.rating < 4)] | length' hotels.json
# Expected output: 5

# 4. Get names of low-rated hotels
jq '.hotels[] | select(.rating < 4) | .name' hotels.json

# 5. Create a CSV of hotel names and ratings
jq -r '.hotels[] | [.name, .rating] | @csv' hotels.json > hotel_ratings.csv

# 6. Use sed and cut on the CSV we created
cut -d',' -f1 hotel_ratings.csv | sed 's/"//g'

# 7. Count hotels with "Inn" or "Lodge" in the name
jq -r '.hotels[].name' hotels.json | grep -E '(Inn|Lodge)' | wc -l
# Expected output: 2
```

### Required Format for `jq-analysis.txt`:
```
=== Command 1: Count total hotels ===
$ jq '.hotels | length' hotels.json
10

=== Command 2: Find hotels with rating less than 4 stars ===
$ jq '.hotels[] | select(.rating < 4)' hotels.json
{
  "name": "Budget Inn",
  "city": "Boston", 
  "rating": 3.2,
  "rooms": 45,
  "price": 89
}
[... continue with all output ...]

=== Command 3: Count hotels with less than 4 star rating ===
$ jq '[.hotels[] | select(.rating < 4)] | length' hotels.json
5

[... continue for all 7 commands ...]
```

### 5C. Answer Challenge Questions (6 marks)
Create a file called `hotel-analysis-answers.txt` and answer these questions with your own jq commands:

1. How many hotels have more than 100 rooms?
2. What's the average rating of all hotels?
3. Which city has the highest-priced hotel?
4. Create a file with just budget hotels (price < $100)

### Required Format for `hotel-analysis-answers.txt`:
```
1. How many hotels have more than 100 rooms?
Answer: [Your command and result]

2. What's the average rating of all hotels?
Answer: [Your command and result]

3. Which city has the highest-priced hotel?
Answer: [Your command and result]

4. Create a file with just budget hotels (price < $100)
Answer: [Your command and the filename created]
```

### 5D. Generate CSV File (1 mark)
The `hotel_ratings.csv` file should be generated from command #5 above and committed to your repo.

### Check if jq is Available:
Before starting, check if `jq` is installed:
```bash
jq --version
```

**If jq is not installed** (common in some environments), use this Python alternative for all commands and document that in your submission files:
```bash
# Alternative for command 1: Count total hotels
python3 -c "import json; data=json.load(open('hotels.json')); print(len(data['hotels']))"

# Alternative for command 3: Count hotels with rating < 4
python3 -c "import json; data=json.load(open('hotels.json')); print(len([h for h in data['hotels'] if h['rating'] < 4]))"

# Alternative for command 4: Names of low-rated hotels
python3 -c "import json; data=json.load(open('hotels.json')); [print(h['name']) for h in data['hotels'] if h['rating'] < 4]"
```

If using Python alternatives, note this clearly in your `jq-analysis.txt` file.

This exercise demonstrates how command-line tools can be powerful for data analysis!
