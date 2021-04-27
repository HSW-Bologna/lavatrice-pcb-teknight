/*
 * File:   digout.c
 * Author: Virginia
 *
 * Created on 17 aprile 2021, 12.12
 */

#include "peripherals/digout.h"
#include "peripherals/hardwareprofile.h"
#include "peripherals/timer.h"
#include "gel/timer/timecheck.h"
#include "system.h"

static unsigned long ts=0;
static unsigned long time_to_wait=0;
static buzzer_speed_t speed=0;


void digout_init(void) {
    RELE1_TRIS=TRIS_OUTPUT;
    RELE2_TRIS=TRIS_OUTPUT;
    RELE3_TRIS=TRIS_OUTPUT;
    RELE4_TRIS=TRIS_OUTPUT;
    RELE5_TRIS=TRIS_OUTPUT;
    RELE6_TRIS=TRIS_OUTPUT;
    
    BUZZER_TRIS = TRIS_OUTPUT;
}
void rele_set(rele_t rele, int val) {
    val = val > 0;
    switch(rele) {
        case RELE_1 :
            RELE1_LAT=val;
            break;
        case RELE_2 :
            RELE2_LAT=val;
            break;
        case RELE_3 :
            RELE3_LAT=val;
            break;
        case RELE_4 :
            RELE4_LAT=val;
            break;
        case RELE_5 :
            RELE5_LAT=val;
            break;
        case RELE_6 :
            RELE6_LAT=val;
            break;
        default:
            break;
    }
}

void digout_buzzer_bip(buzzer_speed_t s,unsigned long time) {
    time_to_wait=time;
    speed=s;
}

void digout_buzzer_check(void) {
    if (!is_expired(ts, get_millis(), time_to_wait)) {
        BUZZER_LAT = 1;
        __delay_ms(10);
        BUZZER_LAT = 0;
        __delay_ms(speed-10);
        ts=get_millis();
    }
    else {
        BUZZER_LAT=0;
        time_to_wait=0;
        ts=0;
    }
}