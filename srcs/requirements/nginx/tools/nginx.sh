#!/bin/bash

mkdir $CERTS_

# generate selfsigned certificate
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out $CERTS_/cert.crt \
	-keyout $CERTS_/cert.key \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP/OU=Inception/CN=aalcara/"

sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/conf.d/my.conf
sed -i "s|CERTS_|${CERTS_}|g" /etc/nginx/conf.d/my.conf

exec "$@"
