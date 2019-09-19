
.gitignore

### Init
- git init
- git remote add newRemoteName __link__
- git remote add origin git@github.com:dhalperi/test.git
- git push -u newRemoteName branchName(ex. master)
- git push -u origin master

### Stash
- git stash
- git stash apply
- git stash clear
#### To list the stashed modifications
- git stash list
#### To show files changed in the last stash
- git stash show



# Branch
### Checkout branch
- git checkout branch_name

### Rename
#### On the branch you want to rename:
- git branch -m new_name
#### On a different branch:
- git branch -m old_name new_name

### Delete branch
- git branch -d branch_name

### Create branch
- git checkout -b branch_name
- git checkout -b branch_name hash_number

### Rebase branch
- git checkout new_branch
- git rebase base_branch

### Merge branch
- git checkout old_branch
- git pull
- git merge new_branch/hash_number

### If have conflict
- git checkout --ours index.html
- git checkout --theirs _layouts/default.html



# Change
### Undoing a change
- git reflog
- git reset --hard HEAD@{5}

### Adding
- git add .

### Removing from the tree
- git rm --cached file_name
- git rm -r --cached directory_name

### Removing from the staging area
- git reset HEAD file_name

### Nuke all made changes for good, it will remove staged and unstaged changes
git reset --hard

### To only remove unstaged changes in the current working directory
- git checkout -- .



# Commit
### Change newest commit message
- git commit --amend 

### Rebase
- git rebase -i HEAD~3

### Reset commit
- git reset HEAD~
- git reset --soft HEAD~1
- git reset --hard HEAD~1
- git reset --hard hash_number

### Cherry pick
- git checkout master
- git cherry-pick hash_number
#### cherry pick without commit
- git cherry-pick -n hash_number
#### cherry pick A to B, without A
- git cherry-pick A..B
#### cherry pick A to B, include A
- git cherry-pick A^..B

### Rewriting History
[Splitting a Commit](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)



# Comparing
### Between two branches
- git diff branch_one..branch_two

### See the changes between two commits
- git diff hash_1 hash_2 > my.patch
- git apply my.patch

### Between local and remote branch
- git fetch
- git diff master origin/master

![Git-Diff](Resources/Git-Diff.png)

### check unstaging changes (index vs. working tree)
#### Shows the changes between the working directory and the index. This shows what has been changed, but is not staged for a commit.
- git diff
- git diff file_name

### check diff between commits
- git diff A B
- git diff A:file_name B:file_name

### check staging changes, with last commit (head vs. index)
#### Shows the changes between the index and the HEAD (which is the last commit on this branch). This shows what has been added to the index and staged for a commit.
- git diff –cached
- git diff –cached file_name

### check unstaging changes with last commit (head vs. working tree)
#### Shows all the changes between the working directory and HEAD (which includes changes in the index). This shows all the changes since the last commit, whether or not they have been staged for commit or not.
- git diff HEAD
- git diff HEAD file_name



# Log
### Checkout commit history 
- git log 

### Checkout reference log 
- git reflog

### Get git log of the target file
- git log --pretty=oneline file_name

### Rollback to the last commit
- git checkout fileNmae 



# Submodule
### To remove a submodule you need to:
- Delete the relevant section from the .gitmodules file.
- Stage the .gitmodules changes git add .gitmodules
- Delete the relevant section from .git/config.
- Run git rm --cached path_to_submodule (no trailing slash).
- Run rm -rf .git/modules/path_to_submodule (no trailing slash).
- Commit git commit -m "Removed submodule <name>"
- Delete the now untracked submodule files rm -rf path_to_submodule



# Tag
### Create
- gco master
- git pull origin master
- git merge hash_number
- git tag tag_name
- git push origin --tags
- git log --pretty=oneline --abbrev-commit v1.1..v1.2
- git push

### Rename
- git tag new_name old_name
- git tag -d old_name
- git push origin :refs/tags/old_name
- git push --tags

### Delete
- git tag -d tag_name
- git push origin :refs/tags/tag_name
#### Alternative approach
- git push --delete origin tag_name
- git tag -d tag_name


