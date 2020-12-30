#!/bin/bash

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
echo "While Demo : print 11 to 15"
i=11;
while [ $i -le 15 ];
do
	echo $i
	let i++;
done

echo "Until Demo : print 21 to 25"
i=21;
until [ $i -gt 25 ];
do
	echo $i
	let i++;
done


# Demos
print_table_3
print_range 100 105
