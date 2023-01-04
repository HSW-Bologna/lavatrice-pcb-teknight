/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_macchina_occupata.c                                            */
/*                                                                            */
/*      gestione uscita MACCHINA OCCUPATA                                     */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 03/08/2021      REV  : 02.4                                       */
/*                                                                            */
/******************************************************************************/

#include "controller/gt_macchina_occupata.h"

#include "model/model.h"
#include "peripherals/digout.h"

#include "gt_allarmi.h"





// ************************************************************************** //
void gt_macchina_occupata(model_t *p)
{
    // NA - OFF ############################################################# //
    if (p->pmac.macchina_libera_off_on==0)
    {
        // IN MARCIA + TOLTO CON OBLO' APERTO MA RIMESSO SE ALLARME "SOTTO" (da GA VENEZIA)
        if (p->pmac.tipo_out_macchina_occupata==3)
        {
            if (p->status.f_in_test==0 && p->status.stato!=0)
            {
                if (p->status.f_all==1 && p->status.n_allarme==ALL_OBLO_APERTO) // PORTA APERTA
                {
                    clear_digout (MACCHINA_OCCUPATA);
                }
                else
                {
                    set_digout (MACCHINA_OCCUPATA);
                }
            }
            else if (p->status.f_in_test==0)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
        }
        
        
        
        
        
        // IN MARCIA + TOLTO CON OBLO' APERTO
        if (p->pmac.tipo_out_macchina_occupata==2)
        {
            if (p->status.f_in_test==0 && p->status.stato!=0)
            {
                if (p->status.f_all==1 && p->status.n_allarme==ALL_OBLO_APERTO) // PORTA APERTA
                {
                    clear_digout (MACCHINA_OCCUPATA);
                }
                else
                {
                    set_digout (MACCHINA_OCCUPATA);
                }
            }
            else if (p->status.f_in_test==0)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
        }
        
        
        
        // SOLO ALL ============================================================
        if (p->pmac.tipo_out_macchina_occupata==1)
        {
            if (p->status.f_in_test==0 && p->status.f_all==1 && p->status.n_allarme!=1)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0 && p->status.f_all==0)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
        }
        
        
        
        // ALL + START + OBLO' =================================================
        if (p->pmac.tipo_out_macchina_occupata==0)
        {
            if (p->status.f_in_test==0 && p->status.f_all==1 && p->status.n_allarme!=1)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0 && p->status.stato==0 && p->status.f_ok_gettone==1)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0 && (p->status.stato!=0 || p->status.f_ok_gettone==1) && p->status.f_all==0)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
        }
    }
    
    
    
    
    
    // NC - ON ############################################################## //
    if (p->pmac.macchina_libera_off_on==1)
    {
        // IN MARCIA + TOLTO CON OBLO' APERTO MA RIMESSO SE ALLARME "SOTTO" (da GA VENEZIA)
        if (p->pmac.tipo_out_macchina_occupata==3)
        {
            if (p->status.f_in_test==0 && p->status.stato!=0)
            {
                if (p->status.f_all==1 && p->status.n_allarme==ALL_OBLO_APERTO) // PORTA APERTA
                {
                    clear_digout (MACCHINA_OCCUPATA);
                }
                else
                {
                    set_digout (MACCHINA_OCCUPATA);
                }
            }
            else if (p->status.f_in_test==0)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
        }
        
        
        
        // IN MARCIA + TOLTO CON OBLO' APERTO ==================================
        if (p->pmac.tipo_out_macchina_occupata==2)
        {
            if (p->status.f_in_test==0 && p->status.stato!=0)
            {
                if (p->status.f_all==1 && p->status.n_allarme==1) // PORTA APERTA
                {
                    set_digout (MACCHINA_OCCUPATA);
                }
                else
                {
                    clear_digout (MACCHINA_OCCUPATA);
                }
            }
            else if (p->status.f_in_test==0)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
        }
        
        
        
        // SOLO ALL ============================================================
        if (p->pmac.tipo_out_macchina_occupata==1)
        {
            if (p->status.f_in_test==0 && p->status.f_all==1 && p->status.n_allarme!=1)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0 && p->status.f_all==0)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
        }
        
        
        
        // ALL + START + OBLO' =================================================
        if (p->pmac.tipo_out_macchina_occupata==0)
        {
            if (p->status.f_in_test==0 && p->status.f_all==1 && p->status.n_allarme!=1)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0 && p->status.stato==0 && p->status.f_ok_gettone==1)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0 && (p->status.stato!=0 || p->status.f_ok_gettone==1) && p->status.f_all==0)
            {
                clear_digout (MACCHINA_OCCUPATA);
            }
            else if (p->status.f_in_test==0)
            {
                set_digout (MACCHINA_OCCUPATA);
            }
        }
    }
}
