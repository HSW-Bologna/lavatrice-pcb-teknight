#include "lightmodbus/lightmodbus.h"
#include "lightmodbus/slave.h"
#include "modbus_server.h"
#include "peripherals/uart_driver.h"
#include "peripherals/digout.h"

static ModbusSlave slave;
static uint8_t coils[1]={0};

void modbus_server_init(void) {
    slave.coils=coils;
    slave.coilCount=8;
    slave.address=2;
    modbusSlaveInit(&slave);
}

void modbus_server_manage(void) {
    uint8_t buffer[256];
    int len = uart_read_rx_buffer(buffer); 
    slave.request.frame=buffer;
    slave.request.length=len;
    ModbusError err = modbusParseRequest(&slave);
    if (err==MODBUS_OK || err==MODBUS_ERROR_EXCEPTION) {
        uart_async_write(slave.response.frame, slave.response.length);
        uart_clean_rx_buffer();
        rele_set(RELE_1,coils[0]);
    }
}