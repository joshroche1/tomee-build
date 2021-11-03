#!/bin/bash

cd /opt
sudo apt-get update && sudo apt-get upgrade -y
apt-get install default-jdk maven nginx
wget https://downloads.apache.org/tomee/tomee-8.0.8/apache-tomee-8.0.8-webprofile.tar.gz
tar xvzf apache-tomee-8.0.8-webprofile.tar.gz
mv apache-tomee-webprofile-8.0.8/ tomee/
#
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
#iptables-save
