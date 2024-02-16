#!/bin/bash

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a
apt-get update -y -qq
apt-get install libcatmandu-store-mongodb-perl libmongodb-perl perl mongodb -y -qq
systemctl start mongodb
systemctl enable mongodb
