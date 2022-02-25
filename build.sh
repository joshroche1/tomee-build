#!/bin/bash

apt update; apt upgrade -y;  apt install default-jdk unzip maven -y
cd /opt
wget https://downloads.apache.org/tomee/tomee-8.0.10/apache-tomee-8.0.10-webprofile.zip
unzip xvzf apache-*
ln -s apache-tomee-web* tomee/
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
#iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
#iptables-save
chmod 0744 /opt/tomee/bin/*.sh
cp tomee.service /etc/systemd/system/
cp tomcat-users.xml /opt/tomee/conf/tomcat-users.xml
cp context.xml /opt/tomee/webapps/manager/META-INF/context.xml
cp context.xml /opt/tomee/webapps/host-manager/META-INF/context.xml
#cd /opt/tomee/bin
#keytool -genkey -alias tomee -keyalg RSA -storepass ApacheTomEE
systemctl daemon-reload
systemctl enable tomee.service
systemctl start tomee.service
