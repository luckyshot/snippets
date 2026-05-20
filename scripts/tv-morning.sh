#!/bin/bash
DISPLAY=:0 PULSE_RUNTIME_PATH=/run/user/1000/pulse
# Kill Firefox (closes all tabs)
pkill -f firefox
sleep 1

 # Set master volume to 40%
pactl set-sink-volume @DEFAULT_SINK@ 40%

# Open Firefox with jango.com
xdg-open "https://www.jango.com"
