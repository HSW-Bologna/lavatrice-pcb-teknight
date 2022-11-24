/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_riscaldamento.c                                                */
/*                                                                            */
/*      gestione attivazione riscaldamento                                    */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 19/07/2022      REV  : 01.8                                       */
/*                                                                            */
/******************************************************************************/

#include "model/model.h"

#include "controller/gt_riscaldamento.h"
#include "controller/ciclo.h"

#include "peripherals/digout.h"
#include "peripherals/timer.h"
#include "gel/timer/stopwatch.h"


#define ISTERESI_TEMPERATURA 2



void gt_riscaldamento(model_t *p, unsigned long timestamp)
{
    if ( model_get_status_not_stopped(p))
    {
        if ( (p->pmac.sonda_temperatura_in_out==0 && (p->status.temperatura_rilevata >= (p->pmac.temperatura_sicurezza_1)) ) || (p->pmac.sonda_temperatura_in_out==1 && (p->status.temperatura_rilevata >= (p->pmac.temperatura_sicurezza_1_out)) ) )
        {
            p->status.f_all_sovratemperatura = 1;
        }
        else
        {
            p->status.f_all_sovratemperatura = 0;
        }
    }
    else
    {
        p->status.f_all_sovratemperatura = 0;
    }
    
    
    
    
    
    if ( model_get_status_stopped(p) || model_get_status_pause(p) || p->status.f_all_sovratemperatura==1 )
    {
        if (p->status.f_in_test == 0)
        {
            clear_digout(RISCALDAMENTO);
            return;
        }
    }
    
    
    
    
    
    if (model_get_status_work(p))
    {
        static unsigned char f_in_temp = 0;
        
        if (p->status.f_ventilazione == 0 ||  p->status.stato_step != STATO_STEP_ASC)
        {
            clear_digout(RISCALDAMENTO);
        }
        else if (p->status.f_ventilazione == 1 && p->status.stato_step == STATO_STEP_ASC)
        {
            if (f_in_temp == 0)
            {
                if (model_get_temperatura_corrente(p) < (model_temperatura_aria_ciclo(p) +  model_ciclo_corrente(p)->offset_temperatura_aria_alto))
                {
                    set_digout(RISCALDAMENTO);
                }
                else
                {
                    clear_digout(RISCALDAMENTO);
                    f_in_temp = 1;
                }
            }
            else if (f_in_temp == 1)
            {
                if (model_get_temperatura_corrente(p) < (model_temperatura_aria_ciclo(p) - model_ciclo_corrente(p)->offset_temperatura_aria_basso))
                {
                    set_digout(RISCALDAMENTO);
                    f_in_temp = 0;
                }
            }
        }
    }
}





void gt_umidita(model_t *p,  unsigned long timestamp)
{
    // NO DRY in: pmac.tipo_pausa_asciugatura==0, pmac.sonda_temperatura_in_out==0, STOP, PAUSA, tipo_asciugatura_m_a=0, status.stato_step!=STATO_STEP_ASC
    //
    if (p->pmac.tipo_pausa_asciugatura==0 || p->pmac.sonda_temperatura_in_out==0 || model_get_status_not_work(p) || ( model_ciclo_corrente(p)->tipo_asciugatura_m_a==0) || ( p->status.stato_step != STATO_STEP_ASC) ) 
    {
        p->status.f_all_dry_contol = 0;
        return;
    }
    
    
    
    if ( p->sht_umidity > model_umidita_aria_ciclo(p))
    {
        if (p->status.f_all_dry_contol==0 || p->status.f_all_dry_contol==1)
        {
            p->status.f_all_dry_contol = 1;
            model_metti_tempo_lavoro_in_pausa(p, get_millis());
        }
    }
    else
    {
        if (p->status.f_all_dry_contol==1 )
        {
            stopwatch_setngo(&p->status.tempo_umidita, (180 * 1000UL), get_millis());   //// STR AAAA PPPP POI PAR MAC *!!!! ToDO
//            stopwatch_setngo(&p->status.tempo_umidita, (10 * 1000UL), get_millis());    //// STR AAAA PPPP
            p->status.f_all_dry_contol = 2;
        }
        
        if (p->status.f_all_dry_contol==2 )
        {
            if (stopwatch_is_timer_reached(&p->status.tempo_umidita, timestamp))
            {
                stopwatch_init(&p->status.tempo_umidita);
                stopwatch_start(&p->status.tempo_asciugatura, get_millis());
                p->status.f_all_dry_contol = 0;
            }
        }
    }
}
