# Rename
## On the branch you want to rename
git branch -m new-name

## On a different branch
git branch -m old-name new-name

# Delete branch
git branch -d branch_name

# Reset commit
git reset HEAD~

git reset --soft HEAD~1

git reset --hard HEAD~1

# Rebase
git rebase -i HEAD~3

# Cherry pick
git checkout master

git cherry-pick <commit-hash>

# Comparing two branches
git diff branch_one..branch_two

