#include "view/view.h"
#include "view/styles.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "view/intl/intl.h"
#include "peripherals/keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"
#include <stdio.h>
#include "peripherals/timer.h"
#include "view/widgets/custom_lv_img.h"
#include "view/images/legacy.h"


static struct {
    size_t                 index;
    view_common_password_t password;
    lv_obj_t *             status;
} page_data;



static void *create_page(model_t *model, void *extra) {
    return NULL;
}


static void open_page(model_t *model, void *data) {
    view_common_password_reset(&page_data.password, get_millis());

    lv_obj_t *img = custom_lv_img_create(lv_scr_act(), NULL);
    custom_lv_img_set_src(img, &legacy_img_programs);
    lv_obj_align(img, NULL, LV_ALIGN_IN_TOP_LEFT, 0, 0);

    lv_obj_t *lbl = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_style(lbl, &style_label_8x16);
    lv_label_set_align(lbl, LV_LABEL_ALIGN_CENTER);
    lv_label_set_long_mode(lbl, LV_LABEL_LONG_CROP);
    lv_obj_set_width(lbl, LV_HOR_RES);
    lv_obj_align(lbl, NULL, LV_ALIGN_IN_BOTTOM_MID, 0, 0);

    page_data.status = lbl;
    lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
}


static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event) {
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;

            if (event.key_event.event == KEY_CLICK) {
                view_common_password_add_key(&page_data.password, event.key_event.code, get_millis());
                if (view_common_check_password(&page_data.password, VIEW_PASSWORD_MINUS, get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_digin_test;
                    break;
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_RIGHT, get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_parmac;
                    break;
                } else if (view_common_check_password(&page_data.password, VIEW_PASSWORD_LEFT, get_millis())) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                    msg.vmsg.page = &page_scelta_programma;
                    break;
                }
            }

            if (event.key_event.code == BUTTON_STOP_MENU && event.key_event.event == KEY_CLICK) {
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                msg.vmsg.page = &page_info;
            } else if (event.key_event.code == BUTTON_LINGUA && event.key_event.event == KEY_CLICK) {
                model_cambia_lingua(model);
                lv_label_set_text(page_data.status, view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
            }
            break;
        }
        case VIEW_EVENT_MODEL_UPDATE: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
            break;
        }
        default:
            break;
    }

    return msg;
}


static view_t update_page(model_t *model, void *arg) {
    return 0;
}


const pman_page_t page_main = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = view_close_all,
};