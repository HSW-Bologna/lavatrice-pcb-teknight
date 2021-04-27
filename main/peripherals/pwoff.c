/*
 * File:   pwoff.c
 * Author: Virginia
 *
 * Created on 27 aprile 2021, 13.35
 */


#include "xc.h"
#include "hardwareprofile.h"

void pwoff_init(void) {
    INT0_TRIS = 0;
//  IEC0BITS.INT0IE = 1;
//    IFS0BITS.INT0IF = 0;
    // IPC0BITS.INT0IP = 5;
}



void __attribute__((interrupt, auto_psv))  _INT0Interrupt(void) {
   
   // IFS0BITS.INT0IF = 0;
}
