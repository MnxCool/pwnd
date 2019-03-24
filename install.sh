#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "Run install.sh with root!"
	exit 1;
fi

echo "Installing..."
echo "Copying files..."
cp ./pwnd /usr/bin/pwnd
cp ./pwn-daemon /etc/init.d/pwnd
cp ./pwn /usr/bin/pwn
echo "Setting permissions..."
chmod 755 /etc/init.d/pwnd
chmod 700 /usr/bin/pwnd
chmod 700 /usr/bin/pwn
chmod u+s /usr/bin/pwn
echo "Reloading systemctl daemon"
systemctl daemon-reload
update-rc.d pwnd defaults
service pwnd restart
echo "Installed"
