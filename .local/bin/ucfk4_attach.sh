#!/bin/bash

BUS_ID=$(usbipd.exe state | jq -r '[.Devices[] | select(.Description == "ATmega32U2 DFU") | .BusId][0]')
#BUS_ID="2-2"
usbipd.exe attach --wsl --auto-attach --busid "$BUS_ID"
