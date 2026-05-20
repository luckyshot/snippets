#!/bin/bash
DISPLAY=:0 PULSE_RUNTIME_PATH=/run/user/1000/pulse

# Kill Firefox (closes all tabs)
pkill -f firefox
sleep 1

 # Set master volume
pactl set-sink-volume @DEFAULT_SINK@ 30%

# Play music
xdg-open "https://www.jango.com/stations/402422308" # Jamie Duffy
