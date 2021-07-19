#include <stdio.h>
#include "gel/parameter/parameter.h"
#include "model.h"
#include "parmac.h"
#include "descriptions/AUTOGEN_FILE_parmac.h"

#define NUM_PARAMETERS 56
#define AL_USER 0x01
#define AL_TECH 0x02


static void formatta(char *string, const void *arg);
static uint8_t get_livello_accesso(uint8_t parametri_ridotti);

static parameter_handle_t parameters[NUM_PARAMETERS];

void parmac_init(model_t *p, int reset) {
#define FINT(i) ((parameter_user_data_t){parmac_descriptions[i], formatta, NULL, NULL})

    size_t i = 0;
    // clang-format off
    /*                              Tipo                  Puntatore                                 PMIN    PMAX    MIN  MAX   DEF   STEP  ACCESS       STRINGHE                                        RUNTIME     ARG */
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_azzeramento_ciclo_stop,    NULL,   NULL,   0,   60,    5,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TEMPO_AZZERAMENTO_CICLO_STOP),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_visualizzazione_temperatura,NULL,   NULL,   0,   1,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_ABILITA_VISUALIZZAZIONE_TEMPERATURA),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tipo_pausa_asciugatura,          NULL,   NULL,   0,   1,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TIPO_PAUSA),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_gettone_1,                 NULL,   NULL,   1,   250,    1,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TEMPO_GETTONE_1),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_gettoniera,              NULL,   NULL,   0,   2,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_ABILITA_GETTONIERA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_stop_tempo_ciclo,        NULL,   NULL,   0,   1,    1,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_ABILITA_STOP_TEMPO_CICLO),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_uscita_pagine,             NULL,   NULL,   1,   60,    5,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_USCITA_PAGINE),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tipo_visualizzazione_gettone_moneta_cassa, NULL,   NULL,   0,   2,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TIPO_VISUALIZZAZIONE_GETTONE_MONETA_CASSA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.temperatura_max_1_in,            NULL,   NULL,   1,   125,    115,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPERATURA_MAX_1_IN),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.temperatura_sicurezza_1,         NULL,   NULL,   1,   145,    135,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPERATURA_SICUREZZA_1),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_allarme_temperatura_1,     NULL,   NULL,   0,   99,    60,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_ALLARME_TEMPERATURA_1),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.lingua,                      NULL,   NULL,   0,   6,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_LINGUA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.stringa_ditta_visualizzata,  NULL,   NULL,   0,   5,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_STRINGA_DITTA_VISUALIZZATA),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_tasto_menu,          NULL,   NULL,   0,   1,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_LINGUA_MAX),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.lingua_max,                  NULL,   NULL,   0,   7,    7,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_LINGUA_MAX),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_gas,                 NULL,   NULL,   0,   250,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ABILITA_GAS),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.numero_gettoni_consenso,     NULL,   NULL,   1,   40,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_NUMERO_GETTONI_CONSENSO),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.allarme_inverter_off_on,     NULL,   NULL,   0,   1,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ALLARME_INVERTER_OFF_ON),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.allarme_filtro_off_on,       NULL,   NULL,   0,   1,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ALLARME_FILTRO_OFF_ON),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.velocita_min_lavoro,         NULL,   NULL,   10,   25,    15,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_VELOCITA_MIN_LAVORO),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.velocita_max_lavoro,         NULL,   NULL,   25,   70,    60,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_VELOCITA_MAX_LAVORO),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_visualizzazione_cicli_totali, NULL,   NULL,   0,   3,    3,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ABILITA_VISUALIZZAZIONE_CICLI_TOTALI),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.numero_cicli_manutenzione,   NULL,   NULL,   0,   250,    90,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_NUMERO_CICLI_MANUTENZIONE),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_cadenza_avviso_manutenzione,  NULL,   NULL,   0,   250,    15,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_CADENZA_AVVISO_MANUTENZIONE),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_durata_avviso_manutenzione,  NULL,   NULL,   0,   250,    5,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_DURATA_AVVISO_MANUTENZIONE),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.numero_tentativi_reset_gas,  NULL,   NULL,   0,   9,    3,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_NUMERO_TENTATIVI_RESET_GAS),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_attesa_azzeramento_ciclo,NULL,   NULL,   0,   250,  1  ,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_ATTESA_AZZERAMENTO_CICLO),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_reset_lingua,            NULL,   NULL,   1,   250,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_RESET_LINGUA),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.percentuale_velocita_min_ventola, NULL,   NULL,   1,   99,    5,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_PERCENTUALE_VELOCITA_MIN_VENTOLA),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.percentuale_anticipo_temperatura_ventola, NULL,   NULL,   1,   99,    10,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_PERCENTUALE_ANTICIPO_TEMPERATURA_VENTOLA),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_parametri_ridotti,   NULL,   NULL,   0,   1,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ABILITA_PARAMETRI_RIDOTTI),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_autoavvio,           NULL,   NULL,   0,   1,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ABILITA_AUTOAVVIO),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_attesa_partenza_ciclo, NULL,   NULL,   0,   250,  60,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_ATTESA_PARTENZA_CICLO),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_antipiega,           NULL,   NULL,   0,   2,    1,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_ABILITA_ANTIPIEGA),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_ritardo_antipiega,     NULL,   NULL,   0,   250,    5,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_RITARDO_ANTIPIEGA),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_max_antipiega,         NULL,   NULL,   0,   250,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_MAX_ANTIPIEGA),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_cadenza_antipiega,     NULL,   NULL,   1,   99,    2,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_CADENZA_ANTIPIEGA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.numero_cicli_max_antipiega,  NULL,   NULL,   0,   20,    2,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_NUMERO_CICLI_MAX_ANTIPIEGA),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_giro_antipiega,        NULL,   NULL,   1,   99,    4,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_GIRO_ANTIPIEGA),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_pausa_antipiega,       NULL,   NULL,   0,   99,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_PAUSA_ANTIPIEGA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.velocita_antipiega,          &p->pmac.velocita_min_lavoro,   &p->pmac.velocita_max_lavoro,  0,   0,    15,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_VELOCITA_ANTIPIEGA),              NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_gettone_min_sec,       NULL,   NULL,   0,   1,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TEMPO_GETTONE_MIN_SEC),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_allarme_flusso_aria,   NULL,   NULL,   1,   250,    10,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_ALLARME_FLUSSO_ARIA),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.modello_macchina,            NULL,   NULL,   1,   19,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_MODELLO_MACCHINA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.sonda_temperatura_in_out,    NULL,   NULL,   0,   1,    1,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_SONDA_TEMPERATURA1_IN_OUT),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_azzeramento_ciclo_pausa,NULL,   NULL,   1,   60,  0  ,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TEMPO_AZZERAMENTO_CICLO_PAUSA),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.temperatura_max_1_out,       NULL,   NULL,   0,   90,    80,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPERATURA_MAX_1_OUT),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.temperatura_sicurezza_1_out, NULL,   NULL,   0,   105,    90,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPERATURA_SICUREZZA_1_OUT),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tempo_antigelo,              NULL,   NULL,   5,   250,    5,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPO_ANTIGELO),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_blocco_no_aria,      NULL,   NULL,   0,   9,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_ABILITA_BLOCCO_NO_ARIA),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.tipo_out_macchina_occupata,  NULL,   NULL,   0,   2,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TIPO_OUT_MACCHINA_OCCUPATA),               NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.abilita_reset_gas_esteso,    NULL,   NULL,   0,   1,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_ABILITA_RESET_GAS_ESTESO),                 NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.temperatura_raffreddo_allarme,NULL,   NULL,   0,   240,    60,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_TEMPERATURA_RAFFREDDO_ALLARME),      NULL,       NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.macchina_libera_off_on,      NULL,   NULL,   0,   1,    0,    1,    AL_TECH,     FINT(PARMAC_DESCRIPTIONS_MACCHINA_LIBERA_OFF_ON),              NULL,       NULL);
    // parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.temperatura_stop_tempo_ciclo,NULL,   NULL,   0,   5,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_MODELLO),              NULL,       NULL);

    // clang-format on

    parameter_check_ranges(parameters, NUM_PARAMETERS);
    if (reset) {
        parameter_reset_to_defaults(parameters, NUM_PARAMETERS);
    }
}

