#include <stdio.h>
#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"

static struct {
    lv_obj_t *speedlbl;
    int speed;
    int step;
} page_data;

static void *create_page(model_t *model, void *extra) {
    return NULL;
}


static void open_page(model_t *model, void *data) {
    view_common_title(lv_scr_act(), "VELOCITA'");
    
    lv_obj_t *lblspeed      = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(lblspeed, 1);
    lv_obj_align(lblspeed, NULL, LV_ALIGN_IN_TOP_LEFT, 0, 20);
    page_data.speedlbl = lblspeed;
}

static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event) {
    view_message_t msg = VIEW_EMPTY_MSG;

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            if (event.key_event.event == KEY_CLICK) {
                switch (event.key_event.code) {
                    case BUTTON_SKIP_LEFT: {
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_SWAP_PAGE;
                        msg.vmsg.page = &page_digin_test;
                        break;
                    }
                    case BUTTON_PLUS: {
                        if (page_data.speed==255)
                            page_data.speed = 0;
                        else 
                            page_data.speed++;
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
                        break;
                    }
                    case BUTTON_MINUS: {
                        if (page_data.speed==0)
                            page_data.speed = 255;
                        else 
                            page_data.speed--;
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
                        break;
                    }
                    case BUTTON_LINGUA: {
                        if (page_data.step==4) {
                            page_data.step=0;
                            page_data.speed=0;
                        }
                        else {
                            page_data.step++;
                            if (page_data.step==1) 
                                page_data.speed=63;
                            if (page_data.step==2) 
                                page_data.speed=127;
                            if (page_data.step==3) 
                                page_data.speed=191;
                            if (page_data.step==4) 
                                page_data.speed=255;
                        }
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
                        break;
                    }
                    case BUTTON_STOP: {
                        page_data.step=0;
                        page_data.speed=0;
                        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                        msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
                        break;
                    }
                }
            }
            
            if (event.key_event.event == KEY_PRESSING && event.key_event.code == BUTTON_PLUS) {
                if (page_data.speed==255) {
                    page_data.speed=0;
                }
                page_data.speed++;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
            }
            
            if (event.key_event.event == KEY_PRESSING && event.key_event.code == BUTTON_MINUS) {
                if (page_data.speed==0) {
                    page_data.speed=255;
                }
                page_data.speed--;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM;
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

    lv_label_set_text_fmt(page_data.speedlbl, "DA/V %i-[ST %i]", page_data.speed, page_data.step);
    
    return 0;
}


const pman_page_t page_pwm_test = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = view_close_all,
};
