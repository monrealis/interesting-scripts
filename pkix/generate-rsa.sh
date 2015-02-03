#!/bin/bash

openssl genrsa -des3 -out server.key -passout pass:changeit 1024
openssl req -new -key server.key -out server.csr -passin pass:changeit -config config.txt
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key -passin pass:changeit
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# http://www.akadia.com/services/ssh_test_certificate.html
# https://www.openssl.org/docs/apps/openssl.html
# https://www.openssl.org/docs/apps/genrsa.html
# https://www.openssl.org/docs/apps/req.html
# https://www.openssl.org/docs/apps/rsa.html
# https://www.openssl.org/docs/apps/x509.html
