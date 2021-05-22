#include <stdio.h>
#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "lvgl/lvgl.h"
#include "view/fonts/legacy_fonts.h"
#include "view/common.h"
#include "view/images/legacy.h"
#include "view/widgets/custom_lv_img.h"


static struct {
    lv_obj_t *temp_spi;
    lv_obj_t *temp_ptc;
    lv_obj_t *temp_ptc_adc;
} page_data;



static void *create_page(model_t *model, void *extra) {
    return NULL;
}


static void open_page(model_t *model, void *data) {
    view_common_title(lv_scr_act(), "TEST TEMPERATURA");

    lv_obj_t *lblspi = lv_label_create(lv_scr_act(), NULL);
    lv_obj_set_auto_realign(lblspi, 1);
    lv_obj_align(lblspi, NULL, LV_ALIGN_IN_TOP_LEFT, 2, 20);
    page_data.temp_spi = lblspi;

    lv_obj_t *lblptc = lv_label_create(lv_scr_act(), lblspi);
    lv_obj_align(lblptc, lblspi, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 4);
    page_data.temp_ptc = lblptc;

    lv_obj_t *lbladc = lv_label_create(lv_scr_act(), lblspi);
    lv_obj_align(lbladc, lblptc, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 4);
    page_data.temp_ptc_adc = lbladc;

    /*
        lv_obj_t *img = custom_lv_img_create(lv_scr_act(), NULL);
        custom_lv_img_set_src(img, &legacy_img_insert_coin);
        lv_obj_align(img, NULL, LV_ALIGN_CENTER, 0, 0);
        */
}


static view_message_t process_page_event(model_t *model, void *arg, pman_event_t event) {
    view_message_t msg = VIEW_EMPTY_MSG;

    switch (event.code) {
        case VIEW_EVENT_KEYPAD: {
            if (event.key_event.event == KEY_CLICK) {
                if (event.key_event.code == BUTTON_SKIP_RIGHT) {
                    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_SWAP_PAGE;
                    msg.vmsg.page = &page_digout_test;
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
    lv_label_set_text_fmt(page_data.temp_spi, "SHT: %4.2f C", (float)model->sht_temperature / 100.);
    lv_label_set_text_fmt(page_data.temp_ptc, "PTC: %4.2f C", (float)model->ptc_temperature, model->ptc_adc);
    lv_label_set_text_fmt(page_data.temp_ptc_adc, "     %4i ADC", model->ptc_adc);

    return 0;
}


const pman_page_t page_temperature_test = {
    .create        = create_page,
    .open          = open_page,
    .update        = update_page,
    .process_event = process_page_event,
    .close         = view_close_all,
};