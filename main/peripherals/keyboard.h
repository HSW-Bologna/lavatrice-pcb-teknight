
#ifndef KEYBOARD_H_INCLUDED
#define KEYBOARD_H_INCLUDED

#include <stdint.h>
#include "gel/keypad/keypad.h"

typedef enum
{
    BUTTON_NONE = 0,
    BUTTON_SKIP_RIGHT,
    BUTTON_MEDIO = 1,
    BUTTON_PADLOCK,
    BUTTON_SKIP_LEFT,
    BUTTON_CALDO = 3,
    BUTTON_MINUS,
    BUTTON_FREDDO = 4,
    BUTTON_PLAY,
    BUTTON_LANA = 5,
    BUTTON_PLUS,
    BUTTON_TIEPIDO = 6,
    BUTTON_LINGUA,
    BUTTON_MENU,
    BUTTON_STOP,
    BUTTON_STOP_MENU, // 10
    BUTTON_STOP_MINUS, // 11
    BUTTON_STOP_FREDDO = 11, // 10
} button_t;

void            keyboard_init(void);
keypad_update_t keyboard_manage(unsigned long ts);
void            keyboard_reset(void);

#endif
