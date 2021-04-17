#ifndef DIGOUT_H_INCLUDED
#define	DIGOUT_H_INCLUDED

typedef enum {
    RELE_1=0, RELE_2, RELE_3, RELE_4, RELE_5, RELE_6, NUM_RELE
} rele_t;

void digout_init(void);
void rele_set(rele_t rele, int val);


#endif	

