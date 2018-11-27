#!/bin/bash

sudo cat /var/acntech/files/10periodic > /etc/apt/apt.conf.d/10periodic
sudo cat /var/acntech/files/20auto-upgrades > /etc/apt/apt.conf.d/20auto-upgrades

for pid in $( pidof apt-get ); do
   sudo kill -9 ${pid}
done

sudo kill -9 $( sudo lsof /var/lib/dpkg/lock )

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock