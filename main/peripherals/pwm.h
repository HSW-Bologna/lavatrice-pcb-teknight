#ifndef PWM_H_INCLUDED
#define PWM_H_INCLUDED

#include <stdint.h>

void pwm_init(void);
void pwm_set(uint8_t perc);

#endif