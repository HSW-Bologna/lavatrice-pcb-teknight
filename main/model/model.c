#include <assert.h>
#include "gel/timer/stopwatch.h"
#include "model.h"
#include "parmac.h"
#include "gel/crc/crc16-ccitt.h"
#include "gel/serializer/serializer.h"
#include "lv_conf.h"
#include "peripherals/timer.h"
#include "gel/parameter/parameter.h"


parameter_handle_t parameters[MAX_PARAMETER_CHUNK];


void model_init(model_t *pmodel) {
    pmodel->inputs            = 0;
    pmodel->pwoff.credito     = 0;
    pmodel->ptc_temperature   = 0;
    pmodel->sht_temperature   = 0;
    pmodel->pwm1              = 0;
    pmodel->pwm2              = 0;
    pmodel->ptc_adc           = 0;
    pmodel->outputs           = 0;
    pmodel->lingua_temporanea = 0;

    pmodel->status.stato = 0;
   

    pmodel->lvgl_mem.frag_percentage = 0;
    pmodel->lvgl_mem.used_percentage = 0;
    pmodel->lvgl_mem.low_watermark   = LV_MEM_SIZE;
}

// int model_get_input(model_t *pmodel, int input) {
//    return ((pmodel->inputs >> input - 1) & 1);
//}
//
// int model_get_output(model_t *pmodel, int output) {
//    return ((pmodel->outputs >> output) & 1);
//}

char *model_get_output_status(model_t *pmodel, int output) {
    if ((pmodel->outputs >> output) & 1)
        return "on";
    else
        return "off";
}

size_t model_pars_serialize(model_t *pmodel, uint8_t buff[static PARS_SERIALIZED_SIZE])
{
    size_t i = 2, j = 0;

    for (j = 0; j < NUM_CICLI; j++) {
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tipo_asciugatura_m_a);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tempo_durata_asciugatura);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].abilita_attesa_temperatura);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].abilita_inversione_asciugatura);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tempo_giro_asciugatura);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tempo_pausa_asciugatura);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].velocita_asciugatura);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].temperatura_aria_1);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].abilita_raffreddamento);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tipo_raffreddamento_m_a);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tempo_durata_raffreddamento);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].abilita_inversione_raffreddamento);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tempo_giro_raffreddamento);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].tempo_pausa_raffreddamento);
        i += serialize_uint8(&buff[i], pmodel->pciclo[j].abilita_antipiega);
    }

    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_azzeramento_ciclo_stop);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_visualizzazione_temperatura);
    i += serialize_uint8(&buff[i], pmodel->pmac.tipo_pausa_asciugatura);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_gettone_1);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_gettoniera);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_stop_tempo_ciclo);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_uscita_pagine);
    i += serialize_uint8(&buff[i], pmodel->pmac.tipo_visualizzazione_get_mon_cas);
    i += serialize_uint8(&buff[i], pmodel->pmac.temperatura_max_1_in);
    i += serialize_uint8(&buff[i], pmodel->pmac.temperatura_sicurezza_1);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_allarme_temperatura_1);
    i += serialize_uint8(&buff[i], pmodel->pmac.lingua);
    i += serialize_uint8(&buff[i], pmodel->pmac.stringa_ditta_visualizzata);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_tasto_menu);
    i += serialize_uint8(&buff[i], pmodel->pmac.lingua_max);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_gas);
    i += serialize_uint8(&buff[i], pmodel->pmac.numero_gettoni_consenso);
    i += serialize_uint8(&buff[i], pmodel->pmac.allarme_inverter_off_on);
    i += serialize_uint8(&buff[i], pmodel->pmac.allarme_filtro_off_on);
    i += serialize_uint8(&buff[i], pmodel->pmac.velocita_min_lavoro);
    i += serialize_uint8(&buff[i], pmodel->pmac.velocita_max_lavoro);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_visualizzazione_cicli_totali);
    i += serialize_uint8(&buff[i], pmodel->pmac.numero_cicli_manutenzione);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_cadenza_avviso_manutenzione);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_durata_avviso_manutenzione);
    i += serialize_uint8(&buff[i], pmodel->pmac.numero_tentativi_reset_gas);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_attesa_azzeramento_ciclo);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_reset_lingua);
    i += serialize_uint8(&buff[i], pmodel->pmac.percentuale_velocita_min_ventola);
    i += serialize_uint8(&buff[i], pmodel->pmac.percentuale_anticipo_temperatura_ventola);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_parametri_ridotti);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_autoavvio);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_attesa_partenza_ciclo);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_ritardo_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_max_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_cadenza_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.numero_cicli_max_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_giro_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_pausa_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.velocita_antipiega);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_gettone_min_sec);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_allarme_flusso_aria);
    i += serialize_uint8(&buff[i], pmodel->pmac.modello_macchina);
    i += serialize_uint8(&buff[i], pmodel->pmac.sonda_temperatura_in_out);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_azzeramento_ciclo_pausa);
    i += serialize_uint8(&buff[i], pmodel->pmac.temperatura_max_1_out);
    i += serialize_uint8(&buff[i], pmodel->pmac.temperatura_sicurezza_1_out);
    i += serialize_uint8(&buff[i], pmodel->pmac.tempo_antigelo);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_blocco_no_aria);
    i += serialize_uint8(&buff[i], pmodel->pmac.tipo_out_macchina_occupata);
    i += serialize_uint8(&buff[i], pmodel->pmac.abilita_reset_gas_esteso);
    i += serialize_uint8(&buff[i], pmodel->pmac.temperatura_raffreddo_allarme);
    i += serialize_uint8(&buff[i], pmodel->pmac.macchina_libera_off_on);
    // i += serialize_uint8(&buff[i], pmodel->pmac.temperatura_stop_tempo_ciclo);
    unsigned short crc = crc16_ccitt(&buff[2], i - 2, 0);
    serialize_uint16_be(&buff[0], crc);
    assert(i == PARS_SERIALIZED_SIZE);
    return i;
}

