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
/*  U.mod.: 31/07/2023      REV  : 03.0                                       */
/*                                                                            */
/******************************************************************************/

#ifndef GT_ALLARMI_H_INCLUDED
#define	GT_ALLARMI_H_INCLUDED

#include "model/model.h"

#define PRIMO_CODICE_AVVISI = AVV_ANTIPIEGA;

void gt_allarmi (model_t *p);



typedef enum _ALLARMI
{
    ALL_NO = 0,             // 00
     
    ALL_ERRORE_RAM,         // 01
     
    ALL_OBLO_APERTO,        // 02
    ALL_OBLO_SBLOCCATO,
    ALL_EMERGENZA,
    ALL_TEMPO_SCADUTO_T1,
    ALL_INVERTER,
    ALL_FILTRO_APERTO,
    ALL_BLOCCO_BRUCIATORE,
    ALL_TEMPERATURA_1,      // 09
    ALL_FLUSSO_ARIA,
    ALL_ANOMALIA_ARIA,      // 11
     
    AVV_ANTIPIEGA,          // 12
    AVV_APRIRE_OBLO,        
    AVV_DRY_CONTROL,        // 14
    
    AVV_SOVRATEMPERATURA,   // 15
    AVV_MANUTENZIONE,       // 16
    AVV_PW_OFF,             // 17
    
    ALLARMI_NUM,            
} allarmi_t ;

int get_allarme (model_t *p);
void gt_allarmi_azzera(model_t *pmodel);

#endif  /* GT_ALLARMI_H_INCLUDED */
