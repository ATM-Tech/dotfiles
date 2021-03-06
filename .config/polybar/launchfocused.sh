#!/bin/sh


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar -c $XDG_CONFIG_HOME/polybar/config.focused --reload mainbar &
done

echo "Bars launched..."
