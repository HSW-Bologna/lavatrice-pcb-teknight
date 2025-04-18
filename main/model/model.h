#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>
#include "lvgl/lvgl.h"
#include "gel/timer/stopwatch.h"



#define PARS_SERIALIZED_SIZE         146 + 2
#define PRIVATE_PARS_SERIALIZED_SIZE 3
#define PWOFF_SERIALIZED_SIZE        44     //// STR AAAA


typedef struct {
    uint8_t contrasto;
} parametri_riservati_t;


typedef enum {
    TANK_1 = 0,
    TANK_2,
    TANK_3,
#define TANKS_NUM 3
} tank_t;


typedef enum {
    TANK_STATE_OFF = 0,
    TANK_STATE_HEATING,
    TANK_STATE_ON,
} tank_state_t;


typedef struct {
} pwoff_data_t;

typedef struct {
    uint8_t  inputs;
    uint16_t ptc_adc;
    int      ptc_temperature;

    int pwm1;
    int pwm2;

    parametri_riservati_t hsw;

    tank_state_t  tank_states[TANKS_NUM];
    unsigned long tank_durations[TANKS_NUM];
    stopwatch_t   tank_stopwatches[TANKS_NUM];
    int16_t       tank_1_temperature_setpoint;
} model_t;

void          model_init(model_t *model);
unsigned long model_get_remaining_seconds(model_t *model, tank_t tank);
void          model_start(model_t *model, tank_t tank);
void          model_stop(model_t *model, tank_t tank);
uint8_t       model_is_temperature_ok(model_t *model);
void          model_manage(model_t *model);


#endif
