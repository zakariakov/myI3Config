#!/bin/bash

PID=$(pgrep -u $UID -x volumeicon)

 if [ $PID>/dev/null ];then
   echo $PID
else
   echo "volumeicon is null"
   volumeicon &
fi
