# Tiny Little Stat Monitor for Le Potato

TLSM & TLSM-FAN
--------------------------------------
Two scripts for monitoring CPU frequency, CPU use percentage, CPU Temperature, and (if a 3 or 4 pin fan is connected) Fan Speed.


Fan-CTL & Fan-CTL-Alt
--------------------------------------
Two scripts for controling PWM output over pin 32 (PWM-E)

The main option measures temperature and converts that value linearly to a fan speed between 50 and 255 on the 8 bit PWM pin.  This is approximately 1v and 5v spread evenly between 49C and 71C.  1v is barely audable and with the CPU at full use the fan runs around 3v which is not obnoxious.  With a heatsink, This was much more than adequate to handle the AML-S905X-CC at constant full load in a warm room.


Fan Installation
--------------------------------------
* Connect 4 pin fans similar to the image below.  (make sure to move the blue wire to pin 32 or modify this script to pwm_a)
* Run sudo ./setup.sh to configure and enable the GPIO pins and autostart fan-ctl.sh at startup.
For more info, see the [manufacturers instructions](https://hub.libre.computer/t/how-to-read-and-control-pwm-fan-speed-on-aml-s905x-cc/541)

![Reference pinout on pin 35](https://hub.libre.computer/uploads/db1613/original/2X/c/c8d7387f5f0af578b266ec8915fb52f3f289ced3.jpeg "Le Potato reference pinout")


