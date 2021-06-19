#include <assert.h>
#include "model.h"
#include "parmac.h"
#include "gel/crc/crc16-ccitt.h"
#include "gel/serializer/serializer.h"
#include "lv_conf.h"


void model_init(model_t *pmodel) {
    pmodel->inputs          = 0;
    pmodel->pwoff.credito   = 0;
    pmodel->ptc_temperature = 0;
    pmodel->sht_temperature = 0;
    pmodel->pwm1            = 0;
    pmodel->pwm2            = 0;
    pmodel->ptc_adc         = 0;
    pmodel->outputs         = 0;

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

size_t model_pars_serialize(model_t *pmodel, uint8_t buff[static PARS_SERIALIZED_SIZE]) {
    size_t i = 2;
    i += serialize_uint8(&buff[i], pmodel->pmac.modello);
    i += serialize_uint8(&buff[i], pmodel->pmac.lingua);
    i += serialize_uint8(&buff[i], pmodel->pmac.logo);
    i += serialize_uint8(&buff[i], pmodel->pmac.livello_accesso);
    unsigned short crc = crc16_ccitt(&buff[2], i - 2, 0);
    serialize_uint16_be(&buff[0], crc);
    assert(i == PARS_SERIALIZED_SIZE);
    return i;
}

size_t model_pars_deserialize(model_t *pmodel, uint8_t *buff) {
    size_t   i = 0;
    uint16_t crc;
    i += deserialize_uint16_be(&crc, &buff[i]);
    if (crc != crc16_ccitt(&buff[2], PARS_SERIALIZED_SIZE - 2, 0)) {
        return -1;
    } else {
        i += deserialize_uint8(&pmodel->pmac.modello, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.lingua, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.logo, &buff[i]);
        i += deserialize_uint8(&pmodel->pmac.livello_accesso, &buff[i]);

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