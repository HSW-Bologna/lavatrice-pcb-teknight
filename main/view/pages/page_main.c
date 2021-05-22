#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"
#include <stdio.h>
#include "peripherals/timer.h"


static struct {
    lv_obj_t *label;
    lv_obj_t *label_inputs;

    size_t                 index;
    view_common_password_t password;
} page_data;



static void *create_page(model_t *model, void *extra) {
    return NULL;
}


static void open_page(model_t *model, void *data) {
    lv_obj_t *label = lv_label_create(lv_scr_act(), NULL);
    view_common_password_reset(&page_data.password, get_millis());

    lv_label_set_text(label, "Pagina principale");
    lv_obj_set_pos(label, 10, 10);
    page_data.label = label;

    lv_obj_t *label_inputs = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_pos(label_inputs, 10, 30);
    page_data.label_inputs = label_inputs;
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
                }
            }

            if (event.key_event.code == BUTTON_SKIP_RIGHT && event.key_event.event == KEY_CLICK) {
                lv_label_set_text(page_data.label, "skip destra");
            } else if (event.key_event.code == BUTTON_SKIP_LEFT && event.key_event.event == KEY_CLICK) {
                lv_label_set_text(page_data.label, "skip sinistra");
            } else if (event.key_event.code == BUTTON_LINGUA && event.key_event.event == KEY_CLICK) {
                lv_label_set_text(page_data.label, "globo");
            } else if (event.key_event.code == BUTTON_STOP && event.key_event.event == KEY_CLICK) {
                lv_label_set_text(page_data.label, "STOP");
//            } else if (event.key_event.code == BUTTON_PLUS && event.key_event.event == KEY_CLICK) {
//                lv_label_set_text(page_data.label, "pwm up");
//                if (model->pwm < 100) {
//                    model->pwm += 10;
//                    msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
//                }
//            } else if (event.key_event.code == BUTTON_MINUS && event.key_event.event == KEY_CLICK) {
//                lv_label_set_text(page_data.label, "pwm down");
//                if (model->pwm > 0) {
//                    model->pwm -= 10;
//                    msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
//                }
            }
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
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