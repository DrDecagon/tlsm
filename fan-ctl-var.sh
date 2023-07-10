#!/bin/bash

cputherm=/sys/class/thermal/thermal_zone0/temp # thermometer readout
fanpwm=/sys/class/hwmon/hwmon0/pwm1            # fan pwm writeout
mintemp=48000                                  # fan shutoff temp
minpwm=60                                      # lowest desired pwm value
temprange=$((70000 - $mintemp))                # in millidegrees celcius
pwmrange=$((255 - $minpwm))                    # 0 to 255 representing 0 to 5 volts

while true; do
  curtemp=$(cat $cputherm)
  if [[ $curtemp -ge $mintemp ]]; then         # if current temp is greater than minimum
    echo $((($curtemp - $mintemp) * $pwmrange / $temprange + $minpwm)) | sudo tee $fanpwm
  else                                         # else shut off fan
    echo 0 | sudo tee $fanpwm
  fi
  sleep 7                                      # wait 7 seconds
done
