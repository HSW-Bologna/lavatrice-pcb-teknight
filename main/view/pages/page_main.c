#include <stdio.h>

#include "controller/gt_allarmi.h"
#include "gel/pagemanager/page_manager.h"
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

strings_t allarme_codice[14] = {
    STRINGS_ALLARME_OBLO_APERTO,       STRINGS_ALLARME_EMERGENZA,     STRINGS_ALLARME_TEMPO_SCADUTO_T1,
    STRINGS_ALLARME_ERRORE_RAM,        STRINGS_ALLARME_INVERTER,      STRINGS_ALLARME_FILTRO_APERTO,
    STRINGS_ALLARME_BLOCCO_BRUCIATORE, STRINGS_ALLARME_TEMPERATURA_1, STRINGS_ALLARME_FLUSSO_ARIA,
    STRINGS_AVVISO_ANTIPIEGA,          STRINGS_AVVISO_DRY_CONTROL,    STRINGS_AVVISO_SOVRATEMPERATURA,
    STRINGS_ALLARME_ANOMALIA_ARIA,     STRINGS_AVVISO_MANUTENZIONE,
};

static struct {
    size_t                 index;
    view_common_password_t password;

    lv_task_t *task;

    lv_obj_t *label;
    lv_obj_t *ltimer;
    lv_obj_t *status;
    lv_obj_t *image;
} page_data;

static void *create_page(model_t *model, void *extra) {
    page_data.task = view_common_register_timer(1000);
    return NULL;
}

static void open_page(model_t *model, void *data) {
    view_common_password_reset(&page_data.password, get_millis());

    lv_obj_t *img = custom_lv_img_create(lv_scr_act(), NULL);
    custom_lv_img_set_src(img, &legacy_img_programs);
    lv_obj_align(img, NULL, LV_ALIGN_IN_TOP_LEFT, 0, 0);
    page_data.image = img;

    lv_obj_t *lbl = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_style(lbl, &style_label_8x16);
    lv_label_set_align(lbl, LV_LABEL_ALIGN_CENTER);
    lv_label_set_long_mode(lbl, LV_LABEL_LONG_CROP);
    lv_obj_set_width(lbl, LV_HOR_RES);
    lv_obj_align(lbl, NULL, LV_ALIGN_IN_BOTTOM_MID, 0, 0);
    page_data.status = lbl;

    lv_obj_t *lbltimer = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(lbltimer, 1);
    lv_obj_align(lbltimer, NULL, LV_ALIGN_IN_TOP_RIGHT, 0, 10);
    page_data.ltimer = lbltimer;
    lv_obj_set_hidden(page_data.ltimer, 1);

    if (model->status.n_allarme == ALL_NO) {
        lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
    }

    ////model->status.n_allarme = 2;
}

