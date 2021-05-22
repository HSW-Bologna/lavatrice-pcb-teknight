#include <stdio.h>
#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"

static struct {
    lv_obj_t *digout_out;
    lv_obj_t *digout_status;
    int       digout_index;
} page_data;

static void *create_page(model_t *model, void *extra) {
    return NULL;
}

static void open_page(model_t *model, void *data) {
    view_common_title(lv_scr_act(), "TEST USCITE");
    page_data.digout_index = 0;
    lv_obj_t *lblout       = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(lblout, 1);
    lv_obj_align(lblout, NULL, LV_ALIGN_IN_TOP_LEFT, 2, 20);
    page_data.digout_out = lblout;

    lv_obj_t *lblstato = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(lblstato, 1);
    lv_obj_align(lblstato, NULL, LV_ALIGN_IN_TOP_RIGHT, 0, 20);
    page_data.digout_status = lblstato;
}


static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event) {
    view_message_t msg = VIEW_EMPTY_MSG;

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            if (event.key_event.event == KEY_CLICK) {
                switch (event.key_event.code) {
                    case BUTTON_SKIP_LEFT: {
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_SWAP_PAGE;
                        msg.vmsg.page = &page_temperature_test;
                        break;
                    }
                    case BUTTON_PLUS: {
                        if (page_data.digout_index < 6)
                            page_data.digout_index++;
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;
                    }
                    case BUTTON_MINUS: {
                        if (page_data.digout_index > 0)
                            page_data.digout_index--;
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        break;
                    }
                    case BUTTON_STOP: {
                        msg.cmsg.code   = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_DIGOUT;
                        msg.cmsg.output = page_data.digout_index;
                        msg.cmsg.value  = 0;
                        break;
                    }
                    case BUTTON_LINGUA: {
                        msg.cmsg.code   = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_DIGOUT;
                        msg.cmsg.output = page_data.digout_index;
                        msg.cmsg.value  = 1;
                        break;
                    }
                }
            }
            break;
        }

        case VIEW_EVENT_MODEL_UPDATE: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
            break;
        }
    }

    return msg;
}


static view_t update_page(model_t *model, void *arg) {

    lv_label_set_text_fmt(page_data.digout_out, "output: %i", page_data.digout_index);
    if (page_data.digout_index > 0)
        lv_label_set_text_fmt(page_data.digout_status, "%s",
                              model_get_output_status(model, page_data.digout_index - 1));

    return 0;
}


const pman_page_t page_digout_test = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = view_close_all,
};