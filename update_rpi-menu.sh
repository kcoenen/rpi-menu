#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script should only be run as root"
    exit 1
fi

# set rpi-menu in right location
sudo cp rpi-menu /usr/bin && sudo chmod +x /usr/bin/rpi-menu
