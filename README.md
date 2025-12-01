# MyProject
it's a flutter app. 
A form will be designed and developed me.

1. cd "d:\edistrict odisha\MyFlutterProject"
git checkout main
git pull origin main

2. git checkout -b feature/my-change

3. git add .
git commit -m "Short description of change"

4. git push -u origin feature/my-change

5. gh auth login    # only if not authenticated
gh pr create --base main --head feature/my-change --title "PR title" --body "Description"

6. gh pr merge --merge --delete-branch

no changes added to commit (use "git add" and/or "git commit -a")
PS D:\edistrict odisha\MyFlutterProject> git branch -vv
* feature/add-lines-in-README.md e6817c0 [origin/feature/add-lines-in-README.md] Shor description of change
  main                           c8addba [origin/main] Initial commit
PS D:\edistrict odisha\MyFlutterProject> git checkout feature/add-lines-in-README.md
M       README.md
Already on 'feature/add-lines-in-README.md'
Your branch is up to date with 'origin/feature/add-lines-in-README.md'.
PS D:\edistrict odisha\MyFlutterProject> git checkout -b feature/add-lines-in-README.md
fatal: a branch named 'feature/add-lines-in-README.md' already exists
PS D:\edistrict odisha\MyFlutterProject> git checkout -b feature/add-lines-in-README.md
fatal: a branch named 'feature/add-lines-in-README.md' already exists
PS D:\edistrict odisha\MyFlutterProject> git checkout -b feature/add-lines-githubinstructions-README.md
Switched to a new branch 'feature/add-lines-githubinstructions-README.md'
PS D:\edistrict odisha\MyFlutterProject> git add README.md

git commit -m "Add more lines to README describing git instruction"

git add .
git commit -m "Describe what changed (short summary)"

git push -u origin feature/add-lines-in-README.md

https://github.com/hive-cmky/MyProject/pull/new/feature/add-lines-in-README.md

# merge with a merge commit and delete branch on remote
gh pr merge --merge --delete-branch

# OR squash
gh pr merge --squash --delete-branch

# OR rebase
gh pr merge --rebase --delete-branch

git checkout main
git pull origin main
git branch -d feature/add-lines-in-README.md
# (if remote branch still exists)
git push origin --delete feature/add-lines-in-README.md

git fetch origin
git checkout feature/add-lines-in-README.md
git merge origin/main
# resolve conflicts in editor, then
git add <resolved-files>
git commit
git push

git remote -v
git branch -a

gh pr list
gh pr view --web <pr-number-or-url>   # opens PR in browser
