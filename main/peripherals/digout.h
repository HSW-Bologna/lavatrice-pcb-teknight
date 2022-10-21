#ifndef DIGOUT_H_INCLUDED
#define DIGOUT_H_INCLUDED

#include <string.h>
#include <stdint.h>



#warning "!!!! SCAMBIO RELE !!!! "
//
typedef enum { RELE_1 = 0, RELE_2, RELE_3, RELE_4, RELE_5, RELE_6, NUM_RELE } rele_t;

#define ORARIO            RELE_1
#define ANTIORARIO        RELE_2
#define RISCALDAMENTO     RELE_3
#define VENTILAZIONE      RELE_4    // scambiati dalla 01.5 del 19-05-22    era 4   //  riscambiati v 01.7  era 6
#define RESET_BRUCIATORE  RELE_5    // alla                                         //  del
#define MACCHINA_OCCUPATA RELE_6    // 01.6 del 30-05-22                    era 6   //  11-07-2022           era 4

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
