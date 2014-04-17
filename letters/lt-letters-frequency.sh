#!/bin/bash
set -e
uppercase=AĄBCČDEĘĖFGHIĮYJKLMNOPRSŠTUŲŪVZŽ
lowercase=aąbcčdeęėfghiįyjklmnoprsštuųūvzž
#text=$(curl --silent http://www.delfi.lt)
text=$(curl --silent http://www.15min.lt)
text=$(echo $text | tr $uppercase $lowercase | tr -cd $lowercase)

total=$(echo -n $text | wc -m)
output=$(
for letter in $(echo $lowercase | grep -o .) ; do
	count=$(echo $text | tr -cd $letter | wc -m)
	percent=$(bc <<< "scale=10; $count / $total * 100")
	printf "%s %05.2f (%5d/%6d)-" $letter $percent $count $total
done)
echo $output | xargs -d- -n 1 | egrep .+ | sort -k2rn
