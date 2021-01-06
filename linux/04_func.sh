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
function demo_while_loop(){
	echo "While Demo : print 11 to 15"
	i=11;
	while [ $i -le 15 ];
	do
		echo $i
		let i++;
	done
}

function demo_until_loop(){
	echo "Until Demo : print 21 to 25"
	i=21;
	until [ $i -gt 25 ];
	do
		echo $i
		let i++;
	done
}

function func_returning_value(){
	ret=$(ls -l)
	echo $ret
}

# One has to echo the variable you want to return from function 
# and collect it from called function

function func_using_ret_value(){
	echo "Demo: Function using returned value from another function"
	out=$(func_returning_value)
	echo $out
}

# Demos
#print_table_3
#print_range 100 105

#demo_while_loop
#demo_until_loop

func_using_ret_value