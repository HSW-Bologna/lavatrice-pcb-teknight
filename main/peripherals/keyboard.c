/*
 * File:   keypad.c
 * Author: Virginia
 *
 * Created on 17 aprile 2021, 12.38
 */

#include "peripherals/system.h"
#include "peripherals/keyboard.h"
#include "peripherals/hardwareprofile.h"
#include "gel/debounce/debounce.h"

static debounce_filter_t filter;

static keypad_key_t keyboard[] = {
    KEYPAD_KEY(0x01, BUTTON_SKIP_RIGHT),
    KEYPAD_KEY(0x02, BUTTON_PADLOCK),
    KEYPAD_KEY(0x04, BUTTON_SKIP_LEFT),
    KEYPAD_KEY(0x8, BUTTON_MINUS),
    KEYPAD_KEY(0x10, BUTTON_PLAY),
    KEYPAD_KEY(0x20, BUTTON_PLUS),
    KEYPAD_KEY(0x40, BUTTON_GLOBE),
    KEYPAD_KEY(0x80, BUTTON_DOC),
    KEYPAD_KEY(0x100, BUTTON_STOP),
  KEYPAD_NULL_KEY,  
};

void keyboard_init(void) {
    
    KEYBOARD_RIGA1_TRIS=TRIS_OUTPUT;
    KEYBOARD_RIGA2_TRIS=TRIS_OUTPUT;
    KEYBOARD_RIGA3_TRIS=TRIS_OUTPUT;
    KEYBOARD_COL1_TRIS=TRIS_INPUT;
    KEYBOARD_COL2_TRIS=TRIS_INPUT;
    KEYBOARD_COL3_TRIS=TRIS_INPUT;
    
    KEYBOARD_RIGA1_LAT=0;
    KEYBOARD_RIGA2_LAT=0;
    KEYBOARD_RIGA3_LAT=0;
    
    ANSELB=0;
    
    debounce_filter_init(&filter);
   
}

unsigned int keyboard_read(void) {
    
    unsigned int res=0;
    
    KEYBOARD_RIGA1_LAT=1;
    __delay_us(1);
    res |= KEYBOARD_COL1_PORT;
    res |= KEYBOARD_COL2_PORT<<1;
    res |= KEYBOARD_COL3_PORT<<2;
    KEYBOARD_RIGA1_LAT=0;
    
    KEYBOARD_RIGA2_LAT=1;
    __delay_us(1);
    res|=KEYBOARD_COL1_PORT<<3;
    res|=KEYBOARD_COL2_PORT<<4;
    res|=KEYBOARD_COL3_PORT<<5;
    KEYBOARD_RIGA2_LAT=0;
    
    KEYBOARD_RIGA3_LAT=1;
    __delay_us(1);
    res|=KEYBOARD_COL1_PORT<<6;
    res|=KEYBOARD_COL2_PORT<<7;
    res|=KEYBOARD_COL3_PORT<<8;
    KEYBOARD_RIGA3_LAT=0;
    
    return res;
    
}


keypad_update_t keyboard_manage(unsigned long ts) {
    unsigned int input=0;
    
    input|=keyboard_read();
    debounce_filter(&filter, input, 2);
    
    unsigned int keymap = debounce_value(&filter);
    return keypad_routine(keyboard, 40, 1500, 100, ts, keymap);
}
