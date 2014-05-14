#!/bin/bash
items=$(git log --pretty="%H,%an,%ad,%at" --date="short" | sed "s/ /_/g")
for item in $items ; do
	commit=$(echo $item | cut -f 1 -d ',')
	git show --numstat --pretty="%n" $commit | grep . | sed 's/\t/,/g' | sed "s#.*#$item,\0#g"
done;