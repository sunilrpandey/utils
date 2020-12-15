#! /bin/bash

var="Welcome to Shell"
echo ${var}

echo ${var:5}  #string starting position 5 till end
echo ${var:5:6} #string starting position 5 of 6 length

if[! -z "$var"]
	then
		echo "non-zero string" 
	fi
vari=24
echo ${vari}

