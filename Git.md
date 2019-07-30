
.gitignore

### checkout log 
- git log 
- git reflog

### rollback to the last commit
- git checkout fileNmae 

### adding/removing
- git add .
- git rm -- cached -r .
- git rm --cached <file>

### get git log of the target file
- git log --pretty=oneline <file>

### init
- git init
- git remote add newRemoteName __link__
- git remote add origin git@github.com:dhalperi/test.git
- git push -u newRemoteName branchName(ex. master)
- git push -u origin master

### Stash
- git stash
- git stash apply
- git stash clear
To list the stashed modifications
- git stash list
To show files changed in the last stash
- git stash show



# Branch
- git checkout master

### Rename
- On the branch you want to rename:
git branch -m new_name
- On a different branch:
git branch -m old_name new_name

### Delete branch
git branch -d branch_name

### Create branch
- git checkout -b branch_name
- git checkout -b branch_name a9c146a09505837ec03b

### rebase branch
- git checkout new_branch
- git rebase base_branch

### Merge branch
- git checkout old_branch
- git pull
- git merge new_branch/hash_number

### If have conflict
- git checkout --ours index.html
- git checkout --theirs _layouts/default.html



# Commit
### change newest commit message
git commit --amend 

### Rebase
git rebase -i HEAD~3

### Reset commit
- git reset HEAD~
- git reset --soft HEAD~1
- git reset --hard HEAD~1
- git reset --hard hash_number

### Cherry pick
- git checkout master
- git cherry-pick <commit-hash>



# Comparing
### between two branches
- git diff branch_one..branch_two


### See the changes between two commits
- git diff hash_1 hash_2 > my.patch
- git apply my.patch

### between local and remote branch
- git fetch
- git diff master origin/master

### check one file
- git diff fileName



# Create tag
- gco master
- git pull origin master
- git merge hash_number
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
