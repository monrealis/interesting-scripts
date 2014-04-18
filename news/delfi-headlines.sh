#!/bin/bash
html=$(curl -s http://www.delfi.lt | tidy -asxml -numeric -utf8 -f /dev/null)
echo $html | xmlstarlet sel -N h=http://www.w3.org/1999/xhtml -t -v "//h:div[@class='fp_big']//h:a[@class='CBarticleTitle']" | nl
