#!/usr/bin/env python3
import minimalmodbus
import serial
import sys
import time


def calculate_crc(data):
    crc = 0xFFFF

    for datum in data:
        crc ^= datum

        for j in range(8):
            if ((crc & 0x0001) > 0):
                crc >>= 1
                crc ^= 0xA001
            else:
                crc >>= 1

    return crc


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


def main():
    if len(sys.argv) < 4:
        print(f"usage: {sys.argv[0]} porta indirizzo registro")
        exit(1)

    value = None
    if len(sys.argv) > 4:
        value = int(sys.argv[4])

    setSerialNumber(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), value)


def rawmain(port, slave_address):
    ser = serial.Serial(port, 115200, timeout=0.1, parity=serial.PARITY_NONE, stopbits=1, bytesize=8)

    write_holding_register_packet = [slave_address, 16, 0, 32, 0, 18, 18*2, 0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1]
    crc = calculate_crc(write_holding_register_packet)
    write_holding_register_packet += [crc & 0xFF, (crc >> 8) & 0xFF]

    print(write_holding_register_packet)

    ser.write(write_holding_register_packet)
    print([int(x) for x in ser.read(256)])

    read_holding_register_packet = [slave_address, 3, 0, 32, 0, 18]
    crc = calculate_crc(read_holding_register_packet)
    read_holding_register_packet += [crc & 0xFF, (crc >> 8) & 0xFF]

    print(read_holding_register_packet)

    ser.write(read_holding_register_packet)
    print([int(x)  for x in ser.read(256)])



if __name__ == "__main__":
    #main()
    rawmain("/dev/ttyUSB0", 1)