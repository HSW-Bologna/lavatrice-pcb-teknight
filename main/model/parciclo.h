#ifndef PARCICLO_H_INCLUDED
#define PARCICLO_H_INCLUDED

#include "model.h"

void        parciclo_init(model_t *p, int reset);
void parciclo_operation(size_t parameter, tipo_ciclo_t ciclo, int op, model_t *pmodel);
const char *parciclo_get_description(const model_t *pmodel, tipo_ciclo_t ciclo, size_t parameter);
void parciclo_format_value(char *string, tipo_ciclo_t ciclo, size_t parameter, model_t *pmodel);
size_t parciclo_get_tot_parameters(tipo_ciclo_t ciclo, model_t *pmodel);

#endif