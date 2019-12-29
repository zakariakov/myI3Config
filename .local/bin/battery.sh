#!/bin/bash

  Bat=$(acpi | awk '{print $4}'| tr -d "%,");
  adapt=$(acpi -a | awk '{print $3}');

 if [ "$adapt" = "on-line" ];then
  icon0=""
  icon1=""
  icon2=""
  icon3=""
  icon4=""
 else
  icon0=""
  icon1=""
  icon2=""
  icon3=""
  icon4=""
 fi

 baticon="$icon4"
 if [[ $Bat -ge 100 ]] ; then
 baticon="$icon4"
 elif [[ $Bat -ge 80 ]] && [[ $Bat -lt 100 ]]; then
 baticon="$icon4"
 elif [[ $Bat -ge 60 ]] && [[ $Bat -lt 80 ]]; then
 baticon="$icon3"
 elif [[ $Bat -ge 40 ]] && [[ $Bat -lt 60 ]]; then
 baticon="$icon2"
 elif [[ $Bat -ge 20 ]] && [[ $Bat -lt 40 ]]; then
 baticon="$icon1$Bat%"
 else
 baticon="$icon0"
fi

if [ "$1" == "icon" ];then
  echo $baticon
elif [ "$1" == "all" ];then
  echo "$baticon $Bat"
else
 echo $Bat
fi
