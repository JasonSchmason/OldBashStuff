#!/bin/bash

backup_dirs = ("/etc" "/home" "/boot")
dest_dir = "/backup"
dest_server = "server1"
backup_date = $(date + %b-%d-%y)

echo "Starting backup of: ${backup_dirs[@]}"

for i in "${backup_dirs[@]}"; do
sudo tar -Pczf /tmp/$i-$backup_date.tag.gz $i
if [ $? -eq 0 ]; then
echo "$i backup successful."
else
echo "$i backup failed."
fi 
scp /tmp/$i-$backup_date.tar.gz $dest_server:$dest_dir
if [ $? -eq 0 ]; then
echo "$i transfer succefful."
else
echo "$i transfer failed."
fi 
done

sudo rm /tmp/*.gz
echo "Backup is completed."