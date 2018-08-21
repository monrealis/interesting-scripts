#/bin/bash

# http://www.imagemagick.org/Usage/layers/#convert
# https://www.imagemagick.org/discourse-server/viewtopic.php?t=17441


left=22
top=40
scale=65
img=vytenis.gif

width=`convert $img -format "%w" info:`
height=`convert $img -format "%h" info:`
xoff=`convert xc: -format "%[fx:$width*$left/100]" info:`
yoff=`convert xc: -format "%[fx:$height*$top/100]" info:`

wp=`convert xc: -format "%[fx:100-$top-$top]" info:`
hp=`convert xc: -format "%[fx:100-$left-$left]" info:`

from=$img
for a in 1 2 3 4 ; do
  to=$img-$a.gif
  convert $from $from -geometry  %${scale}x${scale}+$xoff+$yoff -composite $to
  from=$to
done

xdg-open $to
