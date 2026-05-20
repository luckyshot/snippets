#!/bin/bash
DISPLAY=:0 PULSE_RUNTIME_PATH=/run/user/1000/pulse

# Kill Firefox (closes all tabs)
pkill -f firefox
sleep 1
