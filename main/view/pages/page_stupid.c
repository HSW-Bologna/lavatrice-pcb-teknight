#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"
#include "view/styles.h"
#include "config/app_config.h"
#include <stdio.h>


static struct {
    lv_obj_t  *label_stuff;
    lv_task_t *task;
} page_data;



static void *create_page(model_t *pmodel, void *extra) {
    page_data.task = view_common_register_timer(250);
    return NULL;
}


static void open_page(model_t *pmodel, void *data) {
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_MID);
    view_common_title(lv_scr_act(), "INFO");

    lv_obj_t *lbl = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(lbl, 1);
    lv_label_set_long_mode(lbl, LV_LABEL_LONG_BREAK);
    lv_obj_set_width(lbl, 120);
    lv_obj_align(lbl, NULL, LV_ALIGN_IN_TOP_LEFT, 4, 15);
    lv_obj_set_style(lbl, &style_label_6x8);
    page_data.label_stuff = lbl;
}


static view_message_t process_page_event(model_t *pmodel, void *arg, pman_event_t event) {
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

    switch (event.code) {
        case VIEW_EVENT_CODE_TIMER:
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
            break;

        case VIEW_EVENT_KEYPAD: {
            if (event.key_event.code == BUTTON_STOP && event.key_event.event == KEY_CLICK) {
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_BACK;
            }
            break;
        }
        default:
            break;
    }

    return msg;
}


static view_t update_page(model_t *pmodel, void *arg) {
    lv_label_set_text_fmt(page_data.label_stuff, "f_start %i, pmac %i, test %i, n_all %i, f_all %i",
                          pmodel->status.f_start_ok, pmodel->pmac.abilita_disabilito_allarmi, pmodel->status.f_in_test,
                          pmodel->status.n_allarme, pmodel->status.f_all);

    return 0;
}


static void page_close(void *data) {
    (void)data;
    lv_obj_clean(lv_scr_act());
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_OFF);
}


static void page_destroy(void *data, void *extra) {
    lv_task_del(page_data.task);
}


const pman_page_t page_stupid = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = page_close,
    .destroy       = page_destroy,
};
