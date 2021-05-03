#include "peripherals/system.h"
#include "peripherals/hardwareprofile.h"
#include "lvgl/lvgl.h"
#include "peripherals/NT7534.h"
#include "peripherals/digout.h"
#include "peripherals/spi.h"
#include "peripherals/temperature.h"
#include "peripherals/keyboard.h"
#include "peripherals/digin.h"
#include "peripherals/i2c_devices.h"
#include "i2c_ports/PIC/i2c_driver.h"
#include "i2c_ports/PIC/i2c_bitbang.h"
#include "i2c_common/i2c_common.h"
#include "i2c_devices/eeprom/24LC16.h"
#include "peripherals/timer.h"
#include "gel/timer/timecheck.h"
#include "ptc.h"
#include "model/model.h"
#include "view/view.h"

int main(void) {
    
    unsigned long ts=0, tskp=0;
    int onoff=0;
    // int count=0;
    
    spi_init();
    nt7534_init();
    lv_init();
    digout_init();
    temperature_init();
    keyboard_init();
    
    //inizializzazioni
    Init_I2C();
    digin_init();
    timer_init();
    // ptc_init();
        
    static lv_disp_buf_t disp_buf;
    static uint8_t gbuf[512];
    lv_disp_buf_init(&disp_buf, gbuf, NULL, 4096 );
    lv_disp_drv_t disp_drv;
    lv_disp_drv_init(&disp_drv);
    disp_drv.buffer=&disp_buf;
    disp_drv.flush_cb=nt7534_flush;
    disp_drv.set_px_cb=nt7534_set_px;
    disp_drv.rounder_cb=nt7534_rounder;
    lv_disp_drv_register(&disp_drv);
    
    lv_theme_t *th = lv_theme_mono_init(0,&lv_font_unscii_8);
    lv_theme_set_current(th);
    
    lv_obj_t *label = lv_label_create(lv_scr_act(),NULL);
    lv_label_set_text(label, "ariciao");
    lv_obj_set_pos(label, 10, 10);
    
    for(;;) {
        //PROVA TIMER CON RELE1
        if (is_expired(ts, get_millis(), 1000)) {
            rele_set(RELE_1, onoff);
            onoff=!onoff;

            //test ptc analogico
//            char string[32]={0};
//            unsigned long valore=ptc_read_input(PTC_CHANNEL);
//            sprintf(string, "%i valore: %x", count, valore);
//            count++;
//            lv_label_set_text(label, string);
            ts=get_millis();
        }
                
//        uint8_t buffer[128]={0};
//        __delay_ms(500);
//        memset(buffer,0xaa,128);
//        nt7534_sync(buffer,10,10,20,20);
        lv_task_handler();
        __delay_ms(1);
        lv_tick_inc(50);
        
//        uint16_t t, h;
//        int x= spi_read_temperature(&t,&h);
//        lv_label_set_text_fmt(label, "%i %i %i", x, t, h);
        
        //TEST TASTIERA   
//        unsigned int map;
//        map=keyboard_read();
//        lv_label_set_text_fmt(label, "0x%03X", map);
        
        if (is_expired(tskp,get_millis(), 2)) {
            tskp=get_millis();
            keypad_update_t update = keyboard_manage(get_millis());
            view_event(update);
            if (update.code==BUTTON_SKIP_RIGHT && update.event==KEY_CLICK) {
                lv_label_set_text(label, "skip destra");
            }
            if (update.code==BUTTON_SKIP_LEFT && update.event==KEY_CLICK) {
                lv_label_set_text(label, "skip sinistra");
                digout_buzzer_bip(8,500,500);
            }
            if (update.code==BUTTON_GLOBE && update.event==KEY_CLICK) {
                lv_label_set_text(label, "globo");
            }
            if (update.code==BUTTON_STOP && update.event==KEY_CLICK) {
                lv_label_set_text(label, "STOP");
                digout_buzzer_bip(5,500,100);
            }
            
        }
       
         //controllo buzzer
        digout_buzzer_check();

        //test eeprom
//      uint8_t dataw[128]={"ciao"};
//      uint8_t datar[128]={0};
//      EE24LC16_sequential_write(eeprom_driver, 0, EEPROM24LC16_DEFAULT_ADDRESS, "ciaociao", 128);
//      EE24LC16_sequential_read(eeprom_driver, 0, EEPROM24LC16_DEFAULT_ADDRESS, datar, 128);
//      lv_label_set_text(label, datar);      
    }
    return 0;
}
