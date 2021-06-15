#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>
#include "lvgl/lvgl.h"

#define PARS_SERIALIZED_SIZE 4
#define PWOFF_SERIALIZED_SIZE 4

typedef struct {
    uint16_t credito;
} pwoff_data_t;

typedef struct {
    uint8_t      inputs;
    uint8_t      outputs;
    uint16_t ptc_adc;
    int      ptc_temperature;
    int      sht_temperature;

    int pwm1;
    int pwm2;

    struct {
        uint8_t modello;
        uint8_t livello_accesso;
    } pars;
    
    uint32_t    mem_free_size;
    uint8_t     mem_frag_pct;
    uint32_t    mem_low;
        
    pwoff_data_t pwoff;
    
} model_t;

void model_init(model_t *pmodel);
// int model_get_input(model_t *pmodel, int input);
// int model_get_output(model_t *pmodel, int output);
char *model_get_output_status(model_t *pmodel, int output);
size_t model_pars_serialize(model_t *pmodel, uint8_t buff[static PARS_SERIALIZED_SIZE]);
size_t model_pars_deserialize(model_t *pmodel, uint8_t *buff);
size_t model_pwoff_serialize(model_t *pmodel, uint8_t buff[static PWOFF_SERIALIZED_SIZE]);
size_t model_pwoff_deserialize(model_t *pmodel, uint8_t *buff);
void model_mem_data(model_t *pmodel, lv_mem_monitor_t *mem);

#endif