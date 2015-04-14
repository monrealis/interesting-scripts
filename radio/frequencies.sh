#!/usr/bin/env bash
url1=http://www.rtk.lt/lt/radijas_ir_televizija/radijo_programos/vilniuje_transliuojanciu_radijo_stociu_dazniai
url2=http://www.rtk.lt/lt/radijas_ir_televizija/radijo_programos/kaune_transliuojanciu_radijo_stociu_dazniai
urls=($url1 $url2)
names=(vilnius.html kaunas.html)
for index in 0 1; do
    url=${urls[index]}
    file=${names[index]}
    echo $url $file
    [ -e $file ] || ( curl -s $url -o $file ; sleep 2)
done

sed -n -r '/414px/,/<[/]table>/ p' kaunas.html | tidy -asxml -numeric -utf8 -f /dev/null