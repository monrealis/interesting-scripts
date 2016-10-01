#!/usr/bin/env bash

# make track numbers equal
id3v2 -T 0 *.mp3
 
# update title from file name
find -name "*.mp3" -print0 | xargs -r0i echo id3v2 -t {} {}

 
