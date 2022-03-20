#!/bin/bash

servers=$(serverlist.txt)
echo -n "Please enter the username: "
read name
echo -n "Please enter the user id: "
read uid

for i in $servers; do
echo $i
ssh $i "sudo useradd -m -u $uid"
if [ $? -eq 0 ]; then
echo "User $name added on $i"
else
echo "Error adding user to $i"
fi
done
