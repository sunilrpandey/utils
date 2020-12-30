#!/bin/bash 
if [ -f 2tee2 ] 
	then 
		echo "file" 
fi

echo "Number of arguments : $#" 

for var in $*
do
	echo $var
done

for file in 2*
do 
	mv $file $file.text
done


