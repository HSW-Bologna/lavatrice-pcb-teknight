/*
 * File:   keypad.c
 * Author: Virginia
 *
 * Created on 17 aprile 2021, 12.38
 */

#include "peripherals/system.h"
#include "peripherals/keyboard.h"
#include "peripherals/hardwareprofile.h"

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
   
}

uint16_t keyboard_read(void) {
    
    uint16_t res=0;
    
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