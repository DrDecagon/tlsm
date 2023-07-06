#!/bin/bash

sudo apt update -y || exit -1
sudo eatmydata apt upgrade -y || exit -1

# create pwm profile on GPIO pin 33 (might not be necissary)
sudo ldto enable pwm-a
sudo ldto enable pwm-a-fan
# push pwm config to survive reboot
sudo ldto merge pwm-a
sudo ldto merge pwm-a-fan

#installs custom supervisor script for running fan control on startup
sed -i -e "s/pi/$HOMENAME/g" $HOMEDIR/tlsm/conf/supervisor/conf.d/pwmfan.conf
sudo cp -r $HOMEDIR/tlsm/conf/supervisor/ /etc/
