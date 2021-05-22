
#ifndef KEYBOARD_H_INCLUDED
#define KEYBOARD_H_INCLUDED

#include <stdint.h>
#include "gel/keypad/keypad.h"

typedef enum {
    BUTTON_NONE = 0,
    BUTTON_SKIP_RIGHT,
    BUTTON_PADLOCK,
    BUTTON_SKIP_LEFT,
    BUTTON_MINUS,
    BUTTON_PLAY,
    BUTTON_PLUS,
    BUTTON_LINGUA,
    BUTTON_MENU,
    BUTTON_STOP,
} button_t;

void            keyboard_init(void);
keypad_update_t keyboard_manage(unsigned long ts);

#endif