size_t model_pars_deserialize(model_t *pmodel, uint8_t *buff) {
    size_t   i = 0, j = 0;
    uint16_t crc;
    i += deserialize_uint16_be(&crc, &buff[i]);
    if (crc != crc16_ccitt(&buff[2], PARS_SERIALIZED_SIZE - 2, 0)) {
        return -1;
    } else {
        for (j = 0; j < NUM_CICLI; j++) {
            i += deserialize_uint8(&pmodel->pciclo[j].tipo_asciugatura_m_a, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tempo_durata_asciugatura, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].abilita_attesa_temperatura, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].abilita_inversione_asciugatura, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tempo_giro_asciugatura, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tempo_pausa_asciugatura, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].velocita_asciugatura, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].temperatura_aria_1, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].abilita_raffreddamento, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tipo_raffreddamento_m_a, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tempo_durata_raffreddamento, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].abilita_inversione_raffreddamento, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tempo_giro_raffreddamento, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].tempo_pausa_raffreddamento, &buff[i]);
            i += deserialize_uint8(&pmodel->pciclo[j].abilita_antipiega, &buff[i]);
        }

        i += deserialize_uint8(&pmodel->pmac.tempo_azzeramento_ciclo_stop, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_visualizzazione_temperatura, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tipo_pausa_asciugatura, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_gettone_1, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_gettoniera, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_stop_tempo_ciclo, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_uscita_pagine, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tipo_visualizzazione_get_mon_cas, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.temperatura_max_1_in, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.temperatura_sicurezza_1, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_allarme_temperatura_1, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.lingua, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.stringa_ditta_visualizzata, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_tasto_menu, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.lingua_max, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_gas, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.numero_gettoni_consenso, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.allarme_inverter_off_on, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.allarme_filtro_off_on, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.velocita_min_lavoro, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.velocita_max_lavoro, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_visualizzazione_cicli_totali, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.numero_cicli_manutenzione, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_cadenza_avviso_manutenzione, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_durata_avviso_manutenzione, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.numero_tentativi_reset_gas, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_attesa_azzeramento_ciclo, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_reset_lingua, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.percentuale_velocita_min_ventola, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.percentuale_anticipo_temperatura_ventola, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_parametri_ridotti, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_autoavvio, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_attesa_partenza_ciclo, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_ritardo_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_max_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_cadenza_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.numero_cicli_max_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_giro_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_pausa_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.velocita_antipiega, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_gettone_min_sec, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_allarme_flusso_aria, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.modello_macchina, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.sonda_temperatura_in_out, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_azzeramento_ciclo_pausa, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.temperatura_max_1_out, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.temperatura_sicurezza_1_out, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tempo_antigelo, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_blocco_no_aria, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.tipo_out_macchina_occupata, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.abilita_reset_gas_esteso, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.temperatura_raffreddo_allarme, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.macchina_libera_off_on, &buff[i]);
        // i += deserialize_uint8(&pmodel->pmac.temperatura_stop_tempo_ciclo, &buff[i]);

        pmodel->lingua_temporanea = pmodel->pmac.lingua;
    }

    assert(i == PARS_SERIALIZED_SIZE);
    return i;
}


