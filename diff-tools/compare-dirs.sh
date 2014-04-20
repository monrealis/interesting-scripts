#!/bin/bash
left=.
right=.
cd $left
find . -printf "%p %s\n" > /tmp/left.txt
cd $right
find . -printf "%p %s\n" > /tmp/right.txt
kdiff3 /tmp/left.txt /tmp/right.txt