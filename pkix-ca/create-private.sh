#!/bin/bash

mkdir -p temp

openssl genrsa -des3 -out temp/c00.key.secured -passout pass:changeit 1024
openssl rsa -in temp/c00.key.secured -out temp/c00.key -passin pass:changeit
