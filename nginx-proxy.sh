#!/bin/bash

sudo apt install nginx
openssl \
    req \
    -nodes \
    -newkey rsa:4096 \
    -keyout server.key \
    -out server.csr \
    -subj "/C=DE/ST=NRW/L=Berlin/O=My Inc/OU=DevOps/CN=Server/emailAddress=admin@localhost"
openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
mv server.crt /etc/ssl/certs
mv server.key /etc/ssl/private
rm server.csr
