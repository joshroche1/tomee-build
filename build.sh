#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install default-jdk maven
wget https://downloads.apache.org/tomee/tomee-9.0.0-M7/apache-tomee-9.0.0-M7-webprofile.tar.gz
tar xvzf apache-tomee-9.0.0-M7-webprofile.tar.gz
sudo mv apache-tomee-webprofile-9.0.0-M7/ /opt/tomee/
#
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
#iptables-save
#
sudo mv /opt/tomee/conf/tomcat-users.xml /opt/tomee/conf/tomcatusers.xml.OLD
sudo mv tomcat-users.xml /opt/tomee/conf/
sudo mv /opt/tomee/webapps/manager/META-INF/context.xml /opt/tomee/webapps/manager/META-INF/context.xml.OLD
sudo cp context.xml /opt/tomee/webapps/manager/META-INF/
sudo mv /opt/tomee/webapps/host-manager/META-INF/context.xml /opt/tomee/webapps/host-manager/META-INF/context.xml.OLD
sudo mv context.xml /opt/tomee/webapps/host-manager/META-INF/
sudo mv tomee.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable tomee.service
sudo systemctl start tomee.service
sudo systemctl status tomee.service
