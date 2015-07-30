#!/usr/bin/env bash
#number=$(bc -l <<< "scale = 2000; a(1) * 4")
#number=$(bc -l <<< "scale = 2000; e(1)")
#number=$(bc -l <<< "scale = 2000; sqrt(2)")
number=$(bc -l <<< "scale = 2000; sqrt(3)")
echo $number | grep -o [0-9] | sort | uniq -c | sort -k1nr