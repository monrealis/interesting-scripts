#!/bin/bash

# NAME=$(identify -format "IMG_%[EXIF:DateTime].jpg" 1.jpg | tr -d ':' | tr ' ' '_')
# TODO

exiftool "-FileName<CreateDate" -d "IMG_%Y%m%d_%H%M%S.jpg" *.jpg
