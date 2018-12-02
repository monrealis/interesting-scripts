#!/bin/bash

openssl enc -aes-128-cbc -k secret -P -md sha1 | sed -n '2s/key=//p' | tr -d '\n' > key

openssl enc    -aes-128-cbc -kfile key -nosalt -in input.txt -out output-1.txt
openssl enc -d -aes-128-cbc -kfile key -nosalt               -in  output-1.txt

openssl enc    -aes-128-cbc -kfile key -in input.txt -out output-2.txt
openssl enc -d -aes-128-cbc -kfile key               -in output-2.txt
