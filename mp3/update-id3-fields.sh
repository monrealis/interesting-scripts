#!/usr/bin/env bash

# make track numbers equal
id3v2 -T 0 *.mp3
 
# update title from file name. Does not work?
find -name "*.mp3" -print0 | xargs -r0i echo id3v2 -t {} {}

# Renumber track numbers
ls *.mp3 | awk '{print "id3v2", "-T", NR, "\"" $0 "\""}' | bash

# update title from file name. Does not work?
ls *.mp3 | awk '{print "id3v2", "-t", "\"" $0 "\"", "\"" $0 "\""}'
