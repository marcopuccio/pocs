"""
This script will be executed once in ESP8266 throught ampy. It's a
simple execution of python machine module.
"""

import machine
import time

led = machine.Pin(2, machine.Pin.OUT)
time.sleep(1)
led.on()
time.sleep(1)
led.off()
time.sleep(1)
led.on()
