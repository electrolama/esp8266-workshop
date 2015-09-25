-- 05-ldr-sensor.lua
-- Read LDR value using the ADC

STEP=3.3/1024
DARK_THRESHOLD=600

local adc_val, status

while true do
    adc_val = adc.read(0)

    if adc_val > DARK_THRESHOLD then
        status = "dark"
    else
        status = "light"
    end
    
    print("["..status.."] ADC value read: "..adc_val.." (approximately: "..(STEP*adc_val).."V)")

    tmr.delay(1000 * 1000 * 1)
end
