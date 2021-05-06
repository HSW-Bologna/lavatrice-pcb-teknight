#include <unistd.h>
#include <SDL2/SDL.h>
#include <stdint.h>

#include "lvgl.h"

#include "simulator_utils.h"
#include "display/monitor.h"
#include "view/view.h"
#include "controller/gui.h"
#include "controller/controller.h"
#include "simulator_utils.h"
#include "gel/keypad/keypad.h"
#include "gel/timer/timecheck.h"
#include "peripherals/keyboard.h"


int main(int argc, char *argv[]) {
    unsigned long tskp = 0;
    model_t       model;

    monitor_init();
    keyboard_init();

    model_init(&model);
    view_init(&model, monitor_flush, NULL, NULL);

    for (;;) {
        controller_manage_gui(&model);

        if (is_expired(tskp, get_millis(), 5)) {
            keypad_update_t update = keyboard_manage(get_millis());

            if (update.event != KEY_NOTHING) {
                view_event((view_event_t){.code = VIEW_EVENT_KEYPAD, .key_event = update});
            }
            tskp = get_millis();
        }

        usleep(1000UL);
    }

    return 0;
}