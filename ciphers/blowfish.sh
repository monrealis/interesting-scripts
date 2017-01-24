#!/bin/bash

PASSWORD=
echo Using password "$PASSWORD"

echo Labas > in.txt
cat in.txt

openssl enc -bf -nosalt -in in.txt -out out.txt -pass pass:$PASSWORD -K 0
cat out.txt
echo

openssl enc -bf -d -nosalt -in out.txt -out in2.txt -pass pass:$PASSWORD -K 0
cat in2.txt
