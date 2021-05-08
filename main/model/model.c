#include "model.h"


void model_init(model_t *model) {
    model->inputs=0;
    model->impulsi=0;
    model->temperatura=0;
    model->pwm=0;
}

int model_get_input(model_t *model, int input) {
    
    return ((model->inputs >> input-1) | 0);
}

