#include "utils/assert.h"
#include "gel/timer/stopwatch.h"
#include "model.h"
#include "parmac.h"
#include "gel/crc/crc16-ccitt.h"
#include "gel/serializer/serializer.h"
#include "lv_conf.h"
#include "peripherals/timer.h"
#include "gel/parameter/parameter.h"
#include "peripherals/NT7534.h"



parameter_handle_t parameters[MAX_PARAMETER_CHUNK];
static void        init_comune_parametri_1(model_t *pmodel);
static void        init_comune_parametri_2(model_t *pmodel);


void model_init(model_t *pmodel) {
    assert(pmodel != NULL);

    pmodel->inputs            = 0;
    pmodel->ptc_temperature   = 0;
    pmodel->sht_temperature   = 0;
    pmodel->pwm1              = 0;
    pmodel->pwm2              = 0;
    pmodel->ptc_adc           = 0;
    pmodel->outputs           = 0;
    pmodel->lingua_temporanea = 0;
    pmodel->delta_temperatura = 0;
    pmodel->delta_velocita    = 0;

    pmodel->status.ciclo                = CICLO_NESSUNO;
    pmodel->status.stato                = 0;
    pmodel->status.n_allarme            = 0;
    pmodel->status.temperatura_rilevata = 0;

    pmodel->hsw.contrasto = NT7534_DEFAULT_CONTRAST;

    pmodel->pwoff.credito             = 0;
    pmodel->pwoff.tempo_attivita      = 0;
    pmodel->pwoff.tempo_lavoro        = 0;
    pmodel->pwoff.tempo_moto          = 0;
    pmodel->pwoff.tempo_riscaldamento = 0;
    pmodel->pwoff.tempo_ventilazione  = 0;
    pmodel->pwoff.cicli_parziali      = 0;
    pmodel->pwoff.cicli_totali        = 0;
    pmodel->pwoff.gettoni             = 0;

    pmodel->lvgl_mem.frag_percentage = 0;
    pmodel->lvgl_mem.used_percentage = 0;
    pmodel->lvgl_mem.low_watermark   = LV_MEM_SIZE;
}


void model_reset_parameters(model_t *pmodel) {
    assert(pmodel != NULL);
    memset(&pmodel->pmac, 0, sizeof(pmodel->pmac));
}



char *model_get_output_status(model_t *pmodel, int output) {
    if ((pmodel->outputs >> output) & 1)
        return "on";
    else
        return "off";
}


int model_get_riscaldamento_attivo(model_t *pmodel) {
    return (pmodel->outputs & 0x04) > 0;
}


size_t model_pars_serialize(model_t *pmodel, uint8_t buff[static PARS_SERIALIZED_SIZE]) {
    assert(pmodel != NULL);

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
    i += serialize_uint8(&buff[i], pmodel->pmac.logo_ditta);
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
        i += deserialize_uint8(&pmodel->pmac.logo_ditta, &buff[i]);
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
    assert(pmodel != NULL);

    size_t i = 2;
    i += serialize_uint16_be(&buff[i], pmodel->pwoff.credito);
    i += serialize_uint32_be(&buff[i], pmodel->pwoff.tempo_attivita);
    unsigned short crc = crc16_ccitt(&buff[2], i - 2, 0);
    serialize_uint16_be(&buff[0], crc);
    assert(i == PWOFF_SERIALIZED_SIZE);
    return i;
}


size_t model_pwoff_deserialize(model_t *pmodel, uint8_t *buff) {
    assert(pmodel != NULL);

    size_t   i = 0;
    uint16_t crc;
    i += deserialize_uint16_be(&crc, &buff[i]);
    if (crc != crc16_ccitt(&buff[2], PWOFF_SERIALIZED_SIZE - 2, 0)) {
        return -1;
    } else {
        i += deserialize_uint16_be(&pmodel->pwoff.credito, &buff[i]);
        i += deserialize_uint32_be(&pmodel->pwoff.tempo_attivita, &buff[i]);
    }

    assert(i == PWOFF_SERIALIZED_SIZE);
    return i;
}


