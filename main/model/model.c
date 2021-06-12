#include "model.h"
#include "parmac.h"


void model_init(model_t *pmodel) {
    pmodel->inputs          = 0;
    pmodel->impulsi         = 0;
    pmodel->ptc_temperature = 0;
    pmodel->sht_temperature = 0;
    pmodel->pwm1            = 0;
    pmodel->pwm2            = 0;
    pmodel->ptc_adc         = 0;
    pmodel->outputs         = 0;

    parmac_init(pmodel);
}


// int model_get_input(model_t *pmodel, int input) {
//    return ((pmodel->inputs >> input - 1) & 1);
//}
//
// int model_get_output(model_t *pmodel, int output) {
//    return ((pmodel->outputs >> output) & 1);
//}

char *model_get_output_status(model_t *pmodel, int output) {
    if ((pmodel->outputs >> output) & 1)
        return "on";
    else
        return "off";
}
