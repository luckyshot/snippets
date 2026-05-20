#!/bin/bash
# Kill Firefox (closes all tabs)
pkill -f firefox
sleep 1
 
# Open Firefox with jango.com
firefox "https://www.jango.com" &
 
# Set master volume to 40%
pactl set-sink-volume @DEFAULT_SINK@ 40%
