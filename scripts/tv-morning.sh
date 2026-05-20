#!/bin/bash
export XDG_RUNTIME_DIR=/run/user/1000
export DISPLAY=:0

wmctrl -c firefox
wmctrl -c firefox
wmctrl -c firefox
sleep 1

array=(
    "https://www.jango.com/"
#    "https://music.youtube.com/watch?v=7iNbnineUCI&feature=shared" # 90s punk
)

amixer -D pulse sset Master 50% &
amixer -D pulse sset Capture 50% &

RANDOM_LINK=${array[RANDOM % ${#array[@]}]}
firefox --new-tab "$RANDOM_LINK" &

#sleep 10
#firefox --new-tab "https://xaviesteve.com" &

#xdotool search --sync --onlyvisible --class "Firefox" windowactivate key F11 &
