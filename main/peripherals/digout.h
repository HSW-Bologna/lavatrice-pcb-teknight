#ifndef DIGOUT_H_INCLUDED
#define DIGOUT_H_INCLUDED

#include <string.h>
#include <stdint.h>



#warning "!!!! SCAMBIO RELE !!!! "
//
typedef enum { RELE_1 = 0, RELE_2, RELE_3, RELE_4, RELE_5, RELE_6, NUM_RELE } rele_t;

#define DIGOUT_GENERALE_VENTOLE RELE_1
#define DIGOUT_POMPA_P1A        RELE_2
#define DIGOUT_POMPA_P1B        RELE_3
#define DIGOUT_RESISTENZE       RELE_4
#define DIGOUT_POMPA_P2         RELE_5
#define DIGOUT_POMPA_P3         RELE_6

void digout_init(void);

void rele_update(rele_t rele, int val);
void clear_digout_all(void);

// #define toggle_digout_port(rele_t rele)  update_digout_port(out, !get_digout_port(out))
#define set_digout(rele)   rele_update(rele, 1)
#define clear_digout(rele) rele_update(rele, 0)



void    digout_buzzer_bip(size_t r, unsigned long t_on, unsigned long t_off);
void    digout_buzzer_check(void);
void    digout_buzzer_stop(void);
uint8_t rele_get_status(void);
uint8_t rele_get(rele_t);

#endif /* DIGOUT_H_INCLUDED */
