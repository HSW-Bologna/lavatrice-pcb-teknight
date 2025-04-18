#include <xc.h>
#include "utils/assert.h"
#include "gel/timer/stopwatch.h"
#include "model.h"
#include "gel/crc/crc16-ccitt.h"
#include "gel/serializer/serializer.h"
#include "lv_conf.h"
#include "peripherals/timer.h"
#include "gel/parameter/parameter.h"
#include "peripherals/NT7534.h"


void model_init(model_t *model) {
    assert(model != NULL);

    memset(model, 0, sizeof(*model));

    model->tank_durations[TANK_1]      = 10 * 60 * 1000UL;
    model->tank_durations[TANK_2]      = 10 * 60 * 1000UL;
    model->tank_durations[TANK_3]      = 10 * 60 * 1000UL;
    model->tank_1_temperature_setpoint = 60;

    model->hsw.contrasto = NT7534_DEFAULT_CONTRAST;
}


unsigned long model_get_remaining_seconds(model_t *model, tank_t tank) {
    switch (model->tank_states[tank]) {
        case TANK_STATE_HEATING:
        case TANK_STATE_OFF:
            return model->tank_durations[tank] / 1000UL;
        case TANK_STATE_ON:
            return stopwatch_get_remaining(&model->tank_stopwatches[tank], get_millis()) / 1000UL;
    }

    return 0;
}


uint8_t model_is_temperature_ok(model_t *model) {
    return model->tank_states[TANK_1] == TANK_STATE_OFF || model->ptc_temperature > model->tank_1_temperature_setpoint;
}


void model_manage(model_t *model) {
    for (tank_t tank = TANK_1; tank < TANKS_NUM; tank++) {
        switch (model->tank_states[tank]) {
            case TANK_STATE_HEATING:
                if (model_is_temperature_ok(model)) {
                    stopwatch_setngo(&model->tank_stopwatches[tank], model->tank_durations[tank], get_millis());
                    model->tank_states[tank] = TANK_STATE_ON;
                }
                break;

            case TANK_STATE_ON:
                if (stopwatch_is_timer_reached(&model->tank_stopwatches[tank], get_millis())) {
                    model_stop(model, tank);
                }
                break;
            default:
                break;
        }
    }
}


void model_start(model_t *model, tank_t tank) {
    switch (model->tank_states[tank]) {
        case TANK_STATE_OFF:
            if (tank == TANK_1) {
                model->tank_states[tank] = TANK_STATE_HEATING;
            } else {
                stopwatch_setngo(&model->tank_stopwatches[tank], model->tank_durations[tank], get_millis());
                model->tank_states[tank] = TANK_STATE_ON;
            }
            break;
        case TANK_STATE_HEATING:
            if (tank == TANK_1) {
                if (model_is_temperature_ok(model)) {
                    stopwatch_setngo(&model->tank_stopwatches[tank], model->tank_durations[tank], get_millis());
                    model->tank_states[tank] = TANK_STATE_ON;
                }
            }
            break;
        case TANK_STATE_ON:
            break;
    }
}


void model_stop(model_t *model, tank_t tank) {
    switch (model->tank_states[tank]) {
        case TANK_STATE_OFF:
            break;
        case TANK_STATE_HEATING:
        case TANK_STATE_ON:
            stopwatch_stop(&model->tank_stopwatches[tank]);
            model->tank_states[tank] = TANK_STATE_OFF;
            break;
    }
}
