#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"
#include "config/app_config.h"
#include <stdio.h>


static struct {
    lv_obj_t *label_version;
    lv_obj_t *label_mem_free;
    lv_obj_t *label_mem_frag;
    lv_obj_t *label_mem_low;
} page_data;



static void *create_page(model_t *pmodel, void *extra) {
    return NULL;
}


static void open_page(model_t *pmodel, void *data) {
    view_common_title(lv_scr_act(), "INFO");
    
    lv_obj_t *l_version = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(l_version, 1);
    lv_obj_align(l_version, NULL, LV_ALIGN_IN_TOP_LEFT, 0, 20);
    page_data.label_version = l_version;

    lv_obj_t *mem_free = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(mem_free, 1);
    lv_obj_align(mem_free, NULL, LV_ALIGN_IN_TOP_LEFT,0, 30);
    page_data.label_mem_free = mem_free;
    
    lv_obj_t *mem_frag = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(mem_frag, 1);
    lv_obj_align(mem_frag, NULL, LV_ALIGN_IN_TOP_LEFT,0, 40);
    page_data.label_mem_frag = mem_frag;
    
    lv_obj_t *mem_low = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(mem_low, 1);
    lv_obj_align(mem_low, NULL, LV_ALIGN_IN_TOP_LEFT,0, 50);
    page_data.label_mem_low = mem_low;
}


static view_message_t process_page_event(model_t *pmodel, void *arg, pman_event_t event) {
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
 
            if (event.key_event.code == BUTTON_STOP && event.key_event.event == KEY_CLICK) {
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
                msg.vmsg.page = &page_main;
            } 
            break;
        }
        default:
            break;
    }

    return msg;
}


static view_t update_page(model_t *pmodel, void *arg) {
    lv_label_set_text_fmt(page_data.label_version, "VERSION: %i.%i.%i", VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH);
    lv_label_set_text_fmt(page_data.label_mem_low, "MEM LOW: %i", (int)pmodel->mem_low);
    lv_label_set_text_fmt(page_data.label_mem_frag, "MEM FRAG: %i", (int)pmodel->mem_frag_pct);
    lv_label_set_text_fmt(page_data.label_mem_free, "MEM FREE: %i", (int)pmodel->mem_free_size);

    return 0;
}


const pman_page_t page_info = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = view_close_all,
};