#include <stdio.h>
#include <string.h>

#include "gel/pagemanager/page_manager.h"
#include "gel/timer/timecheck.h"
#include "lvgl/lvgl.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "peripherals/timer.h"
#include "peripherals/digout.h"
#include "view/common.h"
#include "view/fonts/legacy_fonts.h"
#include "view/images/legacy.h"
#include "view/intl/intl.h"
#include "view/styles.h"
#include "view/view.h"
#include "view/view_types.h"
#include "view/widgets/custom_lv_img.h"
#include "controller/controller.h"



static struct {
    size_t                 index;
    view_common_password_t password;

    lv_obj_t *label_tank;
    lv_obj_t *label_temperature;
    lv_obj_t *label_time;
    lv_obj_t *label_state;

    tank_t tank;

    lv_task_t *task;
} page_data;


stopwatch_t ct_string_status_change = STOPWATCH_NULL;


static void *create_page(model_t *model, void *extra) {
    page_data.task = view_common_register_timer(500);
    page_data.tank = TANK_1;
    return NULL;
}


static void open_page(model_t *model, void *data) {
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_MID);
    view_common_password_reset(&page_data.password, get_millis());

    {
        lv_obj_t *cont = lv_obj_create(lv_scr_act(), NULL);
        lv_obj_set_style(cont, &style_obj_border);
        lv_obj_set_size(cont, 128, 20);
        lv_obj_align(cont, NULL, LV_ALIGN_IN_TOP_MID, 0, 0);

        lv_obj_t *label = lv_label_create(cont, NULL);
        lv_obj_set_auto_realign(label, 1);
        lv_obj_set_style(label, &style_label_8x16);
        lv_obj_align(label, NULL, LV_ALIGN_CENTER, 0, 0);
        lv_label_set_align(label, LV_LABEL_ALIGN_CENTER);
        page_data.label_tank = label;
    }

    {
        lv_obj_t *label = lv_label_create(lv_scr_act(), NULL);
        lv_obj_set_auto_realign(label, 1);
        lv_obj_set_style(label, &style_label_8x16);
        lv_obj_align(label, NULL, LV_ALIGN_IN_LEFT_MID, +2, 0);
        page_data.label_time = label;
    }

    {
        lv_obj_t *label = lv_label_create(lv_scr_act(), NULL);
        lv_obj_set_auto_realign(label, 1);
        lv_obj_set_style(label, &style_label_8x16);
        lv_obj_align(label, NULL, LV_ALIGN_IN_RIGHT_MID, -2, 0);
        page_data.label_temperature = label;
    }

    {
        lv_obj_t *label = lv_label_create(lv_scr_act(), NULL);
        lv_obj_set_auto_realign(label, 1);
        lv_obj_set_style(label, &style_label_8x16);
        lv_obj_align(label, NULL, LV_ALIGN_IN_BOTTOM_MID, 0, 0);
        page_data.label_state = label;
    }
}


