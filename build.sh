#!/bin/bash


sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install default-jdk maven nginx
wget https://downloads.apache.org/tomee/tomee-8.0.8/apache-tomee-8.0.8-webprofile.tar.gz
tar xvzf apache-tomee-8.0.8-webprofile.tar.gz
mv apache-tomee-webprofile-8.0.8/ tomee/
sudo mv tomee/ /opt/tomee/
#
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
#iptables-save
#
sudo mv /opt/tomee/conf/tomcat-users.xml /opt/tomee/conf/tomcatusers.xml.OLD
sudo mv tomcat-users.xml /opt/tomee/conf/
sudo mv /opt/tomee/webapps/manager/META-INF/context.xml /opt/tomee/webapps/manager/META-INF/context.xml.OLD
sudo cp context.xml /opt/tomee/webapps/manager/META-INF/
sudo mv tomcat-users.xml /opt/tomee/conf/
sudo mv /opt/tomee/webapps/host-manager/META-INF/context.xml /opt/tomee/webapps/host-manager/META-INF/context.xml.OLD
sudo mv context.xml /opt/tomee/webapps/host-manager/META-INF/
sudo tomee.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start tomee.service
