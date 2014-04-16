#!/bin/bash
set -e
text=$(curl --silent http://www.delfi.lt)
text=$(echo $text | tr '[:upper:]ĄČĘĖĮŠŲŪŽ' '[:lower:]ąčęėįšųūž' | tr -cd '[:lower:]ąčęėįšųūž')

for letter in $(echo aąbcčdeęėfghiįyjklmnoprsštuųūvzž | grep -o . | xargs -n 1) ; do
	count=$(echo $text | grep -o $letter | wc -l)
	echo $letter $count
done
