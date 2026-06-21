#!/bin/bash

# crontab -e
# */15 * * * * bash <(curl -fsSL https://raw.githubusercontent.com/luckyshot/snippets/refs/heads/main/scripts/brightness-schedule.sh)

export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export DBUS_SESSION_BUS_ADDRESS="${DBUS_SESSION_BUS_ADDRESS:-unix:path=$XDG_RUNTIME_DIR/bus}"

bright() {
    qdbus org.kde.Solid.PowerManagement \
        /org/kde/Solid/PowerManagement/Actions/BrightnessControl \
        org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness $((10000 * $1 / 100))
}

t=$(date +%H%M)

if [ "$t" -ge 2200 ]; then
    bright 0
elif [ "$t" -ge 2130 ]; then
    bright 10
elif [ "$t" -ge 2100 ]; then
    bright 50
elif [ "$t" -ge 800 ]; then
    bright 100
elif [ "$t" -ge 700 ]; then
    bright 50
elif [ "$t" -ge 600 ]; then
    bright 2
else
    bright 0
fi
