/*
 * File:   digout.c
 * Author: Virginia
 *
 * Created on 17 aprile 2021, 12.12
 */

#include "digout.h"
#include "peripherals/hardwareprofile.h"
#include "peripherals/timer.h"
#include "gel/timer/timecheck.h"
#include "system.h"

static unsigned long time_on=0;
static unsigned long time_off=0;
static size_t repeat=0;
static int is_set=0;
static unsigned long ts=0;


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


void digout_buzzer_bip(size_t r, unsigned long t_on, unsigned long t_off) {
    repeat = r;
    time_on = t_on;
    time_off = t_off;
    is_set = 1;
    BUZZER_LAT = 1;
    ts = get_millis();
}


void digout_buzzer_check(void) {
    if (is_set && repeat>0) {
        if ((is_expired(ts, get_millis(), time_on)) && BUZZER_LAT) {
            BUZZER_LAT=!BUZZER_LAT;
            ts=get_millis();
            repeat--;
        } else if ((is_expired(ts, get_millis(), time_off)) && !BUZZER_LAT) {
            BUZZER_LAT=!BUZZER_LAT; 
            ts=get_millis();
        }
    }
    
    if (is_set && repeat==0) {
        is_set=0;
        ts=0;
        BUZZER_LAT=0;
    }
    
}
