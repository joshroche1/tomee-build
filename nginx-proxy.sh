#!/bin/bash

sudo apt install nginx
openssl req -x509 -newkey rsa:4096 \
  -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
  -sha256 -days 365 -nodes -subj "/C=/ST=/L=/O=/OU=/CN=/emailAddress="
cp nginx-tls-proxy-tomcat.conf /etc/nginx/sites-available/tomcat
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/tomcat /etc/nginx/sites-enabled/tomcat
systemctl restart nginx
