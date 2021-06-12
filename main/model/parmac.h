#ifndef PARMAC_H_INCLUDED
#define PARMAC_H_INCLUDED

#include "model.h"


void        parmac_init(model_t *p);
size_t      parmac_get_tot_parameters(void);
const char *parmac_get_description(const model_t *pmodel, size_t parameter);
void        parmac_format_value(char *string, size_t parameter);
void        parmac_operation(size_t parameter, int op);

#endif