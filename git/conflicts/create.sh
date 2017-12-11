#!/bin/bash

rm -rf test/

git init test/
cd test/

seq 10 >> file.txt
git add file.txt
git commit -m "First"

echo 11 >> file.txt
git commit -a -m "Second"

git checkout -b other HEAD~1
echo 12 >> file.txt
git commit -a -m "Second other branch"


git checkout -b other2 HEAD~1
echo 13 >> file.txt
git commit -a -m "Third branch"


git checkout master
