#!/bin/bash

echo "💥 Starting Conflict Simulator..."

# 1. Initialize Git if not done
if [ ! -d ".git" ]; then
    echo "Initializing Git repository..."
    git init
    git add collaboration-story.txt
    git commit -m "Initial commit of the story"
fi

# 2. Create branch A
echo "Creating branch 'developer-a'..."
git branch -D developer-a 2>/dev/null
git checkout -b developer-a
sed -i 's/It seemed complicated at first./It seemed VERY EASY at first./' collaboration-story.txt
git add collaboration-story.txt
git commit -m "Developer A changed their mind"

# 3. Go back to main and create branch B
echo "Creating branch 'developer-b'..."
git checkout master 2>/dev/null || git checkout main
git branch -D developer-b 2>/dev/null
git checkout -b developer-b
sed -i 's/It seemed complicated at first./It seemed EXTREMELY HARD at first./' collaboration-story.txt
git add collaboration-story.txt
git commit -m "Developer B disagrees"

# 4. The Merge (Collision Course)
echo "-----------------------------------"
echo "🔥 PREPARE FOR IMPACT! 🔥"
echo "We are currently on branch 'developer-b'."
echo "We will now try to merge 'developer-a' into this branch."
echo "Since both developers changed line 3, Git will panic."
echo "-----------------------------------"
echo "Running: git merge developer-a"
git merge developer-a

echo "-----------------------------------"
echo "✅ Conflict generated!"
echo "Open 'collaboration-story.txt' to see the mess."
echo "Fix the lines, remove the <<<< ==== >>>> markers, and commit."
