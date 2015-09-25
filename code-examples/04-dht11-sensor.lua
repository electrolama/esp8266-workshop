-- 04-dht11-sensor.lua
-- Get temperature and humidity readings from the DHT11 sensor

DHT11_PIN = 12

status, temp, hum, temp_dec, hum_dec = dht.read11(DHT11_PIN)

if( status == dht.OK ) then
    print("DHT11 Temperature: "..temp);
    print("DHT11 Humidity: "..hum);
elseif( status == dht.ERROR_CHECKSUM ) then
    print( "DHT11 checksum error, try again?" );
elseif( status == dht.ERROR_TIMEOUT ) then
    print( "DHT11 timeout, try again?" );
else
    print("Oh dear, something is not right. Try again?")
end
