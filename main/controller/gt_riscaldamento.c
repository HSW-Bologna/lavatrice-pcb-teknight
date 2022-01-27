/*
 * File:   gt_riscaldamento.c
 * Author: Virginia
 *
 * Created on 19 luglio 2021, 9.35
 */
// ************************************************************************** //

#include "model/model.h"

#include "controller/gt_riscaldamento.h"
#include "controller/ciclo.h"

#include "peripherals/digout.h"
#include "peripherals/timer.h"
#include "gel/timer/stopwatch.h"


#define ISTERESI_TEMPERATURA 2


static int temperatura_scesa(model_t *p);
static int temperatura_raggiunta(model_t *p);



void gt_riscaldamento(model_t *p, unsigned long timestamp) {
    if (model_get_status_stopped(p) || model_get_status_pause(p)) {
        if (p->status.f_in_test == 0) {
            clear_digout(RISCALDAMENTO);
        }
    }



    if (model_get_status_work(p)) {
        if (p->status.f_ventilazione == 1 && p->status.stato_step == STATO_STEP_ASC) {
            if (temperatura_scesa(p)) {
                set_digout(RISCALDAMENTO);
            } else if (temperatura_raggiunta(p)) {
                clear_digout(RISCALDAMENTO);
            }
        }
    }
}


static int temperatura_raggiunta(model_t *p) {
    return model_temperatura_aria_ciclo(p) > model_get_temperatura_corrente(p) + ISTERESI_TEMPERATURA;
}


static int temperatura_scesa(model_t *p) {
    return model_temperatura_aria_ciclo(p) < model_get_temperatura_corrente(p) - ISTERESI_TEMPERATURA;
}