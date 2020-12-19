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
reset network manager generally in ~/bin/nr
sudo systemctl restart network-manager 
/usr/bin/time  
show ~/filename.txt
-  You can run a file by just giving its name if it is in ~/bin otherwise you may need to precede it by ~/
you can run a command from .bashrc
/home/linus/bin/1

//sshto
script
#!/bin/bash
#ssh login shorthand command 

ssh -X 121.123.34."$1"

ref: https://www.youtube.com/watch?v=dDyoNC33TY8&t=1770s


So three way
- thorugh alias
- through funciton 
- through little scritp in ~/bin


upgrade - install newest version of all package  
dist-upgrade - upgrade + handle changing dependencies  
full-upgrade - full-upgrade performs the function of upgrade but may also remove installed packages if that is required in order to resolve a package conflict

apt-get autoremove -yy
at-get autoclean
do scripting and put it in any folder what you see when ecoh $PATH

$HOME/bin is added to PATH 
set -e : if error stop immediately .. genererally put on top of script

a script has three 

cat << _EOF_ -> all to script thill it encounters _EOF_
