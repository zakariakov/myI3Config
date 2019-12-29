#!/bin/bash

ANC=$(echo "Lock|Logout|Shutdown|Reboot|Suspend" | \
      rofi -sep "|" -dmenu -i -p 'System ' -width 20 -columns 1 -lines 5 )
case "$ANC" in
	*Lock) i3lock -c '#161925' ;;
	*Loout) i3 exit ;;
	*Shutdown) systemctl poweroff ;;
	*Reboot) systemctl reboot ;;
	*Suspend) systemctl suspend
esac
exit 0


