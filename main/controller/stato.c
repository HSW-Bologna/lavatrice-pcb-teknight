#include "stato.h"
#include "gel/timer/stopwatch.h"
#include "model/model.h"
#include "view/view.h"
#include "peripherals/timer.h"


typedef int(*stato_event_manager_t)(model_t *,stato_event_code_t);
typedef int(*stato_entry_t)(model_t *);


static int stato_off_event_manager(model_t *pmodel, stato_event_code_t event);
static int stato_off_entry(model_t *pmodel);
static int stato_on_event_manager(model_t *pmodel, stato_event_code_t event);
static int stato_on_entry(model_t *pmodel);


static const struct {
    stato_entry_t guard;
    stato_event_manager_t event;
} event_managers[] = {
    {stato_off_entry, stato_off_event_manager},
    {stato_on_entry, stato_on_event_manager},
};


void controller_stato_event(model_t *pmodel, stato_event_code_t event) {
    int res = event_managers[model_get_stato(pmodel)].event(pmodel, event);

    if (res >= 0) {
        if (event_managers[res].guard(pmodel) == 0) {
            model_cambia_stato(pmodel, res);
        }
    }
}


void controller_manage_stato(model_t *pmodel) {
    if (stopwatch_is_timer_reached(&pmodel->status.stopwatch, get_millis())) {
        model_cambia_stato(pmodel,STATO_OFF);
        view_event((view_event_t){.code = VIEW_EVENT_STATO_UPDATE});
    }
}


static int stato_off_entry(model_t *pmodel) {
    view_event((view_event_t){.code = VIEW_EVENT_STATO_UPDATE});
    stopwatch_stop(&pmodel->status.stopwatch);
    return 0;
}


static int stato_off_event_manager(model_t *pmodel, stato_event_code_t event) {
    switch (event) {
        case STATO_EVENT_START:
            return STATO_ON;

        default:
            break;
    }

    return -1;
}


static int stato_on_entry(model_t *pmodel) {
    stopwatch_setngo(&pmodel->status.stopwatch, 30000, get_millis());
    view_event((view_event_t){.code = VIEW_EVENT_STATO_UPDATE});
    return 0;
}


static int stato_on_event_manager(model_t *pmodel, stato_event_code_t event) {
    switch (event) {
        case STATO_EVENT_STOP:
            return STATO_OFF;

        default:
            break;
    }

    return -1;
}