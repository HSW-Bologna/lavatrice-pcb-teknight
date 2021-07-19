#ifndef DIGOUT_H_INCLUDED
#define	DIGOUT_H_INCLUDED

#include <string.h>
#include <stdint.h>

typedef enum {
    RELE_1=0, RELE_2, RELE_3, RELE_4, RELE_5, RELE_6, NUM_RELE
} rele_t;

#define ORARIO RELE_1
#define ANTIORARIO RELE_2
#define RISCALDAMENTO RELE_3
#define VENTILAZIONE RELE_4
#define RESET_BRUCIATORE RELE_5
#define MACCHINA_OCCUPATA RELE_6

void digout_init(void);
void rele_set(rele_t rele, int val);
void digout_buzzer_bip(size_t r, unsigned long t_on, unsigned long t_off);
void digout_buzzer_check(void);
uint8_t rele_get_status(void);

#endif	

