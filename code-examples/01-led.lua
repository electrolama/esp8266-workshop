-- 01-led.lua
-- Turn the blue LED on and OFF

-- This is a variable definition
LED_BLUE = 0 -- LED on the ESP8266 module (blue)

-- Initialise the LED pin as an input
-- You need to do this for all pins before use
gpio.mode(LED_BLUE, gpio.OUTPUT)

-- Turn LED on
print("turning LED on")
gpio.write(LED_BLUE, gpio.LOW) -- blue LED is active low, so LOW actually turns it on

-- Wait for 2 seconds (value in microseconds)
tmr.delay(1000 * 1000 * 2)

-- Turn LED off
print("turning LED off")
gpio.write(LED_BLUE, gpio.HIGH) -- again, active low so HIGH actually turns it off
