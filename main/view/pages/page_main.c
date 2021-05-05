#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"


static struct {
    lv_obj_t *label;
} page_data;



static void *create_page(model_t *model, void *extra) {
    return NULL;
}


static void open_page(model_t *model, void *data) {
    lv_obj_t *label = lv_label_create(lv_scr_act(),NULL);
    
    lv_label_set_text(label, "ariciao");
    lv_obj_set_pos(label, 10, 10);
    page_data.label = label;
}


static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event){
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE; 
                    
            if (event.key_event.code==BUTTON_SKIP_RIGHT && event.key_event.event==KEY_CLICK) {
                lv_label_set_text(page_data.label, "skip destra");
            } else if (event.key_event.code==BUTTON_SKIP_LEFT && event.key_event.event==KEY_CLICK) {
                lv_label_set_text(page_data.label, "skip sinistra");
            } else if (event.key_event.code==BUTTON_GLOBE && event.key_event.event==KEY_CLICK) {
                lv_label_set_text(page_data.label, "globo");
            } else if (event.key_event.code==BUTTON_STOP && event.key_event.event==KEY_CLICK) {
                lv_label_set_text(page_data.label, "STOP");
            }
            break;
        }
    }

    return msg;
}


static view_t update_page(model_t *model, void *arg){
    
    return 0;
}


const pman_page_t page_main = {
    .create = create_page,
    .open = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close = view_close_all,
};