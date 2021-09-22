#include <stdint.h>
#include "peripherals/digout.h"
#include "peripherals/led.h"

void digout_buzzer_bip(size_t r, unsigned long t_on, unsigned long t_off) {}

void rele_set(rele_t rele, int val) {}

void pwm_set(uint8_t perc) {}

void digout_buzzer_set_off(void) {}

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


void nt7534_reconfigure(uint8_t contrast) {
    (void)contrast;
}

void led_set_color(led_color_t led) {
    (void)led;
}

void pwoff_interrupt_enable(int i) {}

void pwoff_set_callback(void (*cb)()) {}

void rele_update(rele_t rele, int val) {}
