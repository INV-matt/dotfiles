#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar
#killall bash 
# killall scroll_spotify_status.sh
# killall get_spotify_status.sh



# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar top-bar -c $(dirname $0)/config.ini &

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar external -c $(dirname $0)/config.ini &
fi
