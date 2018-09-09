"""
This script will be executed inloop by ESP8266 throught ampy.
This file will be uploaded to the board called 'main.py' to ensure the
execution of it after device boot.
"""

import machine
import time
from any_lib.simplelog import SimpleLog


logger = SimpleLog()
logger.log('Hey, I\'m calling a method of an external lib')
