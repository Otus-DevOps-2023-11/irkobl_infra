#!/bin/bash

apt-get update
apt-get install mongodb -y
systemctl start mongodb
systemctl enable mongodb
