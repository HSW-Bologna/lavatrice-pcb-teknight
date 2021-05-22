#include <stdint.h>
#include "peripherals/digout.h"

void digout_buzzer_bip(size_t r, unsigned long t_on, unsigned long t_off) {}

void rele_set(rele_t rele, int val) {}

void pwm_set(uint8_t perc) {}

void digout_buzzer_set_off(void) {}

int digout_buzzer_is_set(void) {}

uint8_t rele_get_status(void) {
    return 0;
}


int uart_sync_write(uint8_t *data, int len) {
    return 0;
}


int uart_async_write(uint8_t *data, int len) {
    return 0;
}


int uart_read_rx_buffer(uint8_t *buffer) {
    return 0;
}


void uart_clean_rx_buffer() {}


void nt7534_reconfigure() {}