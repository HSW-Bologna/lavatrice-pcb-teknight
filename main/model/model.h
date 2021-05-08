#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>

typedef struct {
    uint8_t inputs;
    unsigned int impulsi;
} model_t ;



void model_init(model_t *model);
int model_get_input(model_t *model, int input);


#endif