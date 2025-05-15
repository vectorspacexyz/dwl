#!/bin/bash

# maim -sq | xclip -i -selection clipboard -t image/png
slurp | grim -g - - | wl-copy
FNAME="$(date '+%s').png"
# xclip -o -selection clipboard | tee "$HOME/Pictures/${FNAME}" | tesseract stdin stdout | grep -v '^$' | tr '\n' ' ' | xclip -i
LANG=eng
# LANG=$(echo -e 'eng\njpn' | dmenu -i)
# xclip -o -selection clipboard | tee "$HOME/Pictures/${FNAME}" | tesseract -l "${LANG}" stdin stdout | grep -v '^$' | xclip -i
wl-paste | tee "$HOME/Pictures/${FNAME}" | tesseract -l "${LANG}" stdin stdout | grep -v '^$' | wl-copy --primary

# xclip -o > "$HOME/Pictures/.${FNAME}.txt"
wl-paste --primary > "$HOME/Pictures/.${FNAME}.txt"
notify-send -t 10000 -h string:x-canonical-private-synchronous:scanned "OCRed: $(wl-paste --primary)"


# GEOMETRY="813x1007+555+48"
# maim --geometry="${GEOMETRY}" -q | xclip -i -selection clipboard -t image/png
# FNAME="$(date '+%s')"
# FPATH="/tmp/book"
# 
# if ! [[ -d "$FPATH" ]];
# then
#     echo "Create $FPATH first"
# else
#     xclip -o -selection clipboard | tee "${FPATH}/${FNAME}.png" | tesseract stdin stdout > "${FPATH}/${FNAME}.txt" && xdotool click 1
# fi
#
#    maim --geometry="813x1007+555+48" -q -o "$(date '+%s').png" && xdotool click 1