static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event) {
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            // msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
            if (model->status.n_allarme != 0) {
                lv_label_set_text(page_data.status,
                                  view_intl_get_string(model, allarme_codice[model->status.n_allarme - 1]));
                custom_lv_img_set_src(page_data.image, &legacy_img_warning);
            }
            if (event.key_event.event == KEY_CLICK) {
                view_common_password_add_key(&page_data.password, event.key_event.code, get_millis());
                if (view_common_check_password(&page_data.password, VIEW_PASSWORD_MINUS, VIEW_SHORT_PASSWORD_LEN,
                                               get_millis())) {
                    msg.vmsg.code           = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page           = &page_digin_test;
                    model->status.f_in_test = 1;
                    break;
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_RIGHT, VIEW_SHORT_PASSWORD_LEN,
                                                      get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_parmac;
                    break;
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_LEFT, VIEW_SHORT_PASSWORD_LEN,
                                                      get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_scelta_programma;
                    break;
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_RESET, VIEW_LONG_PASSWORD_LEN,
                                                      get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_reset_ram;
                    break;
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_TIEPIDO,
                                                      VIEW_SHORT_PASSWORD_LEN, get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_stats;
                    break;
                } else if (view_common_check_password_started(&page_data.password)) {
                    break;
                }
            }

            if (event.key_event.code == BUTTON_STOP_LANA && event.key_event.event == KEY_CLICK) {
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                msg.vmsg.page = &page_contrast;
            } else if (event.key_event.code == BUTTON_STOP_FREDDO && event.key_event.event == KEY_CLICK) {
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                msg.vmsg.page = &page_info;
            } else if (event.key_event.code == BUTTON_LINGUA && event.key_event.event == KEY_CLICK) {
                model_cambia_lingua(model);
                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
            } else if (event.key_event.code == BUTTON_CALDO && event.key_event.event == KEY_CLICK) {
                model_set_status_work(model);
                model_set_status_step_asc(model);
                model->status.ciclo = CICLO_CALDO;

                lv_obj_set_hidden(page_data.ltimer, 0);
                lv_task_set_prio(page_data.task, LV_TASK_PRIO_MID);

                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_PROGRAMMA_CALDO));
                custom_lv_img_set_src(page_data.image, &legacy_img_program_caldo);
            } else if (event.key_event.code == BUTTON_MEDIO && event.key_event.event == KEY_CLICK) {
                model_set_status_work(model);
                model_set_status_step_asc(model);
                model->status.ciclo = CICLO_MEDIO;

                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_PROGRAMMA_MEDIO));
                custom_lv_img_set_src(page_data.image, &legacy_img_program_medio);
            } else if (event.key_event.code == BUTTON_TIEPIDO && event.key_event.event == KEY_CLICK) {
                model_set_status_work(model);
                model_set_status_step_asc(model);
                model->status.ciclo = CICLO_TIEPIDO;

                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_PROGRAMMA_TIEPIDO));
                custom_lv_img_set_src(page_data.image, &legacy_img_program_tiepido);
            } else if (event.key_event.code == BUTTON_LANA && event.key_event.event == KEY_CLICK) {
                model_set_status_work(model);
                model_set_status_step_asc(model);
                model->status.ciclo = CICLO_LANA;

                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_PROGRAMMA_LANA));
                custom_lv_img_set_src(page_data.image, &legacy_img_program_lana);
            } else if (event.key_event.code == BUTTON_FREDDO && event.key_event.event == KEY_CLICK) {
                model_set_status_work(model);
                model_set_status_step_asc(model);
                model->status.ciclo = CICLO_FREDDO;
                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_PROGRAMMA_FREDDO));
                custom_lv_img_set_src(page_data.image, &legacy_img_program_freddo);
            } else if (event.key_event.code == BUTTON_STOP && model_get_status_work(model)) {
                model_set_status_pause(model);
                custom_lv_img_set_src(page_data.image, &legacy_img_stop);
                // lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
            }
            break;
        }
        case VIEW_EVENT_MODEL_UPDATE: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
            break;
        }

        case VIEW_EVENT_STATO_UPDATE: {
            if (model_get_stato(model) == STATO_WORK) {
                lv_obj_set_hidden(page_data.ltimer, 0);
                lv_label_set_text(page_data.status, "STATO ON");
                lv_task_set_prio(page_data.task, LV_TASK_PRIO_MID);
            } else if (model_get_stato(model) == STATO_STOPPED) {
                lv_obj_set_hidden(page_data.ltimer, 1);
                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
                lv_task_set_prio(page_data.task, LV_TASK_PRIO_OFF);
                lv_task_reset(page_data.task);
            }
            break;
        }
        case VIEW_EVENT_CODE_TIMER: {
            lv_label_set_text_fmt(page_data.ltimer, "%lusec", model_get_stato_timer(model));
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

static void view_close(void *data) {
    (void)data;
    lv_obj_clean(lv_scr_act());
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_OFF);
}

const pman_page_t page_main = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = view_close,
    .destroy       = page_destroy,
};
