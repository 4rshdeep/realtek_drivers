#!/bin/bash

# youtube-dl -x --audio-format "mp3" --no-playlist --proxy "http://proxy62.iitd.ac.in:3128" "$1"
youtube-dl -x --audio-format "mp3" --no-playlist "$1"
# youtube-dl -x --no-playlist "$1"
mv *.mp3 ./music
