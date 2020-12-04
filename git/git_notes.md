# Git
- [ ] [what is git](#whatisgit)
- [ ] [Setup](#setup)
	- [Setup local and remote repository](#reposetup)
	- [Clone the repository and add your input](#cloneit) 
- [ ] [Change Pipeline](#fullflow)
- [ ] [What is Pull Request](#pullreq) 
- [ ] [Handy Git Commands](#cmds)
- [Clone](#clone) , [Add](#add),[rm](#remove) [Stash](#stash), [Commit](#commit) ,  [Push](#push) , [Pull](#pull) , [Merge](#merge)
- [Status](#status), [Reset](#reset) , [Log](#log), [Diff](#diff) , [Blame](#blame)
- [Branch](#branch) , [Submodule](#submodule) , [Clean](#clean), [Fetch](#fetch)



## Tags

- [ ] [Version your code, Tag it ](#tag)
- [ ] [List](#listtag), [Create](#createtag), [Push](pushtag), [Delete](#deletetag)
- [ ] [Get tagged Code](#taggedcode)
- [ ] [Create branch from existing tag](#brnachfromtag)

## Misc Usage
- [ ] [Ignore files/dirs to add](#ignore)
- [ ] [Rename Branch](#renamebranch)

## <a name='whatisgit'> what is git ?? </a>
Git is one of the best version control tools that is available in the present market.
### <a name='feature'> Features </a>
* Provides strong support for non-linear development.
* Distributed repository model.
* Super-fast and efficient performance.
* Cross-platform
* Code changes can be very easily and clearly tracked.
* Easily maintainable and robust.

## Prerequisite
Have email id ?? you are good to go

## Few easy steps to get going

## <a name=setup>Git Setup</a>

1. Create github account
2. Install it first and verify its version
```
	apt-get install git
	
	git --version	
	=> Output : git version 2.17.1
```
3. Configure username and email as commmit will need it
```
	git config --global user.name <user_name>
	git config --global user.email <email>
```
And verify
```
	git config --global user.name
	git config --global user.email
```
One can list other config information

		git config --list
4. Set up ssh on your computer, it helps to avoid entering credential on every push and may be some other occasion

	```
	ssh-keygen -t rsa -b 4096 -C "your_email@example.com"	 
	eval "$(ssh-agent -s)"

	ssh-add ~/.ssh/id_rsa
	```
	..and copy it and add it to github's ssh keys.
	BTW you can copy using 
	> xcopy -selection clipboard < ~/.ssh/id_rsa.pub

## <a name=reposetup>Setup local and remote repository/server</a>
### 1. First step 
Create repository on github  
### 2. For, local project to upload on remote repository
If you haven't connected your local repository to a remote server so far, add an alias at on local repository for remote repository. Anyways following are the steps 

* create project directory
* go to project directory and run 'git init'
* run
> git remote add origin <repo_url>  or 
> git remote add <remote_name> <repo_url> (If you want remote name other than origin)

repo_url is nothing but url we generally use to clone from github

Verify remote alias and urls by running
```
git remote //will show origin or <remote_name>
git remote -v // List all currently configured remote names and respective urls
//other commands to know about remote/origin 
git remote show origin
git config --get remote.origin.url // to know the url
```

### 3. <a name=cloneit>For, Copy the repository and add your input</a>
If you have to work on a project already uploaded to repository
```
git clone <repo_url>
```
### <a name=fullflow>4. Make changes and push it to repository</a>
Take latest code, make directory updated 

	git pull origin master ( optional when history is creating issues --allow-unrelated-histories

Make changes and add your file/directory to be uploaded  
```
git add _file1_ _file2_ .. OR
git add . 	// add every changes down under
```
<a name=status></a>
Check the status i.e. what files are marked to be added, what are deleted etc

	git status		// will show folders only which are changed
	git status -u    // to see complete path of files, not only folders 

Commit changes with appropriate message  
```sh
git commit -m "message"
git commit --amend // add to previous 	commit, no comment changed
git commit --amend -m "update message" // add to previous commit, no comment  
git commit // will prompt you to add multiline comment
git commit -a // add and multiline comment in one go
```

Now push it to appropriate branch on remote , origin is actually a pointer/ref to remote 

	git push origin master

### .. and thats it

## <a name='cmds'> Handy git commands </a>

### <a name=clone>clone</a> 
```sh
git clone <repo_url> 
git clone <repo_url> -b <branch_name>  // clone a particular branch
```

### <a name=add>Add</a>
```
add all or one file_name
- git add . // to add all the files in current directory 
- git add <filename>
- git add -p (for chunks)
```
### <a name=remove>rm</a>
```
git rm --cached test_repo.txt // if added by mistake
```
### <a name=commit>Commit</a>
``` 
git commit -m "message"
git commit // will  open text box to enter commment, useful for multilien commment
``` 
### <a name=push>Push</a>
Send changes to the master or specific branch to your remote repository
Note - origin is an alias on your system for a particular remote repository. It's not actually a property of that repository.
```
- git push origin master
- git push origin <branch_name>

Push all branches to your remote repository
- git push --all origin

```
### <a name=fetch>Get latest code </a>
Download objects and refs from remote repository for master branch

	git fetch origin master

### <a name=pull>Pull </a>
Pull (Fetch and merge) changes on the remote server to your working directory:
``` 
git pull
git pull origin master //To bring all changes from remote repository to local repository

git pull <repo_url> 

Use above to download the code, add remote origin to setup local/remote (checked with https://.....something.git)

```

### <a name=diff>Diff</a>
View all the merge conflicts, View the conflicts against the base file, Preview changes, before merging
```
git diff, 
git diff --base <filename>, 
git diff <sourcebranch> <targetbranch>
```

### <a name=log>log</a>
Display logs based on requirement granularity
``` 
- git log --graph // git log if you want to see the classic git branch timeline view
- git log --oneline
- git log --color --oneline --decorate=no --graph
- git log --graph --decorate --pretty=oneline --abbrev-commit
```
### <a name=blame>blame</a>
To know the history of a file
```
	git blame <file_name>
```
### <a name=branch>branch</a>
Generally we dont work on master branch, but we create a feature branch, update our changes and merge it to branch
```
- git branch // gives list of branch 
- git branch -a // to list all the remote branches as well
- git checkout <branch_name> 
- git checkout -b <branch_name> // if you want to create and switch to a new branch.

- git branch --set-upstream-to=origin/<branch> master

Delete the feature branch from local repository, you can also use the -D flag which is synonymous with --delete --force instead of -d. This will delete the branch regardless of its merge status.

- git branch -d <branch_name> 

Deletes a branch on your remote repository
- git push origin --delete <branch_name> 


```
### <a name=reset>Reset/Revert</a>
Reset local repository and point your local master branch to latest history fetched from remote server
```
git reset --hard origin/master<or branch>
git reset -- <filename> // revert a file
git reset <:mode:> <:COMMIT:> // mode can be --hard or --soft
git checkout -- <filename> to revert file // reset a file

Discard all local changes to all files permanently
git reset --hard
git reset HEAD <file>
```

### <a name=stash>stash</a>
``` 
Discard all local changes, but save them for possible re-use later, changes that you don’t want to  commit immediately.
- git stash 
- git stash in your working directory. 
- git stash apply if you want to bring your saved changes back.
- git stash pop // to get latest stashed changes
```

### <a name=merge>merge</a>
Merge the branch with current branch and commit in one go

	git merge <:branch_you_want_to_merge:> 

Please dont commit after merge, I need to check if there is any conflict present. 

	git merge --no-commit --no-ff 



### <a name=clean>clean </a>
	git clean -df 

### <a name=submodule>submodule</a>
	git submodule update --init --recursive

## Miscellaneous

### <a name=pullreq>Pull request</a>
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


## <a name=tag> Tag your code </a>
 Tag is simply a "pointer" to a certain commit (not a branch). Tag has no relationship with branch. It is way to version your code when you reach certain milestone.
 ### <a name=listtag>List tags</a>
 ```
 git tag
 git tag -l "ver.*"
 ```
 ### <a name=createtag>Create Tag</a>
 ```
 git tag <tagname> <commit_id>(optional) //if not present will take HEAD of curretn branch
 git tag -a <tag_name> // will open editor to add meta data
 git tag -a <tag_name> -m "enter metadata for the tag/version"
 ```
 ### <a name=pushtag>Push tags to remote branch</a>
	git push origin <tag_name> 
 If you have created multiple tags and want to push all of it 

	git push origin --tags

### <a name=deletetag>delete git tags</a>
Delete local tags

	git tag -d <tag_name>
Delete remote tag

	git push origin :refs/tags/<tag_name>

You can checkout `tag` as branch

### <a name=taggedcode>Get tagged Code </a>
	git checkout <tag_name>

This puts the repo in a detached `HEAD` state. This means any change made will not update the tag. They will create a new detached commit. This new detached commit will not be part of any branch and will only be reachable directly by the commits SHA hash. \
So its good to create a branch 

	git checkout -b <branch_name>

### <a name=brnachfromtag>Create branch from existing tag</a>
	git checkout -b <new_branch_name> <existing_tag_name>
  
 ## <a name=ignore>How to ignore few files/dir to be added to git</a>
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

## <a name = renamebranch>Rename branch </a>
Go to branch to be renamed

	git checkout <old_name>

Rename branch 

	git branch -m <new_name>

If you had already pushed it to remote repository
```sh
git push origin -u <new_name>
git push origin --delete <old_name>
 ```

## TODO
## <a name=squashcommits>How to squash your commits</a>


## References
[Pro Git book](https://git-scm.com/book/en/v2)

[kbroman git_tutorial](https://kbroman.org/github_tutorial/)

[Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/install-git)
