#!/usr/bin/env bash

# Helper script for esptool.py that lists serial ports/firmware images
# https://github.com/electrolama/esp8266-workshop

ESPTOOL_DIR="../tools/esptool/"
PORTS=($(ls /dev/ttyUSB* /dev/ttyACM*))
FW=($(ls *.bin))

count=0
index=0

echo "Select serial port:"
while [ $count -lt ${#PORTS[@]} ]; do
  echo "  $count) ${PORTS[$count]}";
  (( count++ )) 
done

read -p "> " index

if ! [[ "$index" =~ ^[0-9]+$ ]] || [ $index -lt 0 ] || [ $index -gt ${#PORTS[@]} ]; then
  echo "Not a valid selection for serial port."
  exit 1
else
  port_sel=${PORTS[$index]} 
fi

count=0
index=0

if [ ${#FW[@]} -eq 1 ]; then
  # pick the only available .bin file
  fw_sel=${FW[0]}
else
  # present available .bin files
  echo "Select firmware image:"

  while [ $count -lt ${#FW[@]} ]; do
    echo "  ${count}) ${FW[$count]}"
    (( count++ )) 
  done

  read -p "> " index

  if ! [[ "$index" =~ ^[0-9]+$ ]] || [ $index -lt 0 ] || [ $index -gt ${#PORTS[@]} ]; then
    echo "Not a valid selection for firmware image."
    exit 1
  else
    fw_sel=${FW[$index]} 
  fi
fi

echo "Burning ${fw_sel} on ${port_sel}..."

sudo python ${ESPTOOL_DIR}esptool.py --port=${port_sel} write_flash 0 ${fw_sel} -fs 32m -fm dio -ff 40m \
|| echo "There was a problem. Reset your board and run this tool again."

