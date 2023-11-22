/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_ventilazone.h                                                  */
/*                                                                            */
/*      gestione VENTILAZIONE                                                 */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 31/07/2023      REV  : 03.0                                       */
/*                                                                            */
/******************************************************************************/

#ifndef GT_VENTILAZIONE_H_INCLUDED
#define	GT_VENTILAZIONE_H_INCLUDED

#include "model/model.h"
#include "peripherals/pwm.h"

void gt_ventilazione(model_t *p,  unsigned long timestamp);


void ventilazione_stop(model_t *p);
void ventilazione_marcia(model_t *p);

void ventilazione_apertura_oblo(model_t *p, unsigned long timestamp);

void gt_velocita_ventilazione(model_t *p);
void gt_velocita_ventilazione_simulata(model_t *p);

#endif  /* GT_VENTILAZIONE_H_INCLUDED */
