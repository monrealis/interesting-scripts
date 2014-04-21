#!/bin/bash
if=/dev/zero
of=/dev/null
$(which time) -f "%e\n" -o /tmp/duration.txt dd if=$if of=$of bs=1024 count=1048576 2> /dev/null
seconds=$( cat /tmp/duration.txt )
speed=$(echo 1024 / $seconds | bc)
echo $speed MB/s
