#!/bin/bash

 temp=$(sensors | awk '/^temp1/{print $2}' | tr -d "+°C" | cut -d. -f1 | head -n 1)
 echo " $temp °C"

exit 0
