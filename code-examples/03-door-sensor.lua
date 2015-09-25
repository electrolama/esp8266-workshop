-- 03-door-sensor.lua
-- Handle magnetic door sensor using interrupts

LED_PIN = 1
SENSOR_PIN = 7
 
function door_open()
    print("door open!")
    gpio.write(LED_PIN, gpio.HIGH)
    tmr.delay(1000 * 1000 * 1)
    gpio.write(LED_PIN, gpio.LOW)
end

function sensor_interrupt()
    door_open()
end

gpio.mode(LED_PIN, gpio.OUTPUT)

gpio.mode(SENSOR_PIN, gpio.INT)
gpio.trig(SENSOR_PIN, "high", sensor_interrupt)
