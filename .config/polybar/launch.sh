#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar

# Check screens and launch the bar for every screen - new setup

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &
fi

#polybar -q main -c "$DIR"/config.ini & # <-- Simple launch without checking screens
