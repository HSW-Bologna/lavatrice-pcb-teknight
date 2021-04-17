#include "peripherals/system.h"
#include "peripherals/hardwareprofile.h"
#include "lvgl/lvgl.h"
#include "peripherals/NT7534.h"
#include "peripherals/digout.h"
#include "peripherals/spi.h"
#include "peripherals/temperature.h"
#include "peripherals/keyboard.h"


int main(void) {
    
    BUZZER_TRIS = TRIS_OUTPUT;
    spi_init();
    nt7534_init();
    lv_init();
    digout_init();
    temperature_init();
    keyboard_init();
        
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
            
//        uint8_t buffer[128]={0};
//        __delay_ms(500);
//        memset(buffer,0xaa,128);
//        nt7534_sync(buffer,10,10,20,20);
        lv_task_handler();
        __delay_ms(50);
        lv_tick_inc(50);
        
//        uint16_t t, h;
//        int x= spi_read_temperature(&t,&h);
//        lv_label_set_text_fmt(label, "%i %i %i", x, t, h);
            
        uint16_t map;
        map=keyboard_read();
        lv_label_set_text_fmt(label, "0x%03X", map);
//        BUZZER_LAT = 1;
//        __delay_ms(10);
//        BUZZER_LAT = 0;
//        __delay_ms(990);
       
        
//        rele_set(RELE_1, 1);
//        rele_set(RELE_2, 1);
//        rele_set(RELE_3, 1);
//        rele_set(RELE_4, 1);
//        rele_set(RELE_5, 1);
//        rele_set(RELE_6, 1);
//        __delay_ms(1000);
//        rele_set(RELE_1, 0);
//        rele_set(RELE_2, 0);
//        rele_set(RELE_3, 0);
//        rele_set(RELE_4, 0);
//        rele_set(RELE_5, 0);
//        rele_set(RELE_6, 0);
    }
   
    return 0;
}
