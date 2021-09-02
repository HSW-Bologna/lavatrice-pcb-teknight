/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_cesto.h                                                        */
/*                                                                            */
/*      gestione moto & velocita' cesto                                       */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 03/08/2021      REV  : 01.0                                       */
/*                                                                            */
/******************************************************************************/

#ifndef GT_CESTO_H_INCLUDED
#define	GT_CESTO_H_INCLUDED

#include "model/model.h"

typedef enum
{
    CESTO_MOTO_STOP = 0,
    CESTO_MOTO_AVANTI,
    CESTO_MOTO_INDIETRO,
            
    CESTO_MOTO_ORA_GIRO,
    CESTO_MOTO_ORA_PAUSA,
    CESTO_MOTO_ANT_GIRO,
    CESTO_MOTO_ANT_PAUSA,
} cesto_moto_t;



typedef enum
{
    ANTIPIEGA_START = 0,
    ANTIPIEGA_RITARDO,
    ANTIPIEGA_TIPO_DURATA,
    ANTIPIEGA_DURATA_TERMINE,
            
    ANTIPIEGA_DURATA_TERMINE_CHECK,        
    ANTIPIEGA_DURATA_TERMINE_GESTIONE,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_NO,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_NO_GIRO,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_NO_PAUSA,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_SI,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_SI_GIRO_ORA,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_SI_PAUSA_ORA,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_SI_GIRO_ANT,
    ANTIPIEGA_DURATA_TERMINE_GESTIONE_INV_SI_PAUSA_ANT,
            
    ANTIPIEGA_DURATA_INFINITA,
    ANTIPIEGA_DURATA_INFINITA_INV_NO,
    ANTIPIEGA_DURATA_INFINITA_INV_NO_GIRO,
    ANTIPIEGA_DURATA_INFINITA_INV_NO_PAUSA,
    ANTIPIEGA_DURATA_INFINITA_INV_SI,
    ANTIPIEGA_DURATA_INFINITA_INV_SI_GIRO_ORA,
    ANTIPIEGA_DURATA_INFINITA_INV_SI_PAUSA_ORA,
    ANTIPIEGA_DURATA_INFINITA_INV_SI_GIRO_ANT,
    ANTIPIEGA_DURATA_INFINITA_INV_SI_PAUSA_ANT,
            
    ANTIPIEGA_ATTESA_APERTURA_OBLO,
} fase_antipiega_t;




void gt_cesto(model_t *p, unsigned long timestamp);

void cesto_stop(void);
void cesto_avanti(model_t *p);
void cesto_indietro(model_t *p);

void gt_velocita_cesto(model_t *p);
void gt_velocita_simulata(model_t *p);

#endif
