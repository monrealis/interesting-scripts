#!/bin/bash

NAME=$(identify -format "IMG_%[EXIF:DateTime].jpg" 1.jpg | tr -d ':' | tr ' ' '_')
echo $NAME

#TODO not implemented
