#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>

typedef struct {
    uint8_t inputs;
    uint8_t outputs;
    unsigned int impulsi;

    uint16_t ptc_adc;
    int ptc_temperature;
    int sht_temperature;
    

    int pwm;
} model_t ;



void model_init(model_t *pmodel);
//int model_get_input(model_t *pmodel, int input);
//int model_get_output(model_t *pmodel, int output);
char* model_get_output_status(model_t *pmodel, int output);


#endif