size_t model_pwoff_serialize(model_t *pmodel, uint8_t buff[static PWOFF_SERIALIZED_SIZE]) {
    size_t i = 2;
    i += serialize_uint16_be(&buff[i], pmodel->pwoff.credito);
    unsigned short crc = crc16_ccitt(&buff[2], i - 2, 0);
    serialize_uint16_be(&buff[0], crc);
    assert(i == PWOFF_SERIALIZED_SIZE);
    return i;
}


size_t model_pwoff_deserialize(model_t *pmodel, uint8_t *buff) {
    size_t   i = 0;
    uint16_t crc;
    i += deserialize_uint16_be(&crc, &buff[i]);
    if (crc != crc16_ccitt(&buff[2], PWOFF_SERIALIZED_SIZE - 2, 0)) {
        return -1;
    } else {
        i += deserialize_uint16_be(&pmodel->pwoff.credito, &buff[i]);
    }

    assert(i == PWOFF_SERIALIZED_SIZE);
    return i;
}


void model_mem_data(model_t *pmodel, lv_mem_monitor_t *mem) {
    pmodel->lvgl_mem.frag_percentage = mem->frag_pct;
    pmodel->lvgl_mem.used_percentage = mem->used_pct;
    if (pmodel->lvgl_mem.low_watermark > mem->free_size) {
        pmodel->lvgl_mem.low_watermark = mem->free_size;
    }
}


size_t model_get_lingua(model_t *pmodel) {
    return (size_t)pmodel->lingua_temporanea;
}


void model_cambia_lingua(model_t *pmodel) {
    pmodel->lingua_temporanea = (pmodel->lingua_temporanea + 1) % 2;
}

stato_t model_get_stato(model_t *pmodel) {
    return pmodel->status.stato;
}

void model_cambia_stato(model_t *pmodel, int res) {
    pmodel->status.stato = res;
}

unsigned long model_get_stato_timer(model_t *pmodel) {
   return stopwatch_get_remaining(&pmodel->status.stopwatch, get_millis()) / 1000UL;
}


parciclo_t *model_ciclo_corrente(model_t *pmodel) {
    return &pmodel->pciclo[pmodel->status.ciclo];
}

/* -------------------------------------------------------------------------- */
/*                                                                            */
/*  Set / Get STATO MACCHINA                                                  */
/*                                                                            */
/* ------------------------------------------------------------------------- */

void model_set_status_stopped(model_t *p)
{
    p->status.stato = STATO_STOPPED;
}
int model_get_status_stopped(model_t *p)
{
    return p->status.stato==STATO_STOPPED;
}
int model_get_status_not_stopped(model_t *p)
{
    return p->status.stato!=STATO_STOPPED;
}



void model_set_status_work(model_t *p)
{
    if (model_get_status_pause(p)) {
        stopwatch_start(&p->status.stopwatch, get_millis());
    }
    else {
         stopwatch_init(&p->status.stopwatch);
        stopwatch_setngo(&p->status.stopwatch,p->pciclo[p->status.ciclo].tempo_durata_asciugatura*1000UL,get_millis());

    }
    p->status.stato = STATO_WORK;

}
int model_get_status_work(model_t *p)
{
    return p->status.stato==STATO_WORK;
}
int model_get_status_not_work(model_t *p)
{
    return p->status.stato!=STATO_WORK;
}

void model_set_status_pause(model_t *p)
{
    p->status.stato = STATO_PAUSE;
    
    stopwatch_pause(&p->status.stopwatch, get_millis());
}
int model_get_status_pause(model_t *p)
{
    return p->status.stato==STATO_PAUSE;
}
int model_get_status_not_pause(model_t *p)
{
    return p->status.stato!=STATO_PAUSE;
}



void model_set_status_step_nul(model_t *p)
{
    p->status.stato_step = STATO_STEP_NUL;
}
void model_set_status_step_asc(model_t *p)
{
    p->status.stato_step = STATO_STEP_ASC;
}
void model_set_status_step_raf(model_t *p)
{
    p->status.stato_step = STATO_STEP_RAF;
}
void model_set_status_step_anr(model_t *p)
{
    p->status.stato_step = STATO_STEP_ANT;
}
int model_get_status_step(model_t *p)
{
    return p->status.stato_step;
}