void parmac_operation(size_t parameter, int op,model_t *pmodel) {
    parameter_operator(parameter_get_handle(parameters, NUM_PARAMETERS, parameter, get_livello_accesso(pmodel->pmac.abilita_parametri_ridotti) ), op);
}

const char *parmac_get_description(const model_t *pmodel, size_t parameter) {
    (void)pmodel;
    parameter_user_data_t data =
        parameter_get_user_data(parameter_get_handle(parameters, NUM_PARAMETERS, parameter, get_livello_accesso(pmodel->pmac.abilita_parametri_ridotti) ));

    return data.descrizione[pmodel->pmac.lingua];
}

void parmac_format_value(char *string, size_t parameter, model_t *pmodel) {
    parameter_handle_t *  par  = parameter_get_handle(parameters, NUM_PARAMETERS, parameter, get_livello_accesso(pmodel->pmac.abilita_parametri_ridotti) );
    parameter_user_data_t data = parameter_get_user_data(par);

    data.format(string, par);
}

size_t parmac_get_tot_parameters(model_t *pmodel) {
    return parameter_get_count(parameters, NUM_PARAMETERS, get_livello_accesso(pmodel->pmac.abilita_parametri_ridotti) );
}

static void formatta(char *string, const void *arg) {
    const parameter_handle_t *par = arg;

    switch (par->type) {
        case PARAMETER_TYPE_UINT8:
            sprintf(string, "%i", *(uint8_t *)par->pointer);
            break;
        default:
            sprintf(string, "Errore!");
            break;
    }
}


static uint8_t get_livello_accesso(uint8_t parametri_ridotti) {
    if (parametri_ridotti == 1)
        return 0b01;
    else
        return 0b11;
}