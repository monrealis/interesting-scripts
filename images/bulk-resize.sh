#!/usr/bin/env bash
find -type d | xargs -i mkdir -p /tmp/2/{}
find -iname "*.JPG" | xargs -i convert {} -resize 800 /tmp/2/{}-800.jpg