void model_mem_data(model_t *pmodel, lv_mem_monitor_t *mem) {
    assert(pmodel != NULL);

    pmodel->lvgl_mem.frag_percentage = mem->frag_pct;
    pmodel->lvgl_mem.used_percentage = mem->used_pct;
    if (pmodel->lvgl_mem.low_watermark > mem->free_size) {
        pmodel->lvgl_mem.low_watermark = mem->free_size;
    }
}


size_t model_get_lingua(model_t *pmodel) {
    assert(pmodel != NULL);

    return (size_t)pmodel->lingua_temporanea;
}


void model_cambia_lingua(model_t *pmodel) {
    assert(pmodel != NULL);

    pmodel->lingua_temporanea = (pmodel->lingua_temporanea + 1) % 2;
}

stato_t model_get_stato(model_t *pmodel) {
    assert(pmodel != NULL);

    return pmodel->status.stato;
}

void model_cambia_stato(model_t *pmodel, int res) {
    assert(pmodel != NULL);

    pmodel->status.stato = res;
}

unsigned long model_get_stato_timer(model_t *pmodel) {
    assert(pmodel != NULL);

    return stopwatch_get_remaining(&pmodel->status.tempo_asciugatura, get_millis()) / 1000UL;
}


int model_ciclo_selezionato(model_t *pmodel) {
    return pmodel->status.ciclo < NUM_CICLI;
}


parciclo_t *model_ciclo_corrente(model_t *pmodel) {
    assert(pmodel != NULL);
    assert(pmodel->status.ciclo < NUM_CICLI);

    return &pmodel->pciclo[pmodel->status.ciclo];
}


