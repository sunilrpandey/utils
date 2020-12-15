# Shell Script Syntaxes

## keyboard input
```sh
echo "enter two numbers"
read n1 n2
```
## If else
```sh

if [$x -gt 0]
then 
    echo ..
elif [x -lt -100]
    echo ..
else 
    echo ..
fi
```
if using && etc use [[]] if -a -o etc can use []
## Logical operator
-a,, -o, ! as (AND, OR, NOT)
[! -d dirname] // is not a directory

## Loop
```sh
n = 1
while [num -lt 10]
do 
    echo $n
    n = $((n+1))
done 
```
```sh
n = 1
until [num -ge 10]
do 
    echo $n
    n = $((n+1))
done 
```
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
ls -al 1>stdout.txt 2>stderr.txt
ls -al >stdout.txt # stdout is default
ls -al >both.txt 2>&1 # file for both
ls -al >&both.txt # file for both
```
### Pipe

## Rough Notes
any differe in $var and "$var"
cat /etc/shell
    /bin/sh
    /bin/bash
    /bin/rbash
    /bin/dash

which bash /
    /bin/bash

chmod +x script.sh
echo "hello" > 1.txt

cat > file.txt
cat >> file.txt //append
cat << heredocTEXT
Hello this first line 
seocond line 
heredocTEXT
onleine comment using #
multiline commment 
:'

'
### if/else 




## TODO
1. take inptu from keyboard and append in file usign cat
2. positional parameters
3. looping,for while, until,break, continue
4. reading from file
5. Shell metacharacters
6. 
