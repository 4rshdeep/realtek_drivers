		#!/bin/bash
youtube-dl -x --audio-format "mp3" --proxy "http://proxy62.iitd.ac.in:3128" "$1" 
# youtube-dl -x --audio-format "mp3"  "$1" 
mv *.mp3 ./"$2"
