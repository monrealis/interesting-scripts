#!/bin/bash
set -e
digits=$(seq 9)
source=$(curl --silent http://www.delfi.lt)
#source=$(curl --silent http://www.15min.lt)
#source=$(curl --silent http://www.lrytas.lt)
#source=$(curl --silent http://en.wikipedia.org/wiki/Lithuania)

for digit in $digits ; do
	counts[$digit]=$(echo $source | fgrep -o $digit | wc -l)
done

sum=$(echo ${counts[@]} | xargs -n 1 | paste -s -d + - | bc)

for digit in $digits ; do
	count=${counts[$digit]}
	percent=$(echo "scale=50; 100 * $count / $sum" | bc)
	printf "%s: %5.2f (%4d/%4d)\n" $digit $percent $count $sum
done
