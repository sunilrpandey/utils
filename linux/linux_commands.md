# Linux Commands

## shell tricks
set -eu // stops when error happens, undefined var is error  
set -o pipefail


## Use cases
### Combine find/grep, grep "text" from the found files

    find . -iname '*file*' | xargs -0 grep pattern
    find . -type d
    find . -type f
    find . -mtime -2 

### find directories recursively with given name is current directory and delete them
    find . type d -name ".git*" -exec rm -rf {} +  OR
    find . type d -name ".git*" | xargs rm -rf 

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
```sh
    cat filename | sed 's/i/I/' # replace i with I but only first in the line  
    cat filename | sed 's/i/I/g' # replace all i with I, g-> global

    or similar   
    sed 's/i/I/g' filename >newfilename  
    sed -i 's/i/I/g' filename // will modify filename itself  
    sed -i 's/linux/windows/g' filename // will modify filename itself  
```
## Debug your script
    bash -x ./scriptname.sh //will give line by line run   
    #! /bin/bash -x //add on bash header only

We can set-up region to debug, to do this sandwitch your problematic code between set -x and set +x
```sh
    set -x
    ...
    code to debug
    ...
    set +x 
```
## Ag : A search utitlity
```sh
    $ ag pattern        // A search utility similar to grep to search pattern  
    $ ag -g pattern     // Shows only filenames having pattern
```
## Tar
Compress/Extract file using tar, .tar.gz is same as .tgz 
```sh
    tar -cvzf file.tar.gz testdir  // Compress testdir to file  
    tar -czvf archive.tgz *.pdf  // compress all multipel files to archive  
    tar -xzvf projects.tar.gz // Uncompress  
    tar -xzvf projects.tar.gz -d /tmp // Uncompress to /tmp
```
### ssh

    ssh your_username@host_ip_address

### scp
```sh 
    scp file.txt remote_username@<ip>:/remote/directory

    scp -P <port_no> file.txt remote_username@<ip/hostname>:/remote/directory //SSH on remote host is listening on a port other than default(22)

    scp -r /local/directory remote_username@<ip>:/remote/directory // for directories
    scp remote_username@<ip_address>:/remote/file.txt /local/directory
    scp user1@host1.com:/files/file.txt user2@host2.com:/files
```

## files related
``` sh
    touch filename      //create new file/change modification time of exisiting file
    cat > filename      // entrer text to filename, followed by control d
    cat filename        // display content
    cat file1 file2 >> newfile  // concatenate
    cat file1 file2             // shows content of file2 immediately after file1

    ..                          // means parent directory
    cp , cp -r , cp -i (interactive)
    rm , rm -r , rm -i, rm -rf 
    rm -r *                     // remove current directory completely
    mv
    ls
```

## More ls
All the commands can used with file having wild characters(regx)
- ?ain -> main, gain
- ls [aeiou]* // starting with vowel
- ls [!aeiou]* // starting with not vowel
- ls -R(recursively in sub dir too), -h(human readable), -r(reverse)
- ls -ltr(latest modified as last)
- ls - ls(by size)
- ls -i // inode number associated with file
- ln (another link to file, need to explore)
- ls -x, -u(access tieme) 
- ls -d (forces listing of directory)
- ls -F lists exes with *, dir with / and symbolic link with @

## Permissions
read (4), write(2) execute(1)
- chmod 700 file(7 for user-0 for group-0 for others)
- chmod +w file 
- chmod go-x (remove execute permission from group and others)
- default permission depends on umask value set
- chmod u+x filename
- chmod ugo+z filename or chmomd a+x or chmod +x //default is all 
- chmod a+r, u+wx,o+x filename // multiple chmod in one go
- chmod u+x file1 file2 file3
- chmod -R a+x dirname 
- chmod -R 755 *

Note:  
- Read permission for directory means you can see dirs in listing
- Write permission means you can copy files in the direcotry or create another directory inside
- Execute means you can pass through directory, you can not explore /home/xyz/dir1/dir2/dir3 if you dont have exec permission in intermediate directories


   Default permission depends on default setting for (666) for regular files and 777 for directories.
   But default permission is deduced by filtering 'umask' whose default value is 022 which can be set  
    > $ umask // which give 666-022 = 644 for files and 777-022 = 755 for directories



## Hardlink/Softlink(Symbolic link) 
Use ln command to create another link(name) for a file (both the files will have same inode number)
> ln file.txt ../dir1/dir2/file2.txt

Removing one of the file will reduce link count by 1, and it will be removed completely once link count reduces to zero. Problem here is that you can not create link of directories or  you can not create link outside filesystem.    
Resolution to above problem is symbolic link or soft link, use -s option to do the same  
> ln -s /usr/bin bin. 

Here symbolic is just a directory entry containing the pathname, it does not occupy space on disk.  
Ref : Sumitabha das





## Alias 
You can create alias in .bashrc for default functionality of any command, we generally do this for setting python3 as default python
```sh
alias ls="ls -l" 
alias python='python3'
```

## Directory Commands
    - mkdir/cd/
    - mkdir -p out/in/innermost
    - mkdir -m 754 dirname -> dir with given permission irrespective of umask
    - rmdir dir //removes only if it is empty
    - rmdir -p dir1/dir2 


## User management
    logname/whoami/date

## File commmands
    - wc -l(numlines), -w(num words), -c(numchars)
    - sort filename
    - soft -oresult file1 file2 file3
    - cut -f 2-7 filename


## Checking Diskspace 
    - df
    - df -t(total) /tmp -> also shows size of disk space in each file system
    - df -iv
    - du diskspace used by specified file/dir

## Size of specific directory (disk usage)
    - du /dir
    - du -s* 



## Misc 
    - tail -n 7 filename // last 7 lines , default is 10
    - tail -3 filename // last 3
    - tail -v filename // preceded by file name
    - tail -q file1 file2 // not precided by filename
    - tail +25 filename // lines from 25th line till end 

## Little theory
Unix file system: disk space alloted to unix file system are made up of blocks
and all the blocks  are logically divided into 4 parts 

    - Boot block - has bootstrap loader
    - Super block - describes file system
    - Inode table (meta data about files)
    - Data block - actual file content

