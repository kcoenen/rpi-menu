#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

deb http://download.webmin.com/download/repository sarge contrib
cd /root
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

sudo apt-get update && sudo apt-get install samba dosbox libre-office chromium-browser audacity filezilla konqueror lxde screen byobu sqlite3 webmin

sudo wget https://yt-dl.org/downloads/2016.06.03/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "--output /media/HDD/youtube/%(title)s.%(ext)s" > ~/.config/youtube-dl.conf

echo "is external drive ntfs or fat32:"
echo "fat32		[1]"
echo "ntfs		[2]"
echo "your choice:"
read option

case $option in
1)
sudo mkdir /media/HDD && sudo echo "echo /dev/sda1       /media/HDD      vfat defaults          0       0" >> /etc/fstab
;;
2)
sudo mkdir /media/HDD && sudo echo "echo /dev/sda1       /media/HDD      ntfs-3g defaults          0       0" >> /etc/fstab
;;
esac

git clone https://github.com/kcoenen/convert.git

