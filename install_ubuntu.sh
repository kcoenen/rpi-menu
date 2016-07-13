#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

apt-get update && sudo apt-get dist-upgrade -y

#install webmin

echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
cd /root
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

apt-get update
apt-get install webmin

#download youtube-dl and set output folder
sudo wget https://yt-dl.org/downloads/2016.06.03/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

mkdir /home/kris/youtube

echo "--output /home/kris/youtube/%(title)s.%(ext)s" > /home/pi/.config/youtube-dl.conf

# Install other programms
sudo add-apt-repository ppa:libreoffice/ppa
sudo add-apt-repository ppa:mc3man/trusty-media
sudo add-apt-repository ppa:tomahawk/ppa
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update && sudo apt-get install  git lubuntu-desktop firefox tomahawk sublime-text-installer gimp steam thunderbird vlc gparted dd geany wine samba dosbox libreoffice audacity filezilla konqueror screen byobu sqlite3 postgresql-9.3 -y

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y