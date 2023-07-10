#!/bin/bash
# set fan pwm speed in a linear fasion based on current temp
# starting at 47C up to the throttle temp of 70C

count=0
while [ $count -lt 100 ]; do
  ffl="/sys/class/hwmon/hwmon"$count"/pwm1"
  if test -f $ffl; then
    fanpwm=$ffl                                # fan pwm writeout
    break
  fi
  (( $count++ ))
done

while :; do
  curtemp=$(cat /sys/class/thermal/thermal_zone0/temp) # temp in millidegrees C
  if [[ $curtemp -gt 46000 ]]; then                    # if temp greater than 46C
    echo $(( ($curtemp - 46000) / 200 + 65 )) | tee $fanpwm
  else
    echo 0 | tee $fanpwm                               # else shut off fan
  fi
  sleep 10                                             # wait 10 seconds
done
