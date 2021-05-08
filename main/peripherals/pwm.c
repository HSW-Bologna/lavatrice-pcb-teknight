#include "hardwareprofile.h"


void pwm_init(void) {
    // Set MCCP operating mode
    CCP1CON1Lbits.CCSEL = 0;         // Set MCCP operating mode (OC mode)
    CCP1CON1Lbits.MOD = 0b0101;      // Set mode (Buffered Dual-Compare/PWM mode)
    
    //Configure MCCP Timebase
    CCP1CON1Lbits.T32 = 0;           // Set timebase width (16-bit)
    CCP1CON1Lbits.TMRSYNC = 0;       // Set timebase synchronization (Synchronized)
    CCP1CON1Lbits.CLKSEL = 0b000;    // Set the clock source (Tcy)
    CCP1CON1Lbits.TMRPS = 0b00;      // Set the clock pre-scaler (1:1)
    CCP1CON1Hbits.TRIGEN = 0;        // Set Sync/Triggered mode (Synchronous)
    CCP1CON1Hbits.SYNC = 0b00000;    // Select Sync/Trigger source (Self-sync)
    
    //Configure MCCP output for PWM signal
    CCP1CON2Hbits.OCFEN = 1;          // Enable desired output signals (OC1F)
    //CCP1CON2Hbits.OCEEN = 1;          // Enable desired output signals (OC1F)

    CCP1CON3Hbits.OUTM = 0b000;       // Set advanced output modes (Standard output)
    CCP1CON3Hbits.POLACE = 0;         // Configure output polarity (Active High)
    CCP1TMRL = 0x0000;                // Initialize timer prior to enable module.
    CCP1PRL = 0xFFFF;                 // Configure timebase period 
    CCP1RA = 0x0000;                  // Set the rising edge compare value
    CCP1RB = 0x6000;                  // Set the falling edge compare value
    CCP1CON1Lbits.CCPON = 1;          // Turn on MCCP module
    
//    #define  PPSUnLock                   __builtin_write_OSCCONL(OSCCON & 0xbf) 
//    #define  PPSLock                     __builtin_write_OSCCONL(OSCCON | 0x40)
//
//    PPSUnLock;
//    RPOR2bits.RP5R = 16;
//    PPSLock;
//    
//    // Set MCCP operating mode
//    CCP2CON1Lbits.CCSEL = 0;         // Set MCCP operating mode (OC mode)
//    CCP2CON1Lbits.MOD = 0b0101;      // Set mode (Buffered Dual-Compare/PWM mode)
//    
//    //Configure MCCP Timebase
//    CCP2CON1Lbits.T32 = 0;           // Set timebase width (16-bit)
//    CCP2CON1Lbits.TMRSYNC = 0;       // Set timebase synchronization (Synchronized)
//    CCP2CON1Lbits.CLKSEL = 0b000;    // Set the clock source (Tcy)
//    CCP2CON1Lbits.TMRPS = 0b00;      // Set the clock pre-scaler (1:1)
//    CCP2CON1Hbits.TRIGEN = 0;        // Set Sync/Triggered mode (Synchronous)
//    CCP2CON1Hbits.SYNC = 0b00000;    // Select Sync/Trigger source (Self-sync)
//    
//    //Configure MCCP output for PWM signal
//    CCP2CON2Hbits.OCAEN = 1;          // Enable desired output signals (OC1F)
//    CCP2CON3Hbits.OUTM = 0b000;       // Set advanced output modes (Standard output)
//    CCP2CON3Hbits.POLACE = 0;         // Configure output polarity (Active High)
//    CCP2TMRL = 0x0000;                // Initialize timer prior to enable module.
//    CCP2PRL = 0xFFFF;                 // Configure timebase period 
//    CCP2RA = 0x0000;                  // Set the rising edge compare value
//    CCP2RB = 0x6000;                  // Set the falling edge compare value
//    CCP2CON1Lbits.CCPON = 1;          // Turn on MCCP module
}