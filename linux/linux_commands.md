# Linux Commands

## Basics
### Check ubuntu version
> lsb_release -a


## Find 
## find directories recursively with given name is current directory and delete them
> find . type d -name ".git*" -exec rm -rf {} +  OR
> find . type d -name ".git*" | xargs rm -rf 

# files related
- touch filename 
- cat > filename -> entrer text to filename, followed by control d
- cat filename  -> display content
- cat file1 file2 >> newfile // concatenate

- cp /cp -r , 
- rm , rm -r , rm -i, rm -rf 
- mv
- ls
All the commands can used with file having wild characters(regx)
- ?ain -> main, gain
- ls [aeiou]* // starting with vowel
- ls [!aeiou]* // starting with not vowel
- ls -R(recursively in sub dir too), -h(human readable), -r(reverse)
- ls -ltr(latest modified as last)
- ls - ls(by size)
- ln (another link to file, need to explore)

## Permissions
read (4), write(2) execute(1)
- chmod 700 file(7 for user-0 for group-0 for others)
- chmod +w file 
- chmod go-x (remove execute permission from group and others)
- default permission depends on umask value set

## alias 
You can create alias in .bashrc for default functionality of any command, we generally do this for setting python3 as default python
alias ls="ls -l" 
alias python='python3'