static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event) {
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

    switch (event.code) {
        case VIEW_EVENT_ALARM:
            break;

        case VIEW_EVENT_KEYPAD: {
            if (event.key_event.event == KEY_CLICK) {
                view_common_password_add_key(&page_data.password, event.key_event.code, get_millis());

                if (view_common_check_password(&page_data.password, VIEW_PASSWORD_MINUS, VIEW_SHORT_PASSWORD_LEN,
                                               get_millis())) {
                    // if (model_get_status_stopped(model))
                    //{
                    // msg.vmsg.code           = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    // msg.vmsg.page           = &page_digin_test;
                    // model->status.f_in_test = 1;
                    break;
                    //}
                    // else
                    //{
                    //    break;
                    //}
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_RIGHT, VIEW_SHORT_PASSWORD_LEN,
                                                      get_millis())) {
                    // msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    // msg.vmsg.page = &page_parmac;
                    break;
                }

                switch (event.key_event.code) {
                    case BUTTON_STOP_LANA:
                        break;

                    case BUTTON_STOP_FREDDO:
                        break;

                    case BUTTON_MEDIO:
                        if (page_data.tank == TANK_1) {
                            if (model->tank_1_temperature_setpoint < 80) {
                                model->tank_1_temperature_setpoint += 1;
                            }
                            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        }
                        break;

                    case BUTTON_FREDDO:
                        if (page_data.tank == TANK_1) {
                            if (model->tank_1_temperature_setpoint > 20) {
                                model->tank_1_temperature_setpoint -= 1;
                            }
                            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        }
                        break;

                    case BUTTON_CALDO:
                        if (model->tank_durations[page_data.tank] < 59 * 60 * 1000UL) {
                            model->tank_durations[page_data.tank] += 60 * 1000UL;
                        }
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;

                    case BUTTON_LANA:
                        model_start(model, page_data.tank);
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;

                    case BUTTON_STOP:
                        model_stop(model, page_data.tank);
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;

                    case BUTTON_TIEPIDO:
                        if (model->tank_durations[page_data.tank] > 60 * 1000UL) {
                            model->tank_durations[page_data.tank] -= 60 * 1000UL;
                        } else {
                            model->tank_durations[page_data.tank] -= 0;
                        }
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;

                    case BUTTON_LINGUA:
                        page_data.tank = (page_data.tank + 1) % TANKS_NUM;
                        msg.vmsg.code  = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;

                    case BUTTON_MENU:
                        if (page_data.tank > 0) {
                            page_data.tank--;
                        } else {
                            page_data.tank = TANKS_NUM - 1;
                        }
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;

                    default:
                        break;
                }
            } else if (event.key_event.event == KEY_LONGCLICK) {
                switch (event.key_event.code) {
                    case BUTTON_STOP:
                        break;
                }
            } else if (event.key_event.event == KEY_PRESSING || event.key_event.event == KEY_LONGPRESS) {
                switch (event.key_event.code) {
                    case BUTTON_STOP:
                        break;
                }
            }
            break;
        }

        case VIEW_EVENT_COIN: {
            break;
        }

        case VIEW_EVENT_STEP_UPDATE: {
            break;
        }

        case VIEW_EVENT_STATO_UPDATE: {
            break;
        }
        case VIEW_EVENT_CODE_TIMER: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
            break;
        }
        default:
            break;
    }

    return msg;
}

static view_t update_page(model_t *model, void *arg) {
    switch (page_data.tank) {
        case TANK_1:
            lv_label_set_text(page_data.label_tank, "Vasca 1");
            break;

        case TANK_2:
            lv_label_set_text(page_data.label_tank, "Vasca 2");
            break;

        case TANK_3:
            lv_label_set_text(page_data.label_tank, "Vasca 3");
            break;
    }

    unsigned long total_seconds = model_get_remaining_seconds(model, page_data.tank);
    unsigned long seconds       = total_seconds % 60;
    unsigned long minutes       = total_seconds / 60;

    lv_label_set_text_fmt(page_data.label_time, "\xCC\xCD%02i:%02i", minutes, seconds);

    if (page_data.tank == TANK_1) {
        lv_obj_set_hidden(page_data.label_temperature, 0);
        lv_label_set_text_fmt(page_data.label_temperature, "\xCE\xCF%2iC", model->tank_1_temperature_setpoint);
    } else {
        lv_obj_set_hidden(page_data.label_temperature, 1);
    }

    switch (model->tank_states[page_data.tank]) {
        case TANK_STATE_OFF:
            lv_label_set_text(page_data.label_state, "Ferma");
            break;

        case TANK_STATE_HEATING:
            if (model_is_temperature_ok(model)) {
                lv_label_set_text(page_data.label_state, "Riscaldato");
            } else {
                lv_label_set_text(page_data.label_state, "Riscaldamento");
            }
            break;

        case TANK_STATE_ON:
            lv_label_set_text(page_data.label_state, "Lavaggio");
            break;
    }

    return 0;
}

static void page_destroy(void *data, void *extra) {
    lv_task_del(page_data.task);
}

static void page_close(void *data) {
    (void)data;
    lv_obj_clean(lv_scr_act());
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_OFF);
}

const pman_page_t page_main = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = page_close,
    .destroy       = page_destroy,
};
