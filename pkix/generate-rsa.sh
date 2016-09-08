#!/bin/bash

openssl genrsa -des3 -out server.key -passout pass:changeit 1024
openssl req -new -key server.key -out server.csr -passin pass:changeit -config config.txt
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key -passin pass:changeit
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

openssl x509 -outform der -in server.crt -out server.der
openssl crl2pkcs7 -nocrl -certfile server.crt -out server.p7b
openssl crl2pkcs7 -nocrl -certfile server.crt -out server.p7b.der -outform der
openssl pkcs12 -export -out server.p12 -inkey server.key -in server.crt -passout pass:

openssl rsa -in server.key -pubout -outform DER -out server.key.pub
openssl rsa -in server.key -pubout -outform PEM -out server.key.pub.pem
openssl pkcs8 -topk8 -nocrypt -in server.key -out server.key.pkcs8 -outform DER
openssl pkcs8 -topk8 -nocrypt -in server.key -out server.key.pkcs8.pem -outform PEM

# http://www.akadia.com/services/ssh_test_certificate.html
# https://www.openssl.org/docs/apps/openssl.html
# https://www.openssl.org/docs/apps/genrsa.html
# https://www.openssl.org/docs/apps/req.html
# https://www.openssl.org/docs/apps/rsa.html
# https://www.openssl.org/docs/apps/x509.html
# https://www.openssl.org/docs/apps/pkcs12.html
# https://www.openssl.org/docs/apps/pkcs7.html
# https://www.openssl.org/docs/apps/crl2pkcs7.html
# https://www.openssl.org/docs/manmaster/apps/pkcs8.html
# https://www.sslshopper.com/ssl-converter.html
