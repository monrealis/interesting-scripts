#!/bin/bash

rm -rf temp/ target/
bash create-private.sh

env DN=c00 ROOT=true bash create-certificate.sh
env DN=c01 KEY=c00 SIGN_KEY=c00 bash create-certificate.sh
env DN=c02 KEY=c00 SIGN_KEY=c00 bash create-certificate.sh

mkdir -p target/
cp temp/trustore.jks temp/keystore.jks target/


