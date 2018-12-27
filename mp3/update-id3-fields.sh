#!/usr/bin/env bash

# make track numbers equal
id3v2 -T 0 *.mp3
 
# update title from file name. Does not work?
find -name "*.mp3" -print0 | xargs -r0i echo id3v2 -t {} {}

# Renumber track numbers
# https://forums.sandisk.com/t5/SanDisk-Clip-Jam/Complaint-about-sorting-of-tracks-in-Sandisk-Clip-Jam/m-p/356399/highlight/true#M502
ls *.mp3 | sort | awk '{print "id3v2", "-T", NR, "\"" $0 "\""}' | bash
find -type f -name "*.mp3" | sort | awk '{print "id3v2", "-T", NR, "\"" $0 "\""}' | bash

# update title from file name. Does not work?
ls *.mp3 | awk '{print "id3v2", "-t", "\"" $0 "\"", "\"" $0 "\""}'
