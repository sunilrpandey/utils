# Git

## Handy git commands
- git clone <repo_url> 
- .. more to add

## what is git ??
Git is one of the best version control tools that is available in the present market.
### Features
* Provides strong support for non-linear development.
* Distributed repository model.
* Super-fast and efficient performance.
* Cross-platform
* Code changes can be very easily and clearly tracked.
* Easily maintainable and robust.

## Prerequisite
Have email id ?? you are good to go

## Few easy steps to get going

## Git Setup

1. Create github account
2. Install it first and verify its version
```
	git --version
	Output : git version 2.17.1
```
3. Configure username and email as commmit will need it
```
	git config --global user.name <user_name>
	git config --global user.email <email>
```
and verify
```
	git config --global user.name
	git config --global user.email
```
One can list other config information
> 	git config --list
4. Set up ssh on your computer, it helps to avoid entering credential on every push and may be some other occasion

## Setup local and remote repository/server
### 1. First step 
Create repository on github  
### 2. For, local project to upload on remote repository
If you haven't connected your local repository to a remote server so far, add an alias at on local repository for remote repository. Anyways following are the steps 

* create project directory
* go to project directory and run 'git init'
* run
> git remote add origin <repo_url>  or 
> git remote add <remote_name> <repo_url> (If you want remote name other than origin)

Verify remote alias and urls by running
```
git remote //will show origin or <remote_name>
git remote -v // List all currently configured remote names and respective urls
```

### 3. For, Copy the repository and add your input
If you have to work on a project already uploaded to repository
```
git clone <repo_url>
```
### 4. Make changes and push it to repository
Take latest code, make directory updated 
> git pull origin master ( optional when history is creating issues --allow-unrelated-histories (is)

Make changes and add your file/directory to be uploaded  
> git add <file1> <file2> ..

Check the status i.e. what files are marked to be added, what are deleted etc
> git status

Commit changes with appropriate message  
> git commit -m "message"

Now push it to appropriate branch on remote 
> git push origin master

### .. and thats it

## More Options

### Add 
```
- add all or one file_name
- git add . // to add all the files in current directory 
- git add <filename>
- git add -p
- git rm --cached test_repo.txt // if added by mistake

```
### Commit
``` 
git commit -m "message"
git commit // will  open text box to enter commment, useful for multilien commment
``` 
### Push
Send changes to the master or specific branch to your remote repository
Note - origin is an alias on your system for a particular remote repository. It's not actually a property of that repository.
```
- git push origin master
- git push origin <branch_name>
Push all branches to your remote repository
- git push --all origin

```
### Get latest code 
Download objects and refs from remote repository for master branch

`git fetch origin master`

### Pull 
Pull (Fetch and merge) changes on the remote server to your working directory:
``` 
git pull
git pull origin master //To bring all changes from remote repository to local repository

```

### Diff 
View all the merge conflicts, View the conflicts against the base file, Preview changes, before merging
```
git diff, 
git diff --base <filename>, 
git diff <sourcebranch> <targetbranch>
```

### log
Display logs based on requirement granularity
``` 
- git log --graph // git log if you want to see the classic git branch timeline view
- git log --oneline
- git log --color --oneline --decorate=no --graph
```

### branch
Generally we dont work on master branch, but we create a feature branch, update our changes and merge it to branch
```
- git branch 
- git branch -a // to list all the remote branches as well
- git checkout <branch_name> 
- git checkout -b <branch_name> // if you want to create and switch to a new branch.
- git branch -d <branch_name> // Delete the feature branch from local repository, you can also use the -D flag which is synonymous with --delete --force instead of -d. This will delete the branch regardless of its merge status.
git push origin --delete <branch_name> // Delete a branch on your remote repository

- git branch --set-upstream-to=origin/<branch> master

```
### Reset
Reset local repository and point your local master branch to latest history fetched from remote server
```
git reset --hard origin/master<or branch>
git reset -- <filename> // revert a file
git reset <:mode:> <:COMMIT:> // mode can be --hard or --soft
```

### stash
``` 
- git stash // Save changes that you don’t want to  commit immediately.
- git stash in your working directory. 
- git stash apply if you want to bring your saved changes back.
- git stash pop // to get latest stashed changes
```

### merge
git merge <:branch_you_want_to_merge:>


## Miscellaneous

### Pull request
Pull request is raised to request your changes go live/main_code whether it is by same user from a new branch to master branch or by contributor to code owner. 
 - create another branch, make changes, add, commit and push 
 - Now to go git hub, you will see pull request agianst new branch
 - raise PR, resolve conflict if any and accept/deny merge pull request  
 
If you want to contribute to some project
1. fork the the repo
2. make changes, add, commit and push 
3. raise pull request whose link you can see against your branch which has code changes 
4. Code owner will get pull request notification in his pull request tab
5. Code owner reviews the pull request and your changes and accept/deny the changes.
6. If accepted changes goes to owners code base.

## How to ignore few files to be added to git
Create .gitignore file in local repo and add file/direactory names e.g.

``` 
	*.log
	vscode/
```
what if want exception for a file e.g. release.log when *.log is to be ignored, add belwo to .gitignore
```
!release.log
```
what if you want to force add some ignored file, -f to rescue.
> git add -f debug.log 


## TODO
1. rebase and merge

## References
[Pro Git book](https://git-scm.com/book/en/v2)

[kbroman git_tutorial](https://kbroman.org/github_tutorial/)

[Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/install-git)