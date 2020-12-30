
# Use cases
Read file content into a variable
```sh
#!/bin/sh
value=`cat file.txt`
echo "$value"
```
without cat
```sh
value=$(<file.txt)
echo "$value"
```
Do it line by line using loop
```sh
while read line; do    
    echo $line    
done < file.txt
```
Iterate through files in a directory(iterating file starting with fl_ and adding ext)

```sh
for file in fl_*
do
        mv $file $file.text
done
```
Other use case : 
for file in dir1/dir2/*.txt
for v in dir1/a??
for tbl in {2..20..2}
while true // for infinite loop
white : // for infinite loop

# Basics
> which bash // should output /bin/bash
> can read a script used for config etc from another script and access its variables

## shell tricks
    set -eu // stops when error happens, undefined var is error  
    set -o pipefail

# Shell Script Syntaxes

```sh
if [-w filename]    #If user has file write permission
if [-r $file -a -w $file -a -w $file]   # check for read/write/execute
if [! -d dirname] // is not a directory
if [! -d dirname] // is not a directory
if [str1 = str2]
if [str1 != str2]
if [-n str]         # if lenght of string is greater than zero
if [-z str]         # if lenght of string is zero
if [str]            # if string is not null string
```

## keyboard input
```sh
echo "enter two numbers"
read n1 n2
```
if using && etc use [[]] if -a -o etc can use []
## Logical operator
-a,, -o, ! as (AND, OR, NOT)
[! -d dirname] // is not a directory

## If else
```sh

if [$x -gt 0] # -lt, le,ge,ne,eq
then 
    echo ..
elif [x -lt -100]
    echo ..
else 
    echo ..
fi
```
## Switch 
Options can be anything, integer, string, characters regex etc
- 1),
- dog),
- [a-z],
- ?),
- [aeiou]*)
- *(0-9)
- *)    # default choice, any pattern



```sh
echo "Enter option"
read num

case $num in
    1) echo "You entered one"
    ;; # acts like break
    2) echo "You entered two"
    ;;
    3) echo "You entered three"
    ;;
    *) echo "Out of range"
    ;;
esac
```
If we have no default case and no match is found nothing will be done.

## Loop
### While
```sh
n = 1
while [num -lt 10]
do 
    echo $n
    n = $((n+1))
done 
```
### Until loop
```sh
n = 1
until [num -ge 10]
do 
    echo $n
    n = $((n+1))
done 
```
### For loop
```sh
#for (( i = 0; i < 10; i++))
for i in 1 2 3 4 5 # {1..10} or {1..2..20} {start..step..end}
 do 
    echo $i    
done 
```
### Input
```sh
echo $1 $2 $3 # arguments to script $0 is script name
s.sh a b c

args = ("$@") # unlitimited input
echo ${args[0]} ${args[1]} ${args[2]} # arg0 is first argument
echo $@ # prints all argument
echo $# # lenght of the array

while read line
do 
echo "$line"
done < "${1:-/dev/stdin}" # taking input from terminal

: '
command : ./script.sh file_name(if not given it will consider from terminal)
'
```
### Output Stdout/stderr
```sh

>  file make file standard output, >> for append
<  file make file standard input
<<  word read upto the 'word' or end of file 

ls -al 1>stdout.txt 2>stderr.txt
ls -al >stdout.txt # stdout is default
ls -al >both.txt 2>&1 # file for both
ls -al >&both.txt # file for both
```

## Functions
```sh
function print_table_3(){
        echo "func demo"
        for tbl in {3..30..3}
        do
                echo "$tbl"
        done
}

function print_range(){
        echo "func with arg demo : print $1 to $2"

        for((i = $1 ; i < $2; i++))
        do
                echo $i
        done
}

# call functions
print_table_3 # with no parameter
print_range 100 200 # with two params

```
You may not call this function from the script but source this file from other script and use function directly
## Eval command
It takes a string as its argument and evaluate it, then run the command stored in the argument. It allows using the value of a variable as a variable.

```sh
Hello=Lynus
User=Hello
eval echo \$$User # Have to put \ because $$ evaluates to PID
```
## let command
a built-in command which instructs shell to perform an evaluation of arithmetic expressions. No spaces should be used around the arithmetic operant with let command.
```sh
i=2;
let i++
echo $i 
```

## Positional Parameters
```sh
echo "script : $0"
shift 2
for v in $*
do
	echo $v
done

echo "output : $?"
```
Run this script with argumetns
./script.sh a b c d e

## Comments
```sh
oneline comment using #
multiline commment 
:'
'
```
## Shell metacharacters
- $* starts from $1, to know script name print $0   
- To access beyond $9 use 'shift'

- $? -> output
- $1 to $9 arguments
- $* all the arguments
- $$ PID of shell

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

## TODO
- take inptu from keyboard and append in file usign cat
- reading from file
