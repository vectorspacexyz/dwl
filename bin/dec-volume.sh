#!/bin/bash

function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*2)/10
    let _left=20-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "[${_fill// /#}${_empty// /-}] ${_progress}%%"

}

pactl -- set-sink-volume 0 -5%

VOL=$(pamixer --get-volume)

notify-send -t 1000 -h string:x-canonical-private-synchronous:volume-notification "VOL: $(ProgressBar $VOL 100)"
