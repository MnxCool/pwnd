#!/bin/bash


#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "Run install.sh with root!"
	exit 1;
fi

echo "Downloading files"
mkdir /tmp/pwnd-download
cd /tmp/pwnd-download
wget -O pwn https://github.com/MnxCool/pwnd/raw/master/pwn
wget -O pwnd https://raw.githubusercontent.com/MnxCool/pwnd/master/pwnd
wget -O pwn-daemon https://raw.githubusercontent.com/MnxCool/pwnd/master/pwn-daemon
wget -O install.sh https://raw.githubusercontent.com/MnxCool/pwnd/master/install.sh
echo "Downloaded successful. Installing..."
bash install.sh
cd /
rm -rf /tmp/pwnd-download
exit 0
