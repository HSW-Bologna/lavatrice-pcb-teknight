#ifndef DIGOUT_H_INCLUDED
#define	DIGOUT_H_INCLUDED

typedef enum {
    RELE_1=0, RELE_2, RELE_3, RELE_4, RELE_5, RELE_6, NUM_RELE
} rele_t;

typedef enum {
    SPEED_5S=5000, SPEED_1S=1000, SPEED_500MS=500
} buzzer_speed_t;




void digout_init(void);
void rele_set(rele_t rele, int val);
void digout_buzzer_bip(buzzer_speed_t s,unsigned long time);
void digout_buzzer_check(void);


#endif	

