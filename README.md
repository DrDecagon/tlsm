# Tiny Little Stat Monitor for Le Potato

TLSM & TLSM-FAN
--------------------------------------
Two scripts for monitoring CPU frequency, CPU use percentage, CPU Temperature, and (if a 3 or 4 pin fan is connected) Fan Speed.


Fan-CTL & Fan-CTL-Alt
--------------------------------------
Two scripts for controling PWM output over pin 33 (PWM-A)

The main option measure temperature and in millidegrees and converts that value linearly to a fan speed between 50 and 255 on the 8 bit PWM pin.  
This is approximately 1v and 5v spread evenly between 49C and 71C.  1v is barely audable and with the CPU at full use the fan runs around 3v which is not obnoxious.  
With a heatsink, This was much more than adequate to handle the AML-S905X-CC at constant full load in a warm room.


Fan Installation
--------------------------------------
* Setup 4 pin fans as shown in the picture below. 
* Run sudo ./setup.sh to configure and enable the GPIO pins and autostart fan-ctl-lin.sh at startup.

![Reference pinout](https://hub.libre.computer/uploads/db1613/original/2X/c/c8d7387f5f0af578b266ec8915fb52f3f289ced3.jpeg "Le Potato reference pinout")

For more info, see the [manufacturers instructions](https://hub.libre.computer/t/how-to-read-and-control-pwm-fan-speed-on-aml-s905x-cc/541)
