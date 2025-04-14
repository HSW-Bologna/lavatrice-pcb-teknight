#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>
#include "lvgl/lvgl.h"
#include "gel/timer/stopwatch.h"



//#define PARS_SERIALIZED_SIZE          136
#define PARS_SERIALIZED_SIZE         146 + 2
#define PRIVATE_PARS_SERIALIZED_SIZE 3
//#define PWOFF_SERIALIZED_SIZE         42
#define PWOFF_SERIALIZED_SIZE       44                            //// STR AAAA          
#define MAX_PARAMETER_CHUNK         17

#define EVENT_START                 1
#define EVENT_STOP                  2
#define EVENT_PAUSE                 3
#define EVENT_COIN                  4
#define EVENT_ALARM_MASK            0x80

typedef struct {
    uint8_t contrasto;
} parametri_riservati_t;

typedef enum {
    STATO_STOPPED = 0,
    STATO_PAUSE,
    STATO_WORK,
} stato_t;


typedef struct {
} pwoff_data_t;

typedef struct {
    uint8_t  inputs;
    uint8_t  outputs;
    uint16_t ptc_adc;
    int      ptc_temperature;

    int     pwm1;
    int     pwm2;


    parametri_riservati_t hsw;

    struct {
        stato_t      stato;
    } status;
} model_t;

void               model_init(model_t *pmodel);
char              *model_get_output_status(model_t *pmodel, int output);
char              *model_get_output_rotation(model_t *pmodel, int rotation);
stato_t            model_get_stato(model_t *pmodel);
void               model_cambia_stato(model_t *pmodel, int res);


#endif
