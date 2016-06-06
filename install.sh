#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

# install debendencies
sudo deb http://download.webmin.com/download/repository sarge contrib
cd /root
sudo wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc

sudo apt-get update && sudo apt-get install samba dosbox libre-office chromium-browser audacity filezilla konqueror lxde screen byobu sqlite3 webmin -y

#download youtube-dl and set output folder
sudo wget https://yt-dl.org/downloads/2016.06.03/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "--output /media/HDD/youtube/%(title)s.%(ext)s" > ~/.config/youtube-dl.conf

# create mountpoint and mount HDD or usb-stick
echo "is external drive ntfs or fat32:"
echo "fat32		[1]"
echo "ntfs		[2]"
echo "your choice:"
read fstab

case $fstab in
1)
sudo mkdir /media/HDD && sudo echo "echo /dev/sda1       /media/HDD      vfat defaults          0       0" >> /etc/fstab
;;
2)
sudo mkdir /media/HDD && sudo echo "echo /dev/sda1       /media/HDD      ntfs-3g defaults          0       0" >> /etc/fstab
;;
esac

#set samba settings.

sudo cp smb.conf /etc/samba && sudo service smbd restart


#Download convert program
sudo mkdir /media/HDD/youtube

git clone https://github.com/kcoenen/convert.git /media/HDD/youtube

# set rpi-menu in right location
sudo cp rpi-menu /usr/bin && sudo chmod +x /usr/bin/rpi-menu

