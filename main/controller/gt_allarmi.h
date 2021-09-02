/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_allarmi.h                                                      */
/*                                                                            */
/*      gestione rilievo e segnalazione allarmi                               */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 03/08/2021      REV  : 01.0                                       */
/*                                                                            */
/******************************************************************************/

#ifndef GT_ALLARMI_H_INCLUDED
#define	GT_ALLARMI_H_INCLUDED

#include "model/model.h"



void gt_allarmi (model_t *p);



typedef enum _ALLARMI
{
    ALL_NO = 0,
            
    ALL_ERRORE_RAM,
            
    ALL_OBLO_APERTO,
    ALL_EMERGENZA,
    ALL_TEMPO_SCADUTO_T1,
    ALL_INVERTER,
    ALL_FILTRO_APERTO,
    ALL_BLOCCO_BRUCIATORE,
    ALL_TEMPERATURA_1,
    ALL_FLUSSO_ARIA,
    ALL_ANOMALIA_ARIA,
            
    AVV_ANTIPIEGA,
    AVV_DRY_CONTROL,
    AVV_SOVRATEMPERATURA,
    AVV_MANUTENZIONE,
} allarmi_t ;

int get_allarme (model_t *p);

#endif  /* GT_ALLARMI_H_INCLUDED */
