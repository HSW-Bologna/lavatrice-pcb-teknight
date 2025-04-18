#include "peripherals/system.h"
#include "peripherals/hardwareprofile.h"
#include "lvgl/lvgl.h"
#include "peripherals/NT7534.h"
#include "peripherals/digout.h"
#include "peripherals/spi.h"
#include "peripherals/temperature.h"
#include "peripherals/keyboard.h"
#include "peripherals/digin.h"
#include "peripherals/ptc.h"
#include "peripherals/i2c_devices.h"
#include "i2c_ports/PIC/i2c_driver.h"
#include "i2c_ports/PIC/i2c_bitbang.h"
#include "i2c_common/i2c_common.h"
#include "peripherals/timer.h"
#include "gel/timer/timecheck.h"
#include "model/model.h"
#include "view/view.h"
#include "controller/gui.h"
#include "pwoff.h"
#include "gettoniera.h"
#include "peripherals/pwm.h"
#include "uart_driver.h"
#include "controller/controller.h"
#include "controller/stato.h"

#include "peripherals/led.h"


model_t model;



int main(void) {
    unsigned long tskp = get_millis(), ts_input = get_millis(), ts_temperature = get_millis(), ts_spi = get_millis(),
                  ts_allarmi = get_millis(), ts_start_delay = get_millis(), ts_reset = get_millis();

    // inizializzazioni ----------------------- //
    system_init();

    spi_init();
    nt7534_init();
    digout_init();
    led_init();
    keyboard_init();

    i2c_bitbang_init(2);
    digin_init();
    timer_init();
    ptc_init();
    pwoff_init();
    pwm_init();
    gettoniera_init();
    uart_init();

    model_init(&model);
    view_init(&model, nt7534_flush, nt7534_rounder, nt7534_set_px, keyboard_reset);

    controller_init(&model);

    digout_buzzer_bip(4, 200, 200);

    // MAIN LOOP ============================================================ //
    for (;;) {
        controller_manage_gui(&model);

        ClrWdt();

        if (is_expired(ts_input, get_millis(), 2)) {
            if (digin_take_reading()) {
                view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});

                model.inputs = digin_get_inputs();
            }

            ts_input = get_millis();
        }



        if (is_expired(tskp, get_millis(), 5)) {
            keypad_update_t update = keyboard_manage(get_millis());

            if (update.event != KEY_NOTHING) {
                ts_reset = get_millis();
                view_event((view_event_t){.code = VIEW_EVENT_KEYPAD, .key_event = update});
            }
            if (0) {
                pwm_set_test((&model), model.pwm1, 1);
                pwm_set_test((&model), model.pwm2, 2);
            }
            tskp = get_millis();
        }



        if (is_expired(ts_temperature, get_millis(), 50)) {
            ptc_read_temperature();
            view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});

            model.ptc_adc         = ptc_get_adc_value();
            model.ptc_temperature = ptc_get_temperature();

            ts_temperature = get_millis();
        }

        // controllo buzzer
        digout_buzzer_check();

        __delay_us(10);
    }
    return 0;
}
