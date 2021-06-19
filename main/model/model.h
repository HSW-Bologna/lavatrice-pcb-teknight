#ifndef MODEL_H_INCLUDED
#define MODEL_H_INCLUDED

#include <stdint.h>
#include <stdlib.h>
#include "lvgl/lvgl.h"
#include "gel/timer/stopwatch.h"

#define PARS_SERIALIZED_SIZE  6
#define PWOFF_SERIALIZED_SIZE 4


typedef enum {
    PROGRAM_CALDO = 0,
    PROGRAM_MEDIO,
    PROGRAM_TIEPIDO,
    PROGRAM_FREDDO,
    PROGRAM_LANA,
    NUM_PROGRAMS,
} program_t;

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

    struct {
        uint8_t lingua;
        uint8_t modello;
        uint8_t livello_accesso;
        uint8_t tempo_tasto_stop;
        uint8_t tempo_uscita_pagine;
        uint8_t logo;
        uint8_t ritorno_lingua;
        uint8_t tempo_ritardo_antipiega;
        uint8_t tempo_max_durata_antipiega;
        uint8_t numero_max_giri_antipiega;
        uint8_t tempo_giro_antipiega;
        uint8_t tempo_pausa_antipiega;
        uint8_t velocita_antipiega;
        uint8_t temperatura_massima;
    } pmac;

    struct {
        stato_t stato;
        stopwatch_t stopwatch;
    } status;

    struct {
        uint8_t tipo_asciugatura;
    } pciclo;

    struct {
        uint8_t  used_percentage;
        uint8_t  frag_percentage;
        uint32_t low_watermark;
    } lvgl_mem;

    pwoff_data_t pwoff;

} model_t;

void   model_init(model_t *pmodel);
char * model_get_output_status(model_t *pmodel, int output);
size_t model_pars_serialize(model_t *pmodel, uint8_t buff[static PARS_SERIALIZED_SIZE]);
size_t model_pars_deserialize(model_t *pmodel, uint8_t *buff);
size_t model_pwoff_serialize(model_t *pmodel, uint8_t buff[static PWOFF_SERIALIZED_SIZE]);
size_t model_pwoff_deserialize(model_t *pmodel, uint8_t *buff);
void   model_mem_data(model_t *pmodel, lv_mem_monitor_t *mem);
size_t model_get_lingua(model_t *pmodel);
void model_cambia_lingua(model_t *pmodel);
stato_t model_get_stato(model_t *pmodel);
void model_cambia_stato(model_t *pmodel, int res);
unsigned long model_get_stato_timer(model_t *pmodel);

#endif