#!/bin/bash

declare -a arr=( $(dscl . -list /Users) )

echo "All users, non-system users or just visible users"
echo " 1. All users"
echo " 2. Normal users"
echo " 3. Visible users"
read choice

if [ $choice == "1" ]
then
	for i in "${arr[@]}"
	do
		sysadminctl -secureTokenStatus $i
	done
	exit 0
elif [ $choice == "2" ]
then
	declare -a users=( ${arr[@]/_*/} )

	for i in "${users[@]}"
	do
		sysadminctl -secureTokenStatus $i
	done
	exit 0
elif [ $choice == "3" ]
then
	cd /Users
	for i in *
	do
		sysadminctl -secureTokenStatus $i
	done
	exit 0
else
	echo "Choice not recognized"
	exit 1
fi
