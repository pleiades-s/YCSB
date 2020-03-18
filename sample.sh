#!/bin/bash
# 주석

greeting="Welcome"
user=$(whoami)
day=$(date +%A)

echo "$greeting back ${user}! Today is $day, which is the best day of the entire week!"
echo "Your Bash shell version is: $BASH_VERSION. Enjoy!"

echo $user_
echo ${user}_

string_a="UNIX"
string_b="GNU"

echo "Are $string_a and $string_b strings equal?"
[ $string_a = $string_b ]
# Using echo $? command, we check for a return value of the previously executed evaluation.
echo $?

num_a=1
num_b=10

echo "Is $num_a equal to $num_b ?" 
[ $num_a -eq $num_b ]
echo $?

if [ $num_a -lt $num_b ]; then
    echo "$num_a is less than $num_b!"
else
    echo "$num_a is greater than $num_b!"
fi

echo $1
echo $#
echo $*

# bash option
# -z
# -d if the directory

for i in 1 2 3; do
    echo $i
done

counter=0
while [ $counter -lt 3 ]; do
    let counter+=1
    echo $counter
done

# let : 연산결과 할당