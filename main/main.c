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
#include "controller/modbus_server.h"
#include "controller/controller.h"
#include "controller/stato.h"

static model_t model;

int main(void) {
    unsigned long tskp=0, ts_input=0, ts_temperature=0, ts_spi=0;
    
    
    system_init();
    spi_init();
    nt7534_init();
    digout_init();
    temperature_init();
    keyboard_init();
    
    //inizializzazioni
    i2c_bitbang_init();
    digin_init();
    timer_init();
    ptc_init();
    pwoff_init();
    pwm_init();
    gettoniera_init();
    uart_init();
    modbus_server_init();

    
    model_init(&model);
    controller_init(&model);
    view_init(&model, nt7534_flush, nt7534_rounder, nt7534_set_px, keyboard_reset);
    digout_buzzer_bip(2, 100, 100);
    
    
    for(;;) {
        controller_manage_gui(&model);
        modbus_server_manage();
        //controller_manage_stato(&model);
        ClrWdt();
        
        if (is_expired(ts_input, get_millis(), 2)) {
            if (digin_take_reading()) {
                view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});
                model.inputs=digin_get_inputs();
            }
            if (gettoniera_take_insert()) {
                view_event((view_event_t) {.code = VIEW_EVENT_MODEL_UPDATE});
                model.pwoff.credito+=gettoniera_get_count();
                controller_update_pwoff(&model);
                gettoniera_reset_count();
            }
            ts_input=get_millis();
           
        }
        
        
        if (is_expired(ts_temperature, get_millis(), 50)) {
            ptc_read_temperature();
            view_event((view_event_t) {.code = VIEW_EVENT_MODEL_UPDATE});
            model.ptc_adc = ptc_get_adc_value();
            model.ptc_temperature = ptc_get_temperature();
            ts_temperature=get_millis();
        }
        
        
        if (is_expired(ts_spi, get_millis(), 500)) {
            uint16_t temp, hum;
            
            if (temperature_read(&temp, &hum) == 0) {
                model.sht_temperature = temp;
            }
            
            ts_spi=get_millis();
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
        
        __delay_us(10);
    }
    return 0;
}
