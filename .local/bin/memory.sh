#!/bin/bash

  mem_usage=$(free -h | awk '/^Mem:/{print $3}');

      echo "$mem_usage"

exit 0
