#!/bin/bash
# to test run ./02_pos_params.sh a b c d 
echo "script : $0"
echo "params : $@"
#shift 2
for v in $*
do
	echo $v
done

#echo "output : $?"

#echo "Enter name to check input"
#read name
#echo "My name is : $name"
