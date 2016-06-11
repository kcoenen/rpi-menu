#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

if mount | grep /dev/sda > /dev/null; then
	sudo cp smb.conf /etc/samba && sudo service smbd restart
	exit
else
    echo "is external drive ntfs or fat32:"
	echo "fat32		[1]"
	echo "ntfs		[2]"
	echo "your choice:"
	read fstab
	
	case $fstab in
		1)
		sudo mkdir /media/HDD && sudo mount /dev/sda1 /media/HDD && sudo echo "echo /dev/sda1       /media/HDD      vfat defaults          0       0" >> /etc/fstab
		;;
		2)
		sudo mkdir /media/HDD && sudo echo "echo /dev/sda1       /media/HDD      ntfs-3g defaults          0       0" >> /etc/fstab
		;;
	esac
	
	sudo cp smb.conf /etc/samba && sudo service smbd restart
fi