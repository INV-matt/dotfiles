#! /bin/sh

chosen=$(printf "\n\n﫼\n\n" | rofi -dmenu -i -theme "~/.config/rofi/fullscreen-power.rasi" -p "Goodbye INVmatt")

case "$chosen" in
	"") systemctl poweroff ;;
	"") systemctl reboot ;;
	"﫼") bspc quit ;;
	"") betterlockscreen -l ;;
	"") systemctl suspend ;;
	*) exit 1 ;;
esac
