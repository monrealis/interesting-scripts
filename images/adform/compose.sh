#/bin/bash

# http://www.imagemagick.org/Usage/layers/#convert
# https://www.imagemagick.org/discourse-server/viewtopic.php?t=17441


left=30
top=38
scale=62
img=vytenis.gif

width=`convert $img -format "%w" info:`
height=`convert $img -format "%h" info:`
xoffset=`convert xc: -format "%[fx:$width*$left/100]" info:`
yoffset=`convert xc: -format "%[fx:$height*$top/100]" info:`

from=$img
for a in 1 2 3 4 5 6 7 8 9 10 11 12 13 ; do
  to=$img-$a.gif
  convert $from $from -geometry  %${scale}x${scale}+$xoffset+$yoffset -composite $to
  from=$to
done

xdg-open $to
