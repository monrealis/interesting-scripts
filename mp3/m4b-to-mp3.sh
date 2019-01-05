#!/bin/bash

id3info file.m4b
ffmpeg -i file.m4b  -acodec libmp3lame -ab 64k 64k.mp3
