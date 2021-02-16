# Shell Script
```sh
#!/bin/bash -
var1="Hello"
var2="Shell!!"
echo "$var1 $var2"

```
## Slicing
```sh
var ="Welcome to Shell
echo ${var:5}  #string starting position 5 till end
echo ${var:5:6} #string starting position 5 of 6 length
```
## Control Statements
```sh
if[! -z var]
then
    echo "non-zero string" 
fi
```
## Loop
```sh
for i in {3..30..2}; do
	echo $i
done
```