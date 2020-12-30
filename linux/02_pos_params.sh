#!/bin/bash

echo "script : $0"
shift 2
for v in $*
do
	echo $v
done

echo "output : $?"

echo "Enter name to check input"
read name
echo "My name is : $name"
