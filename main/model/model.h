#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>
#include "lvgl/lvgl.h"
#include "gel/timer/stopwatch.h"

#define PARS_SERIALIZED_SIZE  (6 + 2*NUM_CICLI)
#define PWOFF_SERIALIZED_SIZE 4

typedef enum {
    CICLO_CALDO = 0,
    CICLO_MEDIO,
    CICLO_TIEPIDO,
    CICLO_FREDDO,
    CICLO_LANA,
    NUM_CICLI,
} tipo_ciclo_t;


typedef struct {
    uint8_t tempo_azzeramento_ciclo;
    uint8_t tipo_macchina;
    uint8_t tipo_pausa_asciugatura;
    uint8_t tempo_gettone_1;
    uint8_t abilitazione_gettoniera;
    uint8_t abilitazione_tempo_asciutatura;
    uint8_t abilitazione_tempo_raffreddamento;
    uint8_t tempo_off_programma;
    uint8_t abilitazione_visualizzazione_gettoniera_moneta;
    uint8_t temp_max_1;
    uint8_t temperatura_sicurezza_1;
    uint8_t tempo_all_temperatura_1;
    uint8_t abilitazione_temperatura_2;
    uint8_t tempo_all_temperatura_2;
    uint8_t abilitazione_stringa_ditta;
    uint8_t abilitazione_tasto_menu;
    uint8_t lingua_max;
    uint8_t abilitazione_gas;
    uint8_t nro_gettoni_consenso;
    uint8_t abilitazione_allarme_inverter;
    uint8_t abilitazione_allarme_filtro;
    uint8_t abilitazione_allarme_h2o;
    uint8_t vel_min_lavoro;
    uint8_t vel_max_lavoro;
    uint8_t abilitazione_visualizzazione_cicli_totali;
    uint8_t nro_cicli_manutenzione;
    uint8_t tempo_cadenza_avviso_manutenzione;
    uint8_t durata_avviso_manutenzione;
    uint8_t tentativi_reset_gas;
    uint8_t tempo_sblocco_tempo;
    uint8_t tempo_reset_lingua;
    uint8_t percentuale_velocita_min_ventola;
    uint8_t percentuale_anticipo_temperatura_ventola;
    uint8_t abilitazione_parametri_ridotti;
    uint8_t abilitazione_autoavvio;
    uint8_t tempo_inibizione_secco;
    uint8_t tempo_gettone_2;
    int8_t  offset_temperatura;
    uint8_t abilitazione_antipiega;
    uint8_t tempo_ritardo_antipiega;
    uint8_t tempo_max_antipiega;
    uint8_t tempo_cad_antipiega;
    uint8_t cicli_max_antipiega;
    uint8_t tempo_giro_antipiega;
    uint8_t tempo_pausa_antipiega;
    uint8_t velocita_antipiega;
    uint8_t tempi_gettoni;
    uint8_t abilitazione_filtro_aria;
    uint8_t tempo_allarme_flusso_aria;
    uint8_t modello_macchina;
    uint8_t sonda_temperatura_in_out;
    uint8_t tipo_out_riscaldamento;
    uint8_t tempo_azzeramento_ciclo_pausa;
    uint8_t temperatura_sicurezza;
    uint8_t temperatura_stop_tempo_ciclo;
    uint8_t tempo_antigelo;
    uint8_t abilitazione_blocco_no_aria;
    uint8_t tipo_out_macc_occupata;
    uint8_t tempo_allarme_h2o;
    uint8_t abilitazione_reset_gas_estesa;
    uint8_t temperatura_raffreddo_allarme;
    uint8_t macchina_libera_off_on;
    uint8_t lingua;
    uint8_t modello;
    uint8_t livello_accesso;
    uint8_t tempo_tasto_stop;
    uint8_t tempo_uscita_pagine;
    uint8_t logo;
    uint8_t ritorno_lingua;
    uint8_t tempo_max_durata_antipiega;
    uint8_t numero_max_giri_antipiega;
    uint8_t temperatura_massima;
} parmac_t;


typedef struct {
    uint8_t tipo_asciugatura;
    uint8_t tempo_durata_asciugatura;
    uint8_t abilitazione_attesa_temp;
    uint8_t abilitazione_inversione_asciugatura;
    uint8_t tempo_giro_asciugatura;
    uint8_t tempo_pausa_asciugatura;
    uint8_t velocita_asciugatura;
    uint8_t temperatura_aria_in_1;
    uint8_t temperatura_aria_out_2;
    uint8_t abilita_raffreddamento;
    uint8_t tipo_raffreddamento;
    uint8_t tempo_durata_raffreddamento;
    uint8_t ab_inversione_raffreddamento;
    uint8_t tempo_giro_raffreddamento;
    uint8_t tempo_pausa_raffreddamento;
} parciclo_t;


typedef enum {
    STATO_OFF = 0,
    STATO_ON,
} stato_t;


typedef struct {
    uint16_t credito;
} pwoff_data_t;

typedef struct {
    uint8_t  inputs;
    uint8_t  outputs;
    uint16_t ptc_adc;
    int      ptc_temperature;
    int      sht_temperature;

    int     pwm1;
    int     pwm2;
    uint8_t lingua_temporanea;

    parmac_t pmac;
    parciclo_t pciclo[NUM_CICLI];

    struct {
        stato_t     stato;
        stopwatch_t stopwatch;
    } status;

    struct {
        uint8_t  used_percentage;
        uint8_t  frag_percentage;
        uint32_t low_watermark;
    } lvgl_mem;

    pwoff_data_t pwoff;

} model_t;

void          model_init(model_t *pmodel);
char *        model_get_output_status(model_t *pmodel, int output);
size_t        model_pars_serialize(model_t *pmodel, uint8_t buff[static PARS_SERIALIZED_SIZE]);
size_t        model_pars_deserialize(model_t *pmodel, uint8_t *buff);
size_t        model_pwoff_serialize(model_t *pmodel, uint8_t buff[static PWOFF_SERIALIZED_SIZE]);
size_t        model_pwoff_deserialize(model_t *pmodel, uint8_t *buff);
void          model_mem_data(model_t *pmodel, lv_mem_monitor_t *mem);
size_t        model_get_lingua(model_t *pmodel);
void          model_cambia_lingua(model_t *pmodel);
stato_t       model_get_stato(model_t *pmodel);
void          model_cambia_stato(model_t *pmodel, int res);
unsigned long model_get_stato_timer(model_t *pmodel);

#endif