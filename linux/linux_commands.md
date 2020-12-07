# Linux Commands

## Basics
### Check ubuntu version
> lsb_release -a


## Find 
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

### grep
- Mathes all the lines that starts with "hello" e.g. "hello world"

    grep “^hello” file1

- Mathes all the lines that ends with "done" for example "well done"

    grep “done$ file1 

- We can combine above two.

- All the lines that containes string or string with regex

    grep "[a-e]" file1 // all the lines that have any of a to e
    
    grep "[^a-e]" file1 //all the lines that have none of a to e
    
    - All the lines that have hello(ignore case)

        grep -i “hello”

    - Search "string" in given files

        grep "string" FILE_PATTERN
    
    - Search string can be in REGEX for as well
        
        grep REGEX filename

    - Checking full words not substring 
        
        grep -w "string"

    - Display N lines after match

        grep -A <N> "string" filename

    - Display N lines before match

        grep -B <N> "string" filename

    - Display N lines around match
    
        grep -C 2 "Example" demo_text

### Invert match using -v 
Outputs all the lines that does not have "string"

    grep -v "string" file1

which does not have all the pattern
    
    grep -v -e "pattern1" -e "pattern2"

### Display only the filenames which matches the given pattern (-l)

    grep -l "string" filename
    grep -l -r "string" dir

### REGEX and GREP
```
    ? The preceding item is optional and matched at most once.
    * The preceding item will be matched zero or more times.
    + The preceding item will be matched one or more times.
    {n} The preceding item is matched exactly n times.
    {n,} The preceding item is matched n or more times.
    {,m} The preceding item is matched at most m times.
    {n,m} The preceding item is matched at least n times, but not more than m times.    
```

### Highlighting the search using GREP_OPTIONS
Set environemnt variable

    export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'

### Counting the number of matches/not matches (-c)

    grep -c "pattern" filename
    grep -v -c "pattern" filename


## Checking Diskspace 
- df 
- df -iv
- du diskspace used by specified file/dir

## Litte theory notes
Unix file system
disk space alloted to unix file system are made up of blocks
and all the blocks  are logically divided into 4 parts 
- Boot block - has bootstrap loader
- Super block - describes file system
- Inode table (meta data about files)
- Data block - actual file content