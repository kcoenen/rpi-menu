#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

sudo mkdir /media/HDD/youtube

git clone https://github.com/kcoenen/convert.git /media/HDD/youtube