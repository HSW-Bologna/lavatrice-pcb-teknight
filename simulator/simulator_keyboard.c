#include <SDL2/SDL.h>
#include "peripherals/keyboard.h"

const uint8_t *keystates = NULL;

static keypad_key_t keyboard[] = {
    KEYPAD_KEY(0x01, BUTTON_SKIP_RIGHT), KEYPAD_KEY(0x02, BUTTON_PADLOCK),
    KEYPAD_KEY(0x04, BUTTON_SKIP_LEFT),  KEYPAD_KEY(0x8, BUTTON_MINUS),
    KEYPAD_KEY(0x10, BUTTON_PLAY),       KEYPAD_KEY(0x20, BUTTON_PLUS),
    KEYPAD_KEY(0x40, BUTTON_GLOBE),      KEYPAD_KEY(0x80, BUTTON_DOC),
    KEYPAD_KEY(0x100, BUTTON_STOP),      KEYPAD_NULL_KEY,
};

void keyboard_init(void) {
    keystates = SDL_GetKeyboardState(NULL);
}

static unsigned int keyboard_read(void) {
    static unsigned int input = 0;

    SDL_PumpEvents();
    if (keystates[SDL_SCANCODE_1] || keystates[SDL_SCANCODE_KP_1]) {
        input |= 0x100;
    } else {
        input &= ~0x100;
    }
    if (keystates[SDL_SCANCODE_3] || keystates[SDL_SCANCODE_KP_3]) {
        input |= 0x40;
    } else {
        input &= ~0x40;
    }
    if (keystates[SDL_SCANCODE_4] || keystates[SDL_SCANCODE_KP_4]) {
        input |= 0x20;
    } else {
        input &= ~0x20;
    }
    if (keystates[SDL_SCANCODE_5] || keystates[SDL_SCANCODE_KP_5]) {
        input |= 0x10;
    } else {
        input &= ~0x10;
    }
    if (keystates[SDL_SCANCODE_6] || keystates[SDL_SCANCODE_KP_6]) {
        input |= 0x8;
    } else {
        input &= ~0x8;
    }
    if (keystates[SDL_SCANCODE_7] || keystates[SDL_SCANCODE_KP_7]) {
        input |= 0x4;
    } else {
        input &= ~0x4;
    }
    if (keystates[SDL_SCANCODE_9] || keystates[SDL_SCANCODE_KP_9]) {
        input |= 0x1;
    } else {
        input &= ~0x1;
    }

    return input;
}


keypad_update_t keyboard_manage(unsigned long ts) {
    unsigned int keymap = keyboard_read();
    return keypad_routine(keyboard, 40, 1500, 100, ts, keymap);
}
