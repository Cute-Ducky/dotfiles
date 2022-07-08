#!/bin/sh

interval=0

# load colors
black=#1e222a
green=#7eca9c
white=#abb2bf
grey=#282c34
blue=#7aa2f7
red=#d47d85
darkblue=#668ee3

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$blue^ $get_capacity%%"
}

brightness() {
  printf "^c$red^"
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^"
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf  "^c$black^ ^b$darkblue^ Connected" ;;
	down) printf  "^c$black^ ^b$darkblue^ Disconnected" ;;
	esac
}

clock() {
	#printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%H:%M')  "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] 
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(battery) $(cpu) $(mem) $(wlan) $(clock)"
done


