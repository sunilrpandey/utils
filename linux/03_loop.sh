#!/bin/bash

echo "loop demo"
for tbl in {3..30..3}
do 
	echo "$tbl"
done

echo "For Demo : print 11 to 15"

for((i = 11; i < 16; i++))
do
	echo $i
done

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

