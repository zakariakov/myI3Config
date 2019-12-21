#!/bin/bash


 [ -z "$1" ] && CAR="50" || CAR="$1" 


    focus=$(xdotool getactivewindow getwindowname)
    focus_Number=$(xdotool getactivewindow getwindowname | wc -c)
 #   Focus_N=$(xdotool getactivewindow getwindowname | head -c 40 )

if [ -z "$focus" ];then
        echo "Welcome: $CAR"
 else
  echo "$focus"
 #  [ "$focus_Number" -gt " $CAR" ] && echo -en $FFF || echo "$focus"

fi
