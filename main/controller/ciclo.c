/*
 * File:   ciclo.c
 * Author: Virginia
 *
 * Created on 19 luglio 2021, 9.24
 */

#include "controller/ciclo.h"
#include "model/model.h"
#include <xc.h>

extern stopwatch_t ct_moto_cesto;
extern stopwatch_t ct_oblo_open_close_on;

extern stopwatch_t ct_anti_piega_rit;
extern stopwatch_t ct_anti_piega_max;
extern stopwatch_t ct_anti_piega;
extern stopwatch_t ct_anti_piega_pausa;



void gt_ciclo(model_t *p, uint32_t timestamp)
{
    Nop();
    
    if (model_get_status_stopped(p))
    {
        stopwatch_init(&ct_moto_cesto);
        
        stopwatch_init(&ct_anti_piega_rit);
        stopwatch_init(&ct_anti_piega_max);
        stopwatch_init(&ct_anti_piega);
        stopwatch_init(&ct_anti_piega_pausa);
    }
    
    
    return;
    
//    if (model_get_status_stopped(p)) // =========================================== //
//    {
////      stato.numero_programma = 0; ToDO -!!!!
//        
//        
//        
//        stopwatch_init(&ct_durata);
//        stopwatch_init(&ct_precarica);
//        stopwatch_init(&ct_all_livello);
//        stopwatch_init(&ct_all_temperatura);
//        stopwatch_init(&ct_all_scarico);
//        
//        if (stato.f_in_test==0)
//        {
//            stopwatch_init(&ct_colpo_apert_scarico);
//        }
//        
//        stopwatch_init(&ct_gt_sbil);
//        stopwatch_init(&ct_frenata);
//        stopwatch_init(&ct_gt_sbil_acc);
//        
////////        stopwatch_set(&ct_durata, 0);
////////        stopwatch_set(&ct_precarica, 0);
////////        stopwatch_set(&ct_all_livello, 0);
////////        stopwatch_set(&ct_all_temperatura, 0);
////////        stopwatch_set(&ct_all_scarico, 0);
////////        
////////        if (stato.f_in_test==0)
////////        {
////////            stopwatch_set(&ct_colpo_apert_scarico, 0);
////////        }
////////        
////////        stopwatch_set(&ct_gt_sbil, 0);
////////        stopwatch_set(&ct_frenata, 0);
////////        stopwatch_set(&ct_gt_sbil_acc, 0);
//        
//        
//        
//        stopwatch_init(&ct_frenata_tappo_prox);
////////        stopwatch_set(&ct_frenata_tappo_prox, 0);
//        
//        
//        
//        stato.sottostato = 0;
//        step_parameters.codice_step = 0;
//        stato.cod_vis_ped = 0;
//        
//        stato.f_alt_tempo_durata = 0;
//        stato.f_alt_tempo_durata_sap = 0;
//        stato.f_alt_tempo_durata_sap_standby = 0;
//        
//        stato.f_vis_popup_frenata = FRE_OFF;
//        stato.nro_sbilanc = 0;
//        stato.cc_cicli_prep = 0;
//        stato.f_sbilanciamento = 0;
//        stato.f_blocco_velocita = 0;
//
//        stato.nf_ok_liv  = 0;
//        stato.f_ok_liv = 0;
//        stato.ff_ok_liv = 0;
//        
//        stato.nf_ok_liv_risc = 0;
//        stato.f_ok_liv_risc = 0;
//        
//        
//        stato.f_ok_temp = 0;
//        stato.ff_ok_temp = 0;
//        stato.f_in_termodeg = 0;
//        
//        stato.f_all_no_riempimento = 0;
//        stato.f_all_no_riscaldamento = 0;
//        stato.f_all_no_scarico = 0;
//        
//        stato.f_ok_scarico = 0;
//        
//        memset(&step_parameters, 0, sizeof(step_parameters_t));
//        
//        return;
//    }
//    
//    
//    
//    
//    // STATO - PAUSA ======================================================== //
//    if (model_get_status_pause(p))
//    {
//        stopwatch_pause(&ct_durata, get_millis());
//        
//        stopwatch_pause(&ct_precarica, get_millis());
//        
//        stopwatch_pause(&ct_all_livello, get_millis());
//        stopwatch_pause(&ct_all_temperatura, get_millis());
//        stopwatch_pause(&ct_all_scarico, get_millis());
//        
//        stopwatch_pause(&ct_frenata, get_millis());
//    }
//    
//        
//    
//    
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






















