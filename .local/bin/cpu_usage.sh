#!/bin/bash

 # Show CPU Info - 1 (Mpstat)

 
  # [ -z "$1" ] && icon="" || icon="$1"
  #cpu_usage=$(mpstat | awk '{print $3}' );
  # cpu_usage=$(mpstat -P ALL | awk '/all/{print $4}' | cut -d. -f1 );
  cpu_usage=$(top -b -n2 -p 1 \
 | fgrep "Cpu(s)" \
 | tail -1 \
 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); \
 v=vs[length(vs)]; sub("%", "", v); \
 printf "%s%.1f%%\n", prefix, 100 - v }')

      #echo "$icon $cpu_usage%"

    echo "$cpu_usage" 

exit 0
