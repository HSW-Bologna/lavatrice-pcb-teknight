/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_allarmi.c                                                      */
/*                                                                            */
/*      gestione rilievo e segnalazione allarmi                               */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 05/08/2021      REV  : 01.0                                       */
/*                                                                            */
/******************************************************************************/

#include "gt_allarmi.h"
#include "peripherals/digin.h"


/*----------------------------------------------------------------------------*/
/*  gt_allarme                                                                */
/*                                                                            */
/*  rilevamento allarmi                                                       */
/*----------------------------------------------------------------------------*/
void gt_allarmi (model_t *p)
{
    p->status.f_start_ok = 0; 
    
    
    if (p->status.f_start_ok==1 || p->status.f_no_gt_all==1)
        return;
    
    
    
    if (p->status.f_errore_ram_ko==1)         // ALL RAM KO -----------------------------*
    {
        // n_allarme = 9;
        
        if (p->status.n_allarme != ALL_ERRORE_RAM)
        {
            p->status.n_allarme = ALL_ERRORE_RAM;
//            Cambio_pag(PAGINA_VIS_ERR_RAM);
        }
    }
    
//////    else if (f_errore_ram_rd==1)    // ALL RAM READ ---------------------------*
//////    {
//////        // n_allarme = 21;
//////        
//////        if (n_allarme != 21)
//////        {
//////            n_allarme = 21;
//////            Cambio_pag(PAGINA_VIS_ERR_RAM);
//////        }
//////    }
//////    
//////    else if (f_errore_ram_sw==1)    // ALL RAM SOFTWARE -----------------------*
//////    {
//////        if (n_allarme != 22)
//////        {
//////            n_allarme = 22;
//////            Cambio_pag(PAGINA_VIS_ERR_RAM);
//////        }
//////    }
    
    
    
    
    
    else if (EMERGENZA_STOP==0)     // ALL EMERGENZA --------------------------*
    {
        p->status.n_allarme = ALL_EMERGENZA;
        
        if (model_get_status_not_stopped(p)) // SOLO MARCIA
        {
            p->status.f_all_emergenza = 1;
            p->status.f_all = 1;
        }
    }
    
//////    else if (f_all_blocco_bruciatore==1)    // ALL BRUCIATORE -----------------*
//////    {
//////        n_allarme = 14;
//////        f_all = 1;
//////    }
    
    else if ((ALLARME_INVERTER==0 && p->pmac.allarme_inverter_off_on==0) || (ALLARME_INVERTER==1 && p->pmac.allarme_inverter_off_on==1))  // ALL inverter --------------*
    {
         p->status.n_allarme = ALL_INVERTER;
        
        if (model_get_status_not_stopped(p)) // SOLO MARCIA
        {
            p->status.f_all_inverter = 1;
            p->status.f_all = 1;
        }
    }
    
    else if ((FILTRO_APERTO==0 && p->pmac.allarme_filtro_off_on==0) || (FILTRO_APERTO==1 && p->pmac.allarme_filtro_off_on==1))  // ALL filtro aperto ---------*
    {
         p->status.n_allarme =ALL_FILTRO_APERTO;
        
        if (model_get_status_not_stopped(p)) // SOLO MARCIA
        {
            p->status.f_all_filtro_aperto = 1;
            p->status.f_all = 1;
        }
    }
//////    
//////    else if (ab_gas==0 && f_all_mancanza_h2o==1)   // ALL no h2o frigo --*
//////    {
//////        n_allarme = 12;
//////        
//////        if (stato!=0) // SOLO MARCIA
//////        {
//////            f_all_no_h2o_frigo = 1;
//////            f_all = 1;
//////        }
//////    }
//////    
//////    else if (f_all_anomalia_aria==1) // ALL anomalia aria ---------------------*
//////    {
//////        n_allarme = 26;
//////        f_all = 1;
//////    }
//////    
//////    else if (OBLO_APERTO==0)    // ALL oblo'aperto  ---------------------------*
//////    {
//////        if (f_anti_piega==1) // !!!! 12/10/2016
//////        {
//////            timer_ciclo = 0;
//////            n_allarme = 0;
//////            gt_set_reset_bruciatore_extra();
//////            stato = 0;
//////            n_pro_sel = 0;  // !!!!!!!! ToDO PWM
//////            n_pro_sel_old = 0;  // !!!!!!!! ToDO PWM
//////            f_anti_piega = 0;
//////            f_all_pressostato = 0;
//////            f_all_flusso_aria = 0; // -!!!! ToDO
////////            f_all_anomalia_aria = 0; // -!!!! ToDO
//////            nf_anti_piega = 0;
//////            ct_anti_piega = 0;
//////            ct_anti_piega_rit = 0;
//////            
////////                                 lingua = lingua_mem;
////////                                 Set_language ();
//////            
//////            f_lingua_mem = 1;
//////            Cambio_pag (PAGINA_PRINCIPALE);
//////            
//////            f_ok_gettone = 0;
//////            tempo_get_mon = 0;
//////            cnt_nro_gettoni_consenso = 0;
//////            
//////            // Read_Ciclo (n_pro_sel); // !!!!!!!! ToDO PWM
//////            // Setvalori_Ciclo (); // !!!!!!!! ToDO PWM
//////            f_new_pag = 1;
//////            
//////            f_apri_oblo = 1;
//////            nro_buzzer = BEEP_ALL_OBLO;
//////            buzzer_on = 1;
//////            return;
//////        }
//////        
//////        f_all_flusso_aria = 0; // -!!!! ToDO
////////        f_all_anomalia_aria = 0; // -!!!! ToDO
//////
//////        n_allarme = 1;
//////        
//////        if (f_apri_oblo==1)
//////        {
//////            if (f_lingua_mem==1)
//////            {
//////                lingua = lingua_mem;    // || MANTENERE
//////                Set_language ();        // || ORDINE !!
//////                f_lingua_mem = 0;
//////                f_new_pag = 1;
//////            }
//////        }
//////        
//////        f_apri_oblo = 0;
//////        
//////        if (stato==2 && f_anti_piega==0)
//////        {
//////            f_all_oblo = 1;
//////            f_all = 1;
//////        }
//////        
//////        if (stato==0 && f_anti_piega==0 && f_all_oblo==1) // ToDO -!!!! 14/10/2020
//////        {
//////            f_all_oblo = 0;
//////            f_all = 0;
//////        }
//////    }
//////    
    else if (p->status.f_all_blocco_bruciatore==1)    // ALL BRUCIATORE -----------------*
    {
        p->status.n_allarme = ALL_BLOCCO_BRUCIATORE;
            
        if (model_get_status_not_stopped(p)) // SOLO MARCIA // 04/01/21
        {
            p->status.n_allarme = ALL_BLOCCO_BRUCIATORE;
            p->status.f_all = 1;
        }
    }
//////    
//////    else if (temp_ingresso >= 160 || (temp_ingresso <=2 && ct_antigelo==0))                             // ALL temperatura 1 ---------*
//////    {
//////        n_allarme = 17;
//////        
//////        if (stato==2)
//////        {
//////            f_all_temperatura_1 = 1;
//////            f_all = 1;
//////        }
//////    }
//////    
//////    else if (ab_uso_temp_2==1 && (temp_uscita >= 160 || (temp_uscita <=2 && ct_antigelo==0)))           // ALL temperatura  2 --------*
//////    {
//////        n_allarme = 25;
//////        
//////        if (stato==2)
//////        {
//////            f_all_temperatura_2 = 1;
//////            f_all = 1;
//////        }
//////    }
//////    
//////    else if ((tipo_pausa_asc==7 && (temperatura_t_rh/100) >= temp_sicurezza_1_out) || 
//////                /*(tipo_pausa_asc!=3 && temp_ingresso >= temp_sicurezza_1 && sonda_temp_in_out==0) || */
//////                (tipo_pausa_asc!=3 && tipo_pausa_asc!=7 && temp_ingresso >= temp_sicurezza_1 && sonda_temp_in_out==0) || 
//////                (tipo_pausa_asc==3 && temp_ingresso >= temp_sicurezza_1 && sonda_temp_in_out==0) ||
//////                /*(tipo_pausa_asc!=3 && temp_ingresso >= temp_sicurezza_1_out && sonda_temp_in_out==1) || */
//////                (tipo_pausa_asc!=3 && tipo_pausa_asc!=7 && temp_ingresso >= temp_sicurezza_1_out && sonda_temp_in_out==1) ||
//////                (tipo_pausa_asc==3 && temp_ingresso >= temp_sicurezza_1_out && sonda_temp_in_out==1))   // AVV sovratemperatura ------*
//////    {
//////        n_allarme = 4;
//////        
////////         if (stato==2)
////////         {
////////             f_all_sovratemperatura = 1;
////////             f_all = 1;
////////         }
//////    }
//////        
//////    else if (f_all_manutenzione==1) // AVV manutenzione -----------------------*
//////    {
//////        n_allarme = 13;
//////    }
//////    
//////    else if (f_all_t1==1)           // ALL flag TIMER T1 ----------------------*
//////    {
//////        n_allarme = 5;
//////        f_all = 1;
//////    }
//////    
//////    else if (f_all_t2==1)           // ALL flag TIMER T2 ----------------------*
//////    {
//////        n_allarme = 6;
//////        f_all = 1;
//////    }
//////    
//////    else if (f_all_t3==1)           // ALL flag TIMER T3 ----------------------*
//////    {
//////        n_allarme = 7;
//////        f_all = 1;
//////    }
//////    
//////    else if (f_all_pw_off==1)       // AVV / ALL flag allarme PW-OFF ----------*
//////    {
//////        n_allarme = 8;
//////    }
//////    
//////    else if (FILTRO_INTASATO==0 && ab_in_filtro_aria==0) // ALL filtro intasato ---------*
//////    {
//////        n_allarme = 3;
//////        
//////        if (stato!=0) // SOLO MARCIA
//////        {
//////            f_all_filtro_intasato = 1;
//////            f_all = 1;
//////        }
//////    }
//////    
//////    
//////    
//////    
//////    
//////    else if (f_all_flusso_aria==1) // AVV flusso aria -------------------------*
//////    {
//////        n_allarme = 19;
//////
//////    }
//////    
//////    else if (f_all_press_ventilazione==1) // AVV sovrapressione ventilazione --*
//////    {
//////        n_allarme = 23;
//////    }
//////    
////////////    else if (F_IN_FLUSSO_ARIA==1 && ab_in_filtro_aria==1 && stato!=2 && nf_all_flusso_aria==0 && ct_all_flusso_aria==0) // ALL pressostato ----------*
////////////    {
////////////        n_allarme = 20; // CASSATO IL 04/12/2020
////////////        
////////////        // if (stato==2)
////////////        if (stato!=2)
////////////        {
////////////            f_all_pressostato = 1;
////////////            f_all = 1;
////////////        }
////////////    }
//////    
////////    else if (ab_rotondi==1 && ((RIBALTAMENTO==0 && all_h2o_off_on==2) || (RIBALTAMENTO==1 && all_h2o_off_on==3)))        // ribaltamento (EX libero) -------------------*
////////    {
////////        n_allarme = 15;
////////        
////////        if (stato==2)
////////        {
////////            f_all_ribaltamento = 1;
////////            f_all = 1;
////////        }
////////    }
//////    
////////    else if (tipo_pausa_asc==3 && UMIDITA_SHT21<=2) // umidita' troppo scarsa
////////    {
////////         n_allarme = 16;
////////         
////////         if (stato==2)
////////         {
////////             f_all_umidita = 1;
////////             f_all = 1;
////////         }
////////    }
//////    
//////    else if (f_all_dry_contol==1)   // AVV flag DRY-CONTROL -------------------*
//////    {
//////        n_allarme = 24;
//////    }
//////    
//////    else if (f_anti_piega==1)       // AVV flag allarme ANTIPIEGA -------------*
//////    {
//////        n_allarme = 18;
//////    }
//////    
//////    else // NESSUN ALL / AVV rilevati -----------------------------------------*
//////    {
//////        n_allarme = 0;
//////    }
//////    
//////    
//////    
//////    
//////    
//////    // CP se AVVISO ========================================================= //
//////    if (n_allarme!=0 && n_allarme!=3 && n_allarme!=4 && n_allarme!=14 && n_allarme!=13 && n_allarme!=18 && n_allarme!=19 && n_allarme!=23 && n_allarme!=24) // CP se "FILTRO INTASATO" o "SOVRATEMPERATURA" o "BLOCCO BRUCIATORE" o "MANUTENZIONE" o "ANTIPEGA" o "NO FLUSSO ARIA"
//////    {
//////        if (stato==2) // se sono in START passo in PAUSA - M 20/10/10
//////        {
//////            f_out_scalato = 1;
//////            
//////            nro_buzzer = BEEP_ALL_ALLARME;
//////            buzzer_on = 1;
//////        }
//////    }
    
    if (p->status.n_allarme != 0)
    {
    }
}
