# Linux Bash Environment
See the PATH variables before we start shell
```sh
set | less 
printenv | less // almost same as set
```
Note: less is used for page by page display , only set will take you to end of it 

## Files you see in your home directory
```
.bash_history   : Keep history of bash command
.profile        : First file to execute, Checks the .bashrc if there and read it
.bashrc         : Does many thing, including setting path, aliases, prompt etc
```
Note: . .bashrc means read .bashrc file

### Where this .bashrc comes from 
System has a universal file for all user in /etc/bash* and default .bashrc and .profile files that are loaded on user creation is in /etc/skel  
> ls -a /etc/skel 

## Aliases 
Two kind of aliases are there
1. set on command prompt only
```sh
alias nano='nano -l' 
```
Now when you run nano command it will effectively run nano -l.  
What if you want to run without alias, precede command by \ for example
```sh
\nano
```
but this is not permanent, if you want it permanant for the user go for second kind

2. Set aliases in .bashrc file
Go to bottom(Preferably to avoid messing up it) of .bashrc file and enter aliases entry
```sh
alias nano='nano -l' 
```
Note: you have to read the .bashrc file(. .bashrc) before you see the effect

## Add function to .bashrc file 

You can add function as well in .bashrc and it will be saved in memory therefore user can use it whenver it is required.  
Below example shows memory usage when you call this function
```sh
memory-usage() {
    echo "Memory Usage"
    /usr/bin/free -h

    echo $'\n'$"Disk Usage:"
    /bin/df -h /dev/sd[a-z][1-9] 2>/dev/null
}
```
Now just call memory-usage to see it
```sh
$ memory-usage
```
