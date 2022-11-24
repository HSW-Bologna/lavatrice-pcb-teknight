#!/usr/bin/env python3
import minimalmodbus
import serial
import sys
import time


def setSerialNumber(port, slave_address, register_address, value=None):

    instrument = minimalmodbus.Instrument(port, slave_address)  # port name, slave address (in decimal)
    instrument.serial.baudrate = 115200         # Baud
    instrument.serial.bytesize = 8
    instrument.serial.parity   = serial.PARITY_NONE
    instrument.serial.stopbits = 1
    instrument.serial.timeout  = 0.1          # seconds

    if value != None:
        instrument.write_registers(register_address, [value])

    print(f"0x{instrument.read_register(register_address):04X}")
    
if __name__ == "__main__":
    if len(sys.argv) < 4:
        print(f"usage: {sys.argv[0]} porta indirizzo registro")
        exit(1)

    value = None
    if len(sys.argv) > 4:
        value = int(sys.argv[4])

    setSerialNumber(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), value)
