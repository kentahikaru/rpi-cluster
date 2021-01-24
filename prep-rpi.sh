#!/bin/bash

#umount /mnt/dd

if [ -z "$1" ]
then
      echo "\$1 hostname is empty"
      echo "Exitting."
      exit 1
fi

mount /dev/sdf1 /mnt/dd
touch /mnt/dd/ssh
cp /root/wpa_supplicant.conf /mnt/dd
umount /mnt/dd

mount /dev/sdf2 /mnt/dd
echo "iwconfig wlan0 power off" >> /mnt/dd/etc/rc.local
# set hostname 
echo "$1" > /mnt/dd/etc/hostname
umount /mnt/dd
