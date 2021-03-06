#!/bin/bash
TMPBG=/tmp/screen.png
LOCK=~/.config/i3lock/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
PIXELATE=128

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
ffmpeg -i $TMPBG -vf scale=iw/$PIXELATE:ih/$PIXELATE,scale=$PIXELATE*iw:$PIXELATE*ih:flags=neighbor $TMPBG
exec i3lock -i $TMPBG
rm $TMPBG
