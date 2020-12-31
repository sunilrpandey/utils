#!/bin/bash
#echo $*
#echo $@
usage(){
    echo "Help needed??"
}
while getopts ":a:b:c:" option; #: at starting is for other options
do
case $option in 
a)
echo "Firstname : $OPTARG"
;;
b)
echo "Middlename : $OPTARG"
;;
c)
echo "Last Name : $OPTARG"
;;
:)
echo "option $OPTARG need an argument"
;;
h|*)
usage
;;
esac
done

# ref https://www.javatpoint.com/get-shell-script-options-with-getopts

