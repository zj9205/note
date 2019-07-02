# Rename
### On the branch you want to rename
git branch -m new-name

### On a different branch
git branch -m old-name new-name

# Delete branch
git branch -d branch_name

# Reset commit
- git reset HEAD~
- git reset --soft HEAD~1
- git reset --hard HEAD~1

# Rebase
git rebase -i HEAD~3

# Cherry pick
- git checkout master
- git cherry-pick <commit-hash>

# Comparing two branches
git diff branch_one..branch_two

# See the changes between two commits
git diff hash_1 hash_2 > my.patch
git apply my.patch

# Create tag
- gco master
- git pull origin master
- git merge hash-number
- git tag <tagname>
- git push origin --tags
- git log --pretty=oneline --abbrev-commit v1.1..v1.2
- git push

# To remove a submodule you need to:
- Delete the relevant section from the .gitmodules file.
- Stage the .gitmodules changes git add .gitmodules
- Delete the relevant section from .git/config.
- Run git rm --cached path_to_submodule (no trailing slash).
- Run rm -rf .git/modules/path_to_submodule (no trailing slash).
- Commit git commit -m "Removed submodule <name>"
- Delete the now untracked submodule files rm -rf path_to_submodule
