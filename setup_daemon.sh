#!/bin/bash

if [ $(id -u) == 0 ]; then
  echo "Do not run with sudo or as root"
  exit 1
fi

sudo apt update -y || exit -1
sudo eatmydata apt upgrade -y || exit -1

# create pwm profile on GPIO pin 33 (might not be necissary)
sudo ldto enable pwm-e
sudo ldto enable pwm-e-fan
# push pwm config to survive reboot
sudo ldto merge pwm-e
sudo ldto merge pwm-e-fan

#installs custom supervisor script for running fan control on startup
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
sudo chmod +x $SCRIPT_DIR/fan-ctl.sh
sudo cp -r $SCRIPT_DIR/conf/systemd/ /etc/
systemctl start tlsmFan.service
systemctl enable tlsmFan.service
