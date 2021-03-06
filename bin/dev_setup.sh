#!/bin/bash

#run this script to fix some repetitve tasks when first setting up 
# the development machine

if [ -z "$1" ];
then
    echo "pass user account. eg ~/dev_setup <username>"
    exit
fi

source ~/WebQ/bin/ips.sh

echo " $server       server " | sudo tee -a /etc/hosts
echo " ${tokencheck} check  " | sudo tee -a /etc/hosts
echo " ${tokengen1}  gen1   " | sudo tee -a /etc/hosts
echo " ${tokengen2}  gen2   " | sudo tee -a /etc/hosts
echo " $vachaspati   vacha  " | sudo tee -a /etc/hosts

# some binary files have been inadventantly commited into git tree previously.
# use this script to prevent them from bothering you
cd ~/WebQ
git update-index --assume-unchanged TokenCheck/lighttpd/src/*.o
git update-index --assume-unchanged TokenCheck/lighttpd/src/.libs/**
git update-index --assume-unchanged TokenCheck/lighttpd/**/Makefile
git update-index --assume-unchanged CapacityEstimator/*.log
git update-index --assume-unchanged TokenGenNew/proxy1
git update-index --assume-unchanged TokenCheck/lighttpd/config.h
git update-index --assume-unchanged TokenCheck/lighttpd/config.log
git update-index --assume-unchanged TokenCheck/lighttpd/config.status
git update-index --assume-unchanged TokenCheck/lighttpd/libtool
git update-index --assume-unchanged TokenCheck/lighttpd/src/lighttpd
git update-index --assume-unchanged TokenCheck/lighttpd/src/proc_open
git update-index --assume-unchanged TokenCheck/lighttpd/src/spawn-fcgi
git update-index --assume-unchanged TokenGenNew/waittimedebug.log
git update-index --assume-unchanged TokenGenNew/proxy1
git update-index --assume-unchanged TokenGenNew/proxy1.log
git update-index --assume-unchanged CapacityEstimator/bin/com/webq/capest/*.class
git update-index --assume-unchanged CapacityEstimator/bin/**/*.class

sudo apt-get install sshpass lynx
