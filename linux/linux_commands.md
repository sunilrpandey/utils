# Linux Commands

## Use cases
### Combine find/grep, grep "text" from the found files

    find . -iname '*file*' | xargs -0 grep pattern

## Grep Commands 
[Grep Notes](grep_commands.md)

## Basics
lsb_release -a  //Check ubuntu version  
ps -i 
curl <url> -o <filename>
curl -I <url>
read -t 3 -n 1
if[$? = 0]

## sed - stream editor
cat filename | sed 's/i/I/' # replace i with I but only first in the line
cat filename | sed 's/i/I/g' # replace all i with I, g-> global

or similar 
sed 's/i/I/g' filename >newfilename
sed -i 's/i/I/g' filename // will modify filename itself
sed -i 's/linux/windows/g' filename // will modify filename itself

## Debug your script
bash -x ./scriptname.sh
will give line by line run 

add on bash header only
#! /bin/bash -x 

set up region to debug
sandwitch your problematic code between set -x and set +x
set -x
.problematic code
set +x 
### Ag 
$ ag pattern  // A search utility similar to grep to search pattern  
$ ag -g pattern  //         Shows only filenames having pattern

### Tar
Compress/Extract file using tar, .tar.gz is same as .tgz 
> tar -cvzf file.tar.gz testdir  // Compress testdir to file  
> tar -czvf archive.tgz *.pdf  // compress all multipel files to archive  
> tar -xzvf projects.tar.gz // Uncompress  
> tar -xzvf projects.tar.gz -d /tmp // Uncompress to /tmp

### ssh
    ssh your_username@host_ip_address

### scp
    scp file.txt remote_username@<ip>:/remote/directory

    scp -P <port_no> file.txt remote_username@<ip/hostname>:/remote/directory //SSH on remote host is listening on a port other than default(22)

    scp -r /local/directory remote_username@<ip>:/remote/directory // for directories

    scp remote_username@<ip_address>:/remote/file.txt /local/directory
sss
    scp user1@host1.com:/files/file.txt user2@host2.com:/files

    

## find directories recursively with given name is current directory and delete them
> find . type d -name ".git*" -exec rm -rf {} +  OR
> find . type d -name ".git*" | xargs rm -rf 
c
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

### Mode of operation in VI
- Command Mode : keys pressed are not visible,for cursor movement etc
- Insert Mode : to insert new text etc 
- Ex Command Mode : give commands at the command line, bottom lien of the vi screen in called command line   
Note: Press i to go to insert mode, esc to leave insert mode and enter commmand mode

vi 
x - delete one character  
nx - delete n characters   
press R to override characters while typing  
w - move characters word by word on right
b - move characters word by word on left(backword)  
e - go to end of the word, constant pressign move forward with cursor at end of the words  
H, M , L : mvoe to first, mid and last line of screen  
ctrl + f : scroll one window forward  
ctrl + b : scroll one window backward

### Enter text  
a : shift to input mode and append text after the cursor  
A : shift to input mode and append text at end of line  
i : shift to input mode and append text at the cursor  
I : shift to input mode and append text at begining of line  
o - shift to input mode and open a new line below current line  
O - shift to input mode and open a new line aove current line

### Delete text in vi
x - delete char at curent position  
X - delete char to the left of  cursor  
dw - delete a word from cursor to next space(including)  
dd - delete current line  
nx, ndw, ndd : delete n chars, words or lines  
d0 - delete current line to left till begining of line from cursor  
d$ : delete line from cursor to the end of file  

### misc vi command
. : Repeat action performed by last command  
u : undo  
~ : toggle character case(lower to upper and viceversa)
ctrl + l : clear the window
