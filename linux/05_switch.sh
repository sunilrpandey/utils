
#!/bin/bash
function switch_demo(){
echo "Enter option"
read num

case $num in
    1) echo "You entered one"
    ;; # acts like break
    2) echo "You entered two"
    ;;
    3) echo "You entered three"
    ;;
    *) echo "What is this??, out of range!"
esac
}

function let_demo(){
	i=2;
	let i++
	echo $i
}
function eval_demo(){
	Hello=Lynus
	User=Hello
	eval echo \$$User
}

#switch_demo
