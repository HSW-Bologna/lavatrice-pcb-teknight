#include <xc.h>
#include "utils/assert.h"
#include "gel/timer/stopwatch.h"
#include "model.h"
#include "gel/crc/crc16-ccitt.h"
#include "gel/serializer/serializer.h"
#include "lv_conf.h"
#include "peripherals/timer.h"
#include "gel/parameter/parameter.h"
#include "peripherals/NT7534.h"



parameter_handle_t parameters[MAX_PARAMETER_CHUNK];
static void        init_comune_parametri_1(model_t *pmodel);
static void        init_comune_parametri_2(model_t *pmodel);
static unsigned long tempo_da_credito(model_t *pmodel, uint16_t credito);



void model_init(model_t *pmodel) {
    assert(pmodel != NULL);

    pmodel->inputs            = 0;
    pmodel->ptc_temperature   = 0;
    pmodel->pwm1              = 0;
    pmodel->pwm2              = 0;
    pmodel->ptc_adc           = 0;
    pmodel->outputs           = 0;

    pmodel->status.stato                = 0;

    pmodel->hsw.contrasto = NT7534_DEFAULT_CONTRAST;
}


char *model_get_output_status(model_t *pmodel, int output) {
    if ((pmodel->outputs >> output) & 1)
        return "on";
    else
        return "off";
}


int model_get_riscaldamento_attivo(model_t *pmodel) {
    return (pmodel->outputs & 0x04) > 0;
}



stato_t model_get_stato(model_t *pmodel) {
    assert(pmodel != NULL);

    return pmodel->status.stato;
}

void model_cambia_stato(model_t *pmodel, int res) {
    assert(pmodel != NULL);

    pmodel->status.stato = res;
}

