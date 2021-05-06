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
#include "i2c_devices/eeprom/24LC16.h"
#include "peripherals/timer.h"
#include "gel/timer/timecheck.h"
#include "model/model.h"
#include "view/view.h"
#include "controller/gui.h"
#include "pwoff.h"


int main(void) {
    unsigned long ts=0, tskp=0;
    model_t model;
    
    spi_init();
    nt7534_init();
    digout_init();
    temperature_init();
    keyboard_init();
    
    //inizializzazioni
    Init_I2C();
    digin_init();
    timer_init();
    ptc_init();
    pwoff_init();

    
    model_init(&model);
    view_init(&model, nt7534_flush, nt7534_rounder, nt7534_set_px);
    
    
    for(;;) {
        controller_manage_gui(&model);
        
        if (is_expired(ts, get_millis(), 1000)) {
            //test ptc analogico
            //unsigned long valore=ptc_read_input(PTC_CHANNEL);
            ts=get_millis();
        }

       
        if (is_expired(tskp,get_millis(), 5)) {
            keypad_update_t update = keyboard_manage(get_millis());
            
            if (update.event != KEY_NOTHING) {
                view_event((view_event_t){.code = VIEW_EVENT_KEYPAD, .key_event = update});
            }
            tskp=get_millis();
        }
       
         //controllo buzzer
        digout_buzzer_check(); 
        
        __delay_ms(1);
    }
    return 0;
}
