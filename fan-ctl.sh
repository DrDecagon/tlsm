#!/bin/bash

mintemp=49000                                  # fan shutoff temp in millidegrees celcius
minpwm=50                                      # lowest desired pwm value
temprange=$((70000 - $mintemp))                # max temp - min temp in millidegrees celcius
pwmrange=$((255 - $minpwm))                    # max PMW - min PWM.  0 to 255
cputherm=/sys/class/thermal/thermal_zone0/temp # thermometer readout

count=0
while [ $count -lt 100 ]; do
  ffl="/sys/class/hwmon/hwmon"$count"/pwm1"
  if test -f $ffl; then
    fanpwm=$ffl                                # fan pwm writeout
    break
  fi
  (( $count++ ))
done

while true; do                                 # main loop
  curtemp=$(cat $cputherm)
  if [[ $curtemp -ge $mintemp ]]; then         # if current temp is greater than minimum
    echo $((($curtemp - $mintemp) * $pwmrange / $temprange + $minpwm)) | sudo tee $fanpwm
  else
    echo 0 | sudo tee $fanpwm                  # else shut off fan
  fi
  sleep 6                                      # wait 6 seconds
done
