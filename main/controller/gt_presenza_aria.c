/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_presenza_aria.c                                                */
/*                                                                            */
/*      gestione presenza circolazione aria con input e tempistiche           */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 23/10/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 23/10/2021      REV  : 01.0                                       */
/*                                                                            */
/******************************************************************************/

#include <stdint.h>

#include "model/model.h"

#include "controller/gt_presenza_aria.h"
#include "controller/ciclo.h"
#include "peripherals/digin.h"
#include "peripherals/digout.h"
#include "peripherals/timer.h"
#include "gel/timer/stopwatch.h"


stopwatch_t ct_ventilazione = STOPWATCH_NULL;





// * ====================================================================== * //
// *                                                                        * //
// *                                                                        * //
// *    GESTIONE PRESEANZA ARIA PER POTER RISCALDARE                        * //
// *                                                                        * //
// *                                                                        * //
// * ====================================================================== * //
//
void gt_presenza_aria(model_t *p, unsigned long timestamp)
{
    static uint8_t nf_gt_aria = 0;
    
    if (model_get_status_stopped(p) || model_get_status_pause(p))
    {
        stopwatch_init(&ct_ventilazione);
        nf_gt_aria = 0;
        p->status.f_ventilazione = 0;
//        p->status.f_all_flusso_aria = 0;
        return;
    }
    
    
    
    if (model_get_status_work(p))
    {
        if (nf_gt_aria==0/* && (rele_get(VENTILAZIONE))*/)
        {
            stopwatch_set(&ct_ventilazione, p->pmac.tempo_allarme_flusso_aria*1000UL);
            stopwatch_start(&ct_ventilazione, timestamp);
            nf_gt_aria = 1;
        }
        
        
        
        if (nf_gt_aria==1)
        {
            if ((stopwatch_is_timer_reached(&ct_ventilazione, timestamp)==1) && (digin_get(FLUSSO_ARIA)==0))
            {
                stopwatch_init(&ct_ventilazione);
                p->status.f_all_flusso_aria = 1;
                p->status.f_ventilazione = 0;
                nf_gt_aria = 2;
            }
            
            if (digin_get(FLUSSO_ARIA)==1)
            {
                stopwatch_init(&ct_ventilazione);
                p->status.f_all_flusso_aria = 0;
                p->status.f_ventilazione = 1;
                nf_gt_aria = 2;
            }
        }
        
        
        
        if (nf_gt_aria==2)
        {
            if (digin_get(FLUSSO_ARIA)==0)
            {
                stopwatch_set(&ct_ventilazione, p->pmac.tempo_allarme_flusso_aria*1000UL);
                stopwatch_start(&ct_ventilazione, timestamp);
                nf_gt_aria = 0;
            }
        }
    }
}
