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

    - Combination 

        grep grep grep.txt -A 2 -B 1        

### Invert match using -v 
Outputs all the lines that does not have "string"

    grep -v "string" file1

which does not have all the pattern
    
    grep -v -e "pattern1" -e "pattern2"

### Display only the filenames which matches the given pattern (-l)

    grep -l "string" filename
    grep -l -r "string" dir    

### Exclude directory to search

    grep -r --exclude-dir='.git' "string" .
### Shows only matches string(generally greps shows whole line)
Shows all the strings starts with "start" and end with "end" and anything in between.
    
    grep -o "start.*end" filename

### Shows position of the match in the line 

    grep -o -b "pattern" filename

### Shows the line number while displaying the output (-n)

    grep -n "string" filename
### REGEX and GREP
- ".ello" - Any character followed by "ello"

- Zero or more occurrence (\*), the pattern ‘1\*’ matches zero or more ‘1’.

- One or more occurrence (\\+) of previous character

- zero or one occurance of previous character(\\?)

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

### Counting the empty lines (^$)

    grep -c "^$" filename

### Grep OR/AND/NOT

    grep 'pattern1\|pattern2' filename
    grep -E 'pattern1|pattern2' filename

No AND operator but can be achieved using

    grep -E 'pattern1.*pattern2' filename

First and Second in that order only

    $ grep -E 'First.*Secpmd' employee.txt 

First and Second in any order only

    $ grep -E 'First.*Secpmd | Secpmd.*First' employee.txt filename

Use multiple grep, | (pipe)) & -E option to get AND behavior, below output contains "First" and "Second" in the smae line

    grep -E "First" filename | grep -E "Second"

(egrep ~ grep -E) A combination of grep when you include "first" or "second" but ignore "third" 
    
    egrep 'first|second' filename | grep -v third