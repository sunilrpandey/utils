# Git Tricks

## Check log from current branch excluding master/main
```
git log origin/master..HEAD
```
## Cherry-Pick changes from one branch to another
```sh
- go to source branch, or pull reqeust if you want to cherry pick from PR and identify commits , you can do this using
    git log --oneline as well
- go to target branch and
    git cherry-pick <commit-id>
- If it has conflicts
    git add <files>
    do 
       continue ; git cherry-pick --continue
    while new changes
    git push -f
g    


```

## Show branch name on command prompt.

Replace if/else part in .bashrc by code below. Please note parse_git_branch() is added to it

```sh
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
```

## Add global .gitignore
Create a global file anywhere may be in home folder and add it to git configuration.
```sh
git config --global core.excludesfile ~/.global_gitignore
```

## Ignore already added/committed file 
To ignore already added/committed file in addition .gitignore update, do the following
```sh
git rm --cached filename 
git rm -r --cached dirname
```
To remove it from git and local system, omit `--cached`. 
```
git rm -r -n dirname //-n does dry run and displays files deleted
```
