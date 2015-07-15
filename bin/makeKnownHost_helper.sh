#!/bin/bash
# echo "dev setup should be run before runnign this file"

if [ -z "$1" ];
then
    echo "input username ./makeKnownHost_helper.sh <username>"
    exit
else
    USER=$1
fi

./ips.sh

for IP in ${tokencheck[$user]} ${tokengen2[$user]} ${tokengen1[$user]} ${vachaspati} ${server}
do
    ./makeKnownHost.sh $user $IP
done

echo "now enable pasword less login for root account"
for IP in ${tokencheck[$user]} ${tokengen2[$user]} ${tokengen1[$user]} ${vachaspati} ${server}
do
    ./makeKnownHost.sh root $IP
done
