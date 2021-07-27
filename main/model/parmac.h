#ifndef PARMAC_H_INCLUDED
#define PARMAC_H_INCLUDED

#include "model.h"


void        parmac_init(model_t *p, int reset);
void        parmac_setup(model_t *p, size_t chunk, int reset);
size_t      parmac_get_tot_parameters(uint8_t al);
void        parmac_format_value(model_t *pmodel, char *string, size_t parameter, uint8_t al);
const char *parmac_get_description(model_t *pmodel, size_t parameter, uint8_t al);
void        parmac_operation(model_t *pmodel, size_t parameter, int op, uint8_t al);

#endif