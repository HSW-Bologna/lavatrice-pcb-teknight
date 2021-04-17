#ifndef TEMPERATURE_H_INCLUDED
#define TEMPERATURE_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>

uint8_t crc8_ccitt(const void * data, size_t size);
void temperature_init(void);
int spi_read_temperature(uint16_t *temperature, uint16_t *humidity);


#endif