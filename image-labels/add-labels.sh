#!/usr/bin/env bash
# http://www.imagemagick.org/Usage/text/
# http://stackoverflow.com/questions/23236898/add-text-on-image-at-specific-point-using-imagemagick
convert barrel.png -gravity South -strokewidth 2 -font Liberation-Sans  -stroke black -fill white  -pointsize 80 -annotate 0  'das Fass\ncask' temp1.jpg
xdg-open temp1.jpg