/******************************************************************************/
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  modulo: gt_reset_bruciatore.h                                             */
/*                                                                            */
/*      gestione RESET BRUCIATORE GAS                                         */
/*                                                                            */
/*  Autore: Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA          */
/*                                                                            */
/*  Data  : 19/07/2021      REV  : 00.0                                       */
/*                                                                            */
/*  U.mod.: 03/01/2023      REV  : 02.4                                       */
/*                                                                            */
/******************************************************************************/

#ifndef GT_RESET_BRUCIATORE_H_INCLUDED
#define	GT_RESET_BRUCIATORE_H_INCLUDED

#include "model/model.h"

void gt_reset_bruciatore (model_t *p, uint32_t timestamp);

void gt_reset_bruciatore_extended (model_t *p, uint32_t timestamp);

#endif  /* GT_RESET_BRUCIATORE_H_INCLUDED */
