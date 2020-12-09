# Linux Commands

## Basics
### Check ubuntu version
> lsb_release -a

## Ag utility - similar to grep
Show pattern in all files underneath

    $ ag pattern 

Show only filename 

    $ ag -g pattern

## find directories recursively with given name is current directory and delete them
> find . type d -name ".git*" -exec rm -rf {} +  OR
> find . type d -name ".git*" | xargs rm -rf 

# files related
- touch filename  //create new file/change modification time of exisiting file
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
- ls -i // inode number associated with file
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

## Directory Commands
- mkdir/cd/
- mkdir -p out/in/innermost
- mkdir -m 754 dirname -> dir with given permission irrespective of umask
- rmdir removes only if it is empty

## User management
- logname/whoami/date

## File commmands
- wc -l(numlines), -w(num words), -c(numchars)
- sort filename
- soft -oresult file1 file2 file3
- cut -f 2-7 filename

## Grep Commands 
[Grep Notes](grep_commands.md)

### Combine find/grep, grep "text" from the found files

    find . -iname '*file*' | xargs -0 grep pattern

## Checking Diskspace 
- df 
- df -iv
- du diskspace used by specified file/dir

## Misc 
- tail -n 7 filename // last 7 lines , default is 10
- tail -3 filename // last 3
- tail -v filename // preceded by file name
- tail -q file1 file2 // not precided by filename
- tail +25 filename // lines from 25th line till end 

## Litte theory notes
Unix file system
disk space alloted to unix file system are made up of blocks
and all the blocks  are logically divided into 4 parts 
- Boot block - has bootstrap loader
- Super block - describes file system
- Inode table (meta data about files)
- Data block - actual file content