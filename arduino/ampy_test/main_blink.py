"""
This script will be executed inloop by ESP8266 throught ampy.
This file will be uploaded to the board called 'main.py' to ensure the
execution of it after device boot.
"""

import machine
import time
from any_lib.simplelog import SimpleLog


led = machine.Pin(2, machine.Pin.OUT)
while True:
    led.on()
    time.sleep(1)
    led.off()
    time.sleep(1)
