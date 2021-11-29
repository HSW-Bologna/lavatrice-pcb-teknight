/*
 * File:   ciclo.c
 * Author: Virginia
 *
 * Created on 19 luglio 2021, 9.24
 */

#include "controller/ciclo.h"
#include "model/model.h"
#include "view/view_types.h"
#include "peripherals/timer.h"

extern stopwatch_t ct_moto_cesto;
extern stopwatch_t ct_oblo_open_close_on;

extern stopwatch_t ct_anti_piega_rit;
extern stopwatch_t ct_anti_piega_max;
extern stopwatch_t ct_anti_piega;
extern stopwatch_t ct_anti_piega_pausa;



void gt_ciclo(model_t *p, uint32_t timestamp)
{
    if (model_get_status_stopped(p))
    {
        stopwatch_init(&ct_moto_cesto);
        
        stopwatch_init(&ct_anti_piega_rit);
        stopwatch_init(&ct_anti_piega_max);
        stopwatch_init(&ct_anti_piega);
        stopwatch_init(&ct_anti_piega_pausa);
    }
    


    // STATO - PAUSA ======================================================== //
    if (model_get_status_pause(p))
    {
        stopwatch_pause(&ct_moto_cesto, get_millis());
        
        stopwatch_pause(&ct_anti_piega_rit, get_millis());
        
        stopwatch_pause(&ct_anti_piega_max, get_millis());
        stopwatch_pause(&ct_anti_piega, get_millis());
        stopwatch_pause(&ct_anti_piega_pausa, get_millis());
        model_metti_tempo_lavoro_in_pausa(p, get_millis());
    }
    
    
    
    
    // STATO - WORK ======================================================== //
    if (model_get_status_work(p))
    {
        switch (p->status.stato_step) {
            case STATO_STEP_ASC:
                if (model_tempo_lavoro_scaduto(p, get_millis())) {
                    if (model_ciclo_corrente(p)->abilita_raffreddamento)
                    {
                        model_comincia_raffreddamento(p);
                    }
                    else if (model_ciclo_corrente(p)->abilita_antipiega)
                    {
                        model_comincia_antipiega(p);
                    }
                    else
                    {
                        model_set_status_stopped(p);
                    }
                    view_event((view_event_t){.code = VIEW_EVENT_STEP_UPDATE});
                }
                break;

            case STATO_STEP_RAF:
                if (model_tempo_lavoro_scaduto(p, get_millis())) {
                    if (model_ciclo_corrente(p)->abilita_antipiega)
                    {
                        model_comincia_antipiega(p);
                    }
                    else
                    {
                        model_set_status_stopped(p);
                    }
                    view_event((view_event_t){.code = VIEW_EVENT_STEP_UPDATE});
                }
                break;

            case STATO_STEP_ANT:
                break;
                
            default:
                break;
        }
    }
    
    
    
    
//    // STATO - MARCIA ======================================================= //
//    if (stato_in_marcia(&stato) && stato.stato_step==1 && step_parameters.codice_step!=0)
//    {
//#ifdef  AB_TEST_PROX_IN_CICLO
//        if (stato.f_all_vel_prox == 1) // NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN ToDO -!!!!
//        {
//            stato.stato = STATO_INDEFINITO;
//            stato.sottostato = 0;
//            return;
//        }
//#endif
//        
//        
//        
//        
//        
//        if ((stopwatch_get_state(&ct_attesa_fra_step) == TIMER_COUNTING) || (stopwatch_get_state(&ct_attesa_fra_step) == TIMER_PAUSED))
//        {   
//            if (stopwatch_is_timer_reached(&ct_attesa_fra_step, timestamp))
//            {
//                stopwatch_init(&ct_attesa_fra_step);
//            }
//            else
//            {
//                return;
//            }
//        }
//        
//        
//        
//        
//        
//        if (stopwatch_is_timer_reached(&ct_all_livello, timestamp)) 
//        {
//            stopwatch_init(&ct_all_livello);
//            Nop();
//            Nop();
//            Nop();
//            Nop();
//            
//            stato.f_all_no_riempimento = 1;
//        }
//        
//        if (stopwatch_is_timer_reached(&ct_all_temperatura, timestamp))
//        {
//            stopwatch_init(&ct_all_temperatura);
//            Nop();
//            Nop();
//            Nop();
//            Nop();
//            
//            stato.f_all_no_riscaldamento = 1;
//        }
//        
//        if (stopwatch_is_timer_reached(&ct_all_scarico, timestamp)) 
//        {
//            stopwatch_init(&ct_all_scarico);
//            Nop();
//            Nop();
//            Nop();
//            Nop();
//            
//            stato.f_all_no_scarico = 1;
//        }
//        
//        
//        
//        if (stato.f_alt_tempo_durata == 1)
//        {
//            stopwatch_pause(&ct_durata, get_millis());
//        }
//        else if ((stopwatch_get_state(&ct_durata) == TIMER_PAUSED) && stato.f_alt_tempo_durata == 0)
//        {
//            stopwatch_start(&ct_durata, get_millis());
//        }
//        
//        if (stopwatch_get_state(&ct_precarica) == TIMER_PAUSED)
//            stopwatch_start(&ct_precarica, get_millis());
//        
//        if (stopwatch_get_state(&ct_all_livello) == TIMER_PAUSED)
//        {
//            stopwatch_start(&ct_all_livello, get_millis());
//        }
//        
//        if (stopwatch_get_state(&ct_all_temperatura) == TIMER_PAUSED)
//            stopwatch_start(&ct_all_temperatura, get_millis());
//        if (stopwatch_get_state(&ct_all_scarico) == TIMER_PAUSED)
//            stopwatch_start(&ct_all_scarico, get_millis());
//        
//        if (stopwatch_get_state(&ct_frenata) == TIMER_PAUSED) // ToDO -!!!!
//            stopwatch_start(&ct_frenata, get_millis());
//        
//        
//        
//        
//        
//        /* ------------------------------------------------------------------ */ 
//        if (step_parameters.codice_step==C_AMM || step_parameters.codice_step==C_PRE || step_parameters.codice_step==C_LAV || step_parameters.codice_step==C_RIS)
//        {
//            gt_funz_amm_pre_lav_ris();
//        }
//        /* ------------------------------------------------------------------ */ 
//        else if (step_parameters.codice_step==C_SCA)
//        {
//            gt_funz_scarico();
//        }
//        /* ------------------------------------------------------------------ */ 
//        else if (step_parameters.codice_step==C_CEN)
//        {
//            gt_funz_centrifuga();
//        }
//        /* ------------------------------------------------------------------ */ 
//        else if (step_parameters.codice_step==C_SRO)
//        {
//            gt_funz_srotolamento();
//        }
//        /* ------------------------------------------------------------------ */ 
//        else if (step_parameters.codice_step==C_ATT)
//        {
//            gt_funz_attesa();
//        }
//        /* ------------------------------------------------------------------ */ 
//        else // NESSUNA FUNZIONE CONOSCIUTA
//        {
//            Nop();
//            Nop();
//            Nop();
//            Nop();
//        }
//    }
//    
//    
//    
//    if (stato_in_marcia(&stato) && (stopwatch_is_timer_reached(&ct_durata, timestamp)))
//    {
//        if (step_parameters.codice_step==C_CEN)
//        {
//            if (stato.f_vis_popup_frenata==FRE_OFF)
//            {
//                stato.f_vis_popup_frenata = FRE_CIC;
//                return;
//            }
//            
//            if (stato.f_vis_popup_frenata==FRE_CIC || stato.f_vis_popup_frenata==FRE_SM1 || stato.f_vis_popup_frenata==FRE_SM2)
//            {
//                return;
//            }
//        }
//        
//        clear_digout_partial ();
//        
//        stato.f_vis_popup_frenata = FRE_OFF;
//        
//        stato.stato_step = 0;
//        stato.sottostato = 0;
//        
//        stopwatch_init(&ct_durata);
//        stopwatch_init(&ct_precarica);
//        stopwatch_init(&ct_all_livello);
//        stopwatch_init(&ct_all_temperatura);
//        stopwatch_init(&ct_all_scarico);
//    }

}
