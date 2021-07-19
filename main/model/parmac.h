#ifndef PARMAC_H_INCLUDED
#define PARMAC_H_INCLUDED

#include "model.h"


void        parmac_init(model_t *p, int reset);
size_t parmac_get_tot_parameters(model_t *pmodel);
const char *parmac_get_description(const model_t *pmodel, size_t parameter);
void parmac_format_value(char *string, size_t parameter, model_t *pmodel);
void parmac_operation(size_t parameter, int op,model_t *pmodel);

#endif