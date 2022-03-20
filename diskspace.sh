#!/bin/bash

filesystems=("/" "/apps" "/database")
for i in ${filesystems[@]}; do
usage=$(df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1)
if [ $usage -ge 90 ]; then
alert="Disk space low on $i, current usage is: $usage%"
echo "Sending a disk space alert email."
echo $alert | mail -s "$i is $usage% full." my_email
fi
done
