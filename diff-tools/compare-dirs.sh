#!/bin/bash
left=.
right=.
cd $left
find . -type f -printf "%p %s\n" | sort > /tmp/left.txt
cd $right
find . -type f -printf "%p %s\n" | sort > /tmp/right.txt
kdiff3 /tmp/left.txt /tmp/right.txt