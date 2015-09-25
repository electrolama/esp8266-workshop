-- 02-button.lua
-- Handle button presses (not using interrupts)

BUTTON_PIN = 8

gpio.mode(BUTTON_PIN, gpio.INPUT)

local pinValue

while true do
    pinValue = gpio.read(BUTTON_PIN)
    
    if pinValue == gpio.LOW then
        print 'Press button, receive bacon'
    else
        print '^ . . ^  --- Oink!'
        print '(  @  ) /'
    end

    tmr.delay(1000 * 500)
end