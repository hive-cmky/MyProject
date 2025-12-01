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
