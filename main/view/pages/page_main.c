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
#include "controller/ciclo.h"
#include "controller/ciclo.h"
#include "controller/controller.h"



static struct {
    size_t                 index;
    view_common_password_t password;

    lv_task_t *task;

    lv_obj_t *label;
    lv_obj_t *ltimer;
    lv_obj_t *ltemperature;
    lv_obj_t *lhumidity;     /////// 19/07/2022                 //// STR AAAA
    lv_obj_t *lcycle_temperature;
    lv_obj_t *status;
    lv_obj_t *image;

    unsigned long stop_timestamp;
    int           blink_antipiega;
} page_data;

static void update_timer(model_t *pmodel);
static void update_temperatura(model_t *pmodel);

stopwatch_t ct_string_status_change = STOPWATCH_NULL;


static void *create_page(model_t *model, void *extra) {
    page_data.task = view_common_register_timer(500);

    return NULL;
}

static void open_page(model_t *model, void *data) {
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_MID);
    view_common_password_reset(&page_data.password, get_millis());

    lv_obj_t *img = custom_lv_img_create(lv_scr_act(), NULL);     // creo il WIDGET per l' IMMAGINE dello STATO MACCHINA
    custom_lv_img_set_src(img, &legacy_img_programs);
    lv_obj_align(img, NULL, LV_ALIGN_IN_TOP_LEFT, 0, 0);
    page_data.image = img;

    lv_obj_t *lbl = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_style(lbl, &style_label_8x16);
    lv_label_set_align(lbl, LV_LABEL_ALIGN_CENTER);
    lv_label_set_long_mode(lbl, LV_LABEL_LONG_CROP);
    lv_obj_set_width(lbl, LV_HOR_RES);

    lv_obj_align(lbl, NULL, LV_ALIGN_IN_BOTTOM_MID, 0, 0);     // creo il WIDGET per la linea di STATO MACCHINA
    page_data.status = lbl;

    lbl = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_style(lbl, &style_label_8x16);
    lv_obj_set_auto_realign(lbl, 1);
    lv_obj_align(lbl, NULL, LV_ALIGN_IN_TOP_RIGHT, 0, 25);
    page_data.ltemperature = lbl;

    lbl = lv_label_create(lv_scr_act(), NULL);
    // lv_obj_set_style(lbl, &style_label_6x8);
    lv_obj_set_auto_realign(lbl, 1);
    lv_obj_align(lbl, page_data.ltemperature, LV_ALIGN_OUT_BOTTOM_RIGHT, 0, 0);
    page_data.lcycle_temperature = lbl;

    lv_obj_t *lbltimer = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_style(lbltimer, &style_label_8x16);
    lv_obj_set_auto_realign(lbltimer, 1);
    lv_obj_align(lbltimer, NULL, LV_ALIGN_IN_TOP_RIGHT, 0, 5);
    page_data.ltimer = lbltimer;


    //    lbl = lv_label_create(lv_scr_act(), NULL);                     //// STR AAAA PPPP
    //    //lv_obj_set_style(lbl, &style_label_6x8);
    //    lv_obj_set_auto_realign(lbl, 1);
    //    lv_obj_align(lbl, page_data.ltimer, LV_ALIGN_OUT_BOTTOM_RIGHT, 0, 0);
    //    page_data.lhumidity = lbl;



    /*
        lbl = lv_label_create(lv_scr_act(), NULL);                     //// STR AAAA PPPP
        //lv_obj_set_style(lbl, &style_label_6x8);
        lv_obj_set_auto_realign(lbl, 1);
        lv_obj_align(lbl, page_data.ltimer, LV_ALIGN_OUT_BOTTOM_RIGHT, 0, 0);
        page_data.lhumidity = lbl;
    */



    update_timer(model);
    update_temperatura(model);
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

                    case BUTTON_LINGUA:
                        break;

                    case BUTTON_CALDO:
                        break;

                    case BUTTON_MEDIO:
                        break;

                    case BUTTON_TIEPIDO:
                        break;

                    case BUTTON_LANA:
                        break;

                    case BUTTON_FREDDO:
                        break;

                    case BUTTON_MENU:
                        break;

                    case BUTTON_STOP:
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
            break;
        }
        default:
            break;
    }

    return msg;
}

static view_t update_page(model_t *pmodel, void *arg) {
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


static void update_temperatura(model_t *pmodel) {
    lv_label_set_text_fmt(page_data.ltemperature, "\xCE\xCF%4iC %s", 0, 1 ? "\xFF" : "\xFE");

    lv_label_set_text_fmt(page_data.lcycle_temperature, "[%3iC]", 0);
}



static void update_timer(model_t *pmodel) {
    unsigned int secondi = 0;

    lv_label_set_text_fmt(page_data.ltimer, "\xCC\xCD %02im%02is", secondi / 60, secondi % 60);
}
