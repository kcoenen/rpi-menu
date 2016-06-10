#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

#install webmin
deb http://download.webmin.com/download/repository sarge contrib

cd /root
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

apt-get update
apt-get install webmin

#download youtube-dl and set output folder
sudo wget https://yt-dl.org/downloads/2016.06.03/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Install other programms
sudo apt-get update && sudo apt-get install samba dosbox libre-office chromium-browser audacity filezilla konqueror lxde screen byobu sqlite3 postgresql-9.3 -y