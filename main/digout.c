/*
 * File:   digout.c
 * Author: Virginia
 *
 * Created on 17 aprile 2021, 12.12
 */

#include "peripherals/digout.h"
#include "peripherals/hardwareprofile.h"

void digout_init(void) {
    RELE1_TRIS=TRIS_OUTPUT;
    RELE2_TRIS=TRIS_OUTPUT;
    RELE3_TRIS=TRIS_OUTPUT;
    RELE4_TRIS=TRIS_OUTPUT;
    RELE5_TRIS=TRIS_OUTPUT;
    RELE6_TRIS=TRIS_OUTPUT;
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