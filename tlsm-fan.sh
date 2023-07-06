#!/bin/bash

echo " CPU Freq || Usage || Temp || Fan Speed"

while true; do
  printf "\n %4s MHz || %3.3s %% || %2d C || %0d RPM " \
    $[$(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq) / 1000] \
    $[100-$(vmstat 1 2 | tail -1 | awk '{print $15}')] \
    $[$(cat /sys/class/thermal/thermal_zone0/temp) / 1000] \
    $[$(cat /sys/class/hwmon/hwmon0/fan1_input) / 2]
done
