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



void gt_riscaldamento(model_t *p, unsigned long timestamp) {
    if (model_get_status_stopped(p) || model_get_status_pause(p)) {
        if (p->status.f_in_test == 0) {
            clear_digout(RISCALDAMENTO);
        }
    }



    if (model_get_status_work(p)) {
        if (p->status.f_ventilazione == 1 && p->status.stato_step == STATO_STEP_ASC &&
            ((p->pmac.tipo_pausa_asciugatura == 0 &&
              ((model_temperatura_aria_ciclo(p)) > (p->ptc_temperature))) ||
             (p->pmac.tipo_pausa_asciugatura == 1 && ((model_temperatura_aria_ciclo(p)) > (p->sht_temperature))))) {
            set_digout(RISCALDAMENTO);
        } else {
            clear_digout(RISCALDAMENTO);
        }
    }
}
