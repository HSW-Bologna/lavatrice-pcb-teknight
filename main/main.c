#include "peripherals/system.h"
#include "peripherals/hardwareprofile.h"


int main(void) {
    
    BUZZER_TRIS = TRIS_OUTPUT;

    for(;;) {
        BUZZER_LAT = 1;
        __delay_ms(50);
        BUZZER_LAT = 0;
        __delay_ms(950);
    }

    return 0;
}
