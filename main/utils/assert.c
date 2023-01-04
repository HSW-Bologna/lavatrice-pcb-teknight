#ifndef PC_SIMULATOR
#include "hardwareprofile.h"

void assert(int expr) {
    if (!expr) {
        volatile int loop = 1;
        __builtin_software_breakpoint();
        while(loop) {
            Nop();
        }
    }
}

#endif
