#!/bin/bash

if [ $# -gt 2 ]; then
    echo "More than two arguments not supported"
    exit 1
fi
if [ $# -gt 0 ]; then
    left=$1
    shift
else
    left=.
fi
if [ $# -gt 0 ]; then
    right=$1
    shift
else
    right=.
fi

dir=$PWD

cd $dir
cd $left
find . -type f -printf "%p %s\n" | sort > /tmp/left.txt

cd $dir
cd $right
find . -type f -printf "%p %s\n" | sort > /tmp/right.txt

kdiff3 /tmp/left.txt /tmp/right.txt
