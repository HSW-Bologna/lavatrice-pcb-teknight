#include "lvgl/lvgl.h"
#include "controller.h"
#include "view/view.h"
#include "gel/timer/timecheck.h"
#include "peripherals/digout.h"



void controller_manage_gui(model_t *model) {
    view_message_t       umsg;
    view_event_t         event;

    lv_task_handler();

    while (view_get_next_msg(model, &umsg, &event)) {
        controller_process_msg(&umsg.cmsg, model);
        view_process_msg(umsg.vmsg, model);
        
        if (event.code == VIEW_EVENT_KEYPAD && event.key_event.event == KEY_CLICK) {
            digout_buzzer_bip(1, 100, 0);
        }
    }
}