void model_init_parametri_ciclo(model_t *pmodel) {
    assert(pmodel != NULL);

    size_t             tipo    = 0;
    modello_macchina_t modello = model_get_machine_model(pmodel);

    switch (modello) {
        case MODELLO_MACCHINA_TEST:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            break;

        case MODELLO_MACCHINA_EDS_RE_SELF_CA:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RE_LAB_CA:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RG_SELF_CA:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 1;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RG_LAB_CA:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 1;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RV_SELF_CA:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RV_LAB_CA:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RE_SELF_CC:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RV_SELF_CC:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RE_LAB_CC:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RV_LAB_CC:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RP_SELF_CA:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RP_LAB_CA:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RP_SELF_CC:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 0;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_1(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RP_LAB_CC:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RE_LAB_TH_CA:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RG_LAB_TH_CA:
            tipo                                  = 0;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 1;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RV_LAB_TH_CA:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RE_LAB_TH_CC:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        case MODELLO_MACCHINA_EDS_RV_LAB_TH_CC:
            tipo                                  = 1;
            pmodel->pmac.abilita_stop_tempo_ciclo = 1;
            pmodel->pmac.abilita_gas              = 0;
            init_comune_parametri_2(pmodel);
            break;

        default:
            assert(0);
            break;
    }

    if (model_get_machine_model(pmodel) != MODELLO_MACCHINA_TEST) {
        pmodel->pmac.tempo_attesa_azzeramento_ciclo = 10;
        pmodel->pmac.tempo_gettone_1                = 10;
        pmodel->pmac.tempo_reset_lingua             = 5;
        pmodel->pmac.abilita_parametri_ridotti      = 1;
        pmodel->pmac.tempo_ritardo_antipiega        = 10;
        pmodel->pmac.tempo_max_antipiega            = 0;
        pmodel->pmac.tempo_cadenza_antipiega        = 2;
        pmodel->pmac.numero_cicli_max_antipiega     = 0;
        pmodel->pmac.tempo_giro_antipiega           = 5;
        pmodel->pmac.tempo_pausa_antipiega          = 0;
        pmodel->pmac.velocita_antipiega             = 0;
        pmodel->pmac.sonda_temperatura_in_out       = 1;
        pmodel->pmac.tempo_allarme_temperatura_1    = 45;
    }

    uint8_t valori[NUM_CICLI][14] = {
        {0, 35, 0, 1, 95, 6, 55, 0, 1, 0, 2, 1, 35, 6}, {0, 40, 0, 1, 95, 6, 55, 0, 1, 0, 2, 1, 35, 6},
        {0, 40, 0, 1, 95, 6, 55, 0, 1, 0, 2, 1, 35, 6}, {0, 20, 0, 1, 60, 6, 55, 30, 0, 0, 2, 1, 35, 6},
        {0, 45, 0, 1, 95, 6, 55, 0, 0, 0, 2, 1, 35, 6},
    };

    if (pmodel->pmac.sonda_temperatura_in_out) {
        valori[CICLO_CALDO][7]   = 75;
        valori[CICLO_MEDIO][7]   = 65;
        valori[CICLO_TIEPIDO][7] = 55;
        if (tipo == 0) {
            valori[CICLO_LANA][7] = 35;
        } else {
            valori[CICLO_LANA][7] = 50;
        }
    } else {
        valori[CICLO_CALDO][7]   = 110;
        valori[CICLO_MEDIO][7]   = 95;
        valori[CICLO_TIEPIDO][7] = 85;
        valori[CICLO_LANA][7]    = 70;
    }

    if (modello >= MODELLO_MACCHINA_EDS_RE_LAB_TH_CA) {
        size_t i = 0;
        for (i = CICLO_CALDO; i < NUM_CICLI; i++) {
            valori[i][0] = 1;
            valori[i][1] = 3;
        }
    }

    size_t i = 0;
    for (i = CICLO_CALDO; i < NUM_CICLI; i++) {
        size_t j                                            = 0;
        pmodel->pciclo[i].tipo_asciugatura_m_a              = valori[i][j++];
        pmodel->pciclo[i].tempo_durata_asciugatura          = valori[i][j++];
        pmodel->pciclo[i].abilita_attesa_temperatura        = valori[i][j++];
        pmodel->pciclo[i].abilita_inversione_asciugatura    = valori[i][j++];
        pmodel->pciclo[i].tempo_giro_asciugatura            = valori[i][j++];
        pmodel->pciclo[i].tempo_pausa_asciugatura           = valori[i][j++];
        pmodel->pciclo[i].velocita_asciugatura              = valori[i][j++];
        pmodel->pciclo[i].temperatura_aria_1                = valori[i][j++];
        pmodel->pciclo[i].abilita_raffreddamento            = valori[i][j++];
        pmodel->pciclo[i].tipo_raffreddamento_m_a           = valori[i][j++];
        pmodel->pciclo[i].tempo_durata_raffreddamento       = valori[i][j++];
        pmodel->pciclo[i].abilita_inversione_raffreddamento = valori[i][j++];
        pmodel->pciclo[i].tempo_giro_raffreddamento         = valori[i][j++];
        pmodel->pciclo[i].tempo_pausa_raffreddamento        = valori[i][j++];
        pmodel->pciclo[i].abilita_antipiega                 = 0;
    }
}





/* -------------------------------------------------------------------------- */
/*                                                                            */
/*  Set / Get STATO MACCHINA                                                  */
/*                                                                            */
/* -------------------------------------------------------------------------- */
void model_set_status_stopped(model_t *p) {
    assert(p != NULL);
    model_azzera_credito(p);
    p->status.stato = STATO_STOPPED;
}

int model_get_status_stopped(model_t *p) {
    assert(p != NULL);
    return p->status.stato == STATO_STOPPED;
}

int model_get_status_not_stopped(model_t *p) {
    assert(p != NULL);
    return p->status.stato != STATO_STOPPED;
}


void model_comincia_raffreddamento(model_t *pmodel) {
    if (model_get_status_work(pmodel)) {
        pmodel->status.stato_step = STATO_STEP_RAF;
        stopwatch_init(&pmodel->status.tempo_asciugatura);
        stopwatch_setngo(&pmodel->status.tempo_asciugatura,
                         model_ciclo_corrente(pmodel)->tempo_durata_raffreddamento * 1000UL, get_millis());
    }
}


int model_in_antipiega(model_t *pmodel) {
    assert(pmodel != NULL);
    return pmodel->status.stato_step == STATO_STEP_ANT;
}


void model_comincia_antipiega(model_t *pmodel) {
    if (model_get_status_work(pmodel)) {
        pmodel->status.stato_step   = STATO_STEP_ANT;
        pmodel->status.f_anti_piega = 1;
        stopwatch_init(&pmodel->status.tempo_asciugatura);
        stopwatch_setngo(&pmodel->status.tempo_asciugatura, 10 * 1000UL, get_millis());
    }
}


void model_seleziona_ciclo(model_t *pmodel, tipo_ciclo_t ciclo) {
    assert(pmodel != NULL);
    pmodel->delta_temperatura = 0;
    pmodel->delta_velocita    = 0;
    model_set_status_work(pmodel);
    model_set_status_step_asc(pmodel);
    pmodel->status.ciclo = ciclo;
}


void model_set_status_work(model_t *p) {
    assert(p != NULL);
    if (model_get_status_pause(p)) {
        stopwatch_start(&p->status.tempo_asciugatura, get_millis());
        p->status.stato = STATO_WORK;
    } else if (model_get_status_stopped(p) && model_consenso_raggiunto(p)) {
        stopwatch_init(&p->status.tempo_asciugatura);
        stopwatch_setngo(&p->status.tempo_asciugatura, model_secondi_durata_asciugatura(p) * 1000UL, get_millis());
        p->status.stato = STATO_WORK;
    }
}


int model_tempo_lavoro_scaduto(model_t *pmodel, unsigned long ts) {
    return stopwatch_is_timer_reached(&pmodel->status.tempo_asciugatura, ts);
}


void model_metti_tempo_lavoro_in_pausa(model_t *pmodel, unsigned long ts) {
    stopwatch_pause(&pmodel->status.tempo_asciugatura, ts);
}


int model_get_status_work(model_t *p) {
    assert(p != NULL);
    return p->status.stato == STATO_WORK;
}

int model_get_status_not_work(model_t *p) {
    assert(p != NULL);
    return p->status.stato != STATO_WORK;
}

void model_set_status_pause(model_t *p) {
    assert(p != NULL);
    p->status.stato = STATO_PAUSE;

    stopwatch_pause(&p->status.tempo_asciugatura, get_millis());
}

int model_get_status_pause(model_t *p) {
    assert(p != NULL);
    return p->status.stato == STATO_PAUSE;
}

int model_get_status_not_pause(model_t *p) {
    assert(p != NULL);
    return p->status.stato != STATO_PAUSE;
}



void model_set_status_step_nul(model_t *p) {
    assert(p != NULL);
    p->status.stato_step = STATO_STEP_NUL;
}
void model_set_status_step_asc(model_t *p) {
    assert(p != NULL);
    p->status.stato_step = STATO_STEP_ASC;
}
void model_set_status_step_raf(model_t *p) {
    assert(p != NULL);
    p->status.stato_step = STATO_STEP_RAF;
}
void model_set_status_step_anr(model_t *p) {
    assert(p != NULL);
    p->status.stato_step = STATO_STEP_ANT;
}
int model_get_status_step(model_t *p) {
    assert(p != NULL);
    return p->status.stato_step;
}


void model_fine_ciclo(model_t *pmodel) {
    assert(pmodel != NULL);
    pmodel->status.stato = STATO_STOPPED;
    model_azzera_credito(pmodel);
}


int model_is_machine_selected(model_t *pmodel) {
    assert(pmodel != NULL);
    return pmodel->pmac.modello_macchina != MODELLO_MACCHINA_TEST;
}

uint8_t model_get_logo_ditta(model_t *pmodel) {
    assert(pmodel != NULL);
    return pmodel->pmac.logo_ditta;
}

modello_macchina_t model_get_machine_model(model_t *pmodel) {
    assert(pmodel != NULL);
    return pmodel->pmac.modello_macchina;
}



int model_is_in_test(model_t *pmodel) {
    assert(pmodel != NULL);
    return pmodel->status.f_in_test;
}

int model_not_in_test(model_t *pmodel) {
    assert(pmodel != NULL);
    return !pmodel->status.f_in_test;
}





size_t model_private_parameters_serialize(model_t *pmodel, uint8_t buff[static PRIVATE_PARS_SERIALIZED_SIZE]) {
    assert(pmodel != NULL);

    size_t i = 2;

    i += serialize_uint8(&buff[i], pmodel->hsw.contrasto);

    unsigned short crc = crc16_ccitt(&buff[2], i - 2, 0);
    serialize_uint16_be(&buff[0], crc);
    assert(i == PRIVATE_PARS_SERIALIZED_SIZE);
    return i;
}


size_t model_private_parameters_deserialize(model_t *pmodel, uint8_t *buff) {
    assert(pmodel != NULL);

    size_t   i = 0;
    uint16_t crc;
    i += deserialize_uint16_be(&crc, &buff[i]);
    if (crc != crc16_ccitt(&buff[2], PRIVATE_PARS_SERIALIZED_SIZE - 2, 0)) {
        return -1;
    } else {
        i += deserialize_uint8(&pmodel->hsw.contrasto, &buff[i]);
    }

    assert(i == PRIVATE_PARS_SERIALIZED_SIZE);
    return i;
}



void model_add_second(model_t *pmodel) {
    assert(pmodel != NULL);
    pmodel->pwoff.tempo_attivita++;
}


void model_modifica_temperatura_aria(model_t *pmodel, int gradi) {
    assert(pmodel != NULL);

    if (model_temperatura_aria_ciclo(pmodel) + gradi > TEMPERATURA_MASSIMA_ARIA) {
        pmodel->delta_temperatura = TEMPERATURA_MASSIMA_ARIA - model_ciclo_corrente(pmodel)->temperatura_aria_1;
    } else if (model_temperatura_aria_ciclo(pmodel) + gradi < 0) {
        pmodel->delta_temperatura = -model_ciclo_corrente(pmodel)->temperatura_aria_1;
    } else {
        pmodel->delta_temperatura += gradi;
    }
}


void model_modifica_velocita(model_t *pmodel, int giri) {
    assert(pmodel != NULL);

    if (model_velocita_ciclo(pmodel) + giri > pmodel->pmac.velocita_max_lavoro) {
        pmodel->delta_velocita = pmodel->pmac.velocita_max_lavoro - model_ciclo_corrente(pmodel)->velocita_asciugatura;
    } else if (model_velocita_ciclo(pmodel) + giri < pmodel->pmac.velocita_min_lavoro) {
        pmodel->delta_velocita = pmodel->pmac.velocita_min_lavoro - model_ciclo_corrente(pmodel)->velocita_asciugatura;
    } else {
        pmodel->delta_velocita += giri;
    }
}


void model_modifica_durata_asciugatura(model_t *pmodel, int minuti) {
    assert(pmodel != NULL);
    unsigned int secondi = stopwatch_get_remaining(&pmodel->status.tempo_asciugatura, get_millis()) / 1000;

    if (minuti > 0) {
        if (secondi + minuti * 60 < MINUTI_MASSIMI_ASCIUGATURA * 60) {
            stopwatch_change(&pmodel->status.tempo_asciugatura, (secondi + minuti * 60) * 1000UL, get_millis());
        } else {
            stopwatch_change(&pmodel->status.tempo_asciugatura, MINUTI_MASSIMI_ASCIUGATURA * 60 * 1000UL, get_millis());
        }
    } else if (minuti < 0) {
        if ((int)secondi + minuti * 60 > 0) {
            stopwatch_change(&pmodel->status.tempo_asciugatura, (secondi + minuti * 60) * 1000UL, get_millis());
        } else {
            stopwatch_change(&pmodel->status.tempo_asciugatura, 0, get_millis());
        }
    }
}


unsigned int model_secondi_durata_asciugatura(model_t *pmodel) {
    assert(pmodel != NULL);
    if (pmodel->pmac.abilita_gettoniera) {
        unsigned int secondi = 0;
        if (pmodel->pmac.tempo_gettone_min_sec) {
            secondi = pmodel->pwoff.credito * pmodel->pmac.tempo_gettone_1;
        } else {
            secondi = pmodel->pwoff.credito * pmodel->pmac.tempo_gettone_1 * 60;
        }
        if (secondi > 99 * 60 + 59) {
            return 99 * 60 + 59;
        } else {
            return secondi;
        }
    } else {
        return model_ciclo_corrente(pmodel)->tempo_durata_asciugatura * 60;
    }
}


int model_consenso_raggiunto(model_t *pmodel) {
    if (pmodel->pmac.abilita_gettoniera == GETTONIERA_DISABILITATA) {
        return 1;     // se non c'e' una gettoniera non serve il consenso
    } else {
        return pmodel->pwoff.credito >= pmodel->pmac.numero_gettoni_consenso;
    }
}


void model_azzera_credito(model_t *pmodel) {
    assert(pmodel != NULL);
    pmodel->pwoff.credito = 0;
}


void model_aggiungi_gettoni(model_t *pmodel, unsigned int gettoniera, unsigned int ingresso) {
    switch (pmodel->pmac.abilita_gettoniera) {
        case GETTONIERA_DISABILITATA:
            break;

        case GETTONIERA_NC:
        case GETTONIERA_NA:
            pmodel->pwoff.credito += ingresso;
            break;

        case GETTONIERA_INGRESSO:
            pmodel->pwoff.credito += gettoniera;
            break;

        default:
            break;
    }
}


uint16_t model_temperatura_aria_ciclo(model_t *pmodel) {
    assert(pmodel != NULL);
    return model_ciclo_corrente(pmodel)->temperatura_aria_1 + pmodel->delta_temperatura;
}


uint16_t model_velocita_ciclo(model_t *pmodel) {
    assert(pmodel != NULL);
    return model_ciclo_corrente(pmodel)->velocita_asciugatura + pmodel->delta_velocita;
}


int model_modifica_abilitata(model_t *pmodel) {
    if (model_get_status_work(pmodel) && model_ciclo_selezionato(pmodel) && pmodel->pmac.abilita_tasto_menu) {
        return 1;
    } else {
        return 0;
    }
}


static void init_comune_parametri_1(model_t *pmodel) {
    pmodel->pmac.tempo_azzeramento_ciclo_stop        = 5;
    pmodel->pmac.abilita_visualizzazione_temperatura = 0;
    pmodel->pmac.abilita_gettoniera                  = 1;
    pmodel->pmac.abilita_tasto_menu                  = 0;
    pmodel->pmac.tempo_azzeramento_ciclo_pausa       = 5;
}

static void init_comune_parametri_2(model_t *pmodel) {
    pmodel->pmac.tempo_azzeramento_ciclo_stop        = 3;
    pmodel->pmac.abilita_visualizzazione_temperatura = 1;
    pmodel->pmac.abilita_gettoniera                  = 0;
    pmodel->pmac.abilita_tasto_menu                  = 1;
    pmodel->pmac.tempo_azzeramento_ciclo_pausa       = 3;
}
