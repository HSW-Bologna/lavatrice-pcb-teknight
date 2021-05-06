#include <SDL2/SDL.h>
#include "peripherals/keyboard.h"

static keypad_key_t keyboard[] = {
    KEYPAD_KEY(0x01, BUTTON_SKIP_RIGHT), KEYPAD_KEY(0x02, BUTTON_PADLOCK),
    KEYPAD_KEY(0x04, BUTTON_SKIP_LEFT),  KEYPAD_KEY(0x8, BUTTON_MINUS),
    KEYPAD_KEY(0x10, BUTTON_PLAY),       KEYPAD_KEY(0x20, BUTTON_PLUS),
    KEYPAD_KEY(0x40, BUTTON_GLOBE),      KEYPAD_KEY(0x80, BUTTON_DOC),
    KEYPAD_KEY(0x100, BUTTON_STOP),      KEYPAD_NULL_KEY,
};

void keyboard_init(void) {}

static unsigned int keyboard_read(void) {
    static unsigned int input = 0;

    SDL_Event event;
    /* Poll for events. SDL_PollEvent() returns 0 when there are no  */
    /* more events on the event queue, our while loop will exit when */
    /* that occurs.                                                  */
    while (SDL_PollEvent(&event)) {
        /* We are only worried about SDL_KEYDOWN and SDL_KEYUP events */
        switch (event.key.keysym.scancode) {
            case SDL_SCANCODE_1:
            case SDL_SCANCODE_KP_1:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x100;
                } else {
                    input &= ~0x100;
                }
                break;
            case SDL_SCANCODE_2:
            case SDL_SCANCODE_KP_2:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x02;
                } else {
                    input &= ~0x02;
                }
                break;
            case SDL_SCANCODE_3:
            case SDL_SCANCODE_KP_3:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x40;
                } else {
                    input &= ~0x40;
                }
                break;
            case SDL_SCANCODE_4:
            case SDL_SCANCODE_KP_4:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x20;
                } else {
                    input &= ~0x20;
                }
                break;
            case SDL_SCANCODE_5:
            case SDL_SCANCODE_KP_5:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x10;
                } else {
                    input &= ~0x10;
                }
                break;
            case SDL_SCANCODE_6:
            case SDL_SCANCODE_KP_6:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x8;
                } else {
                    input &= ~0x8;
                }
                break;
            case SDL_SCANCODE_7:
            case SDL_SCANCODE_KP_7:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x4;
                } else {
                    input &= ~0x4;
                }
                break;
            case SDL_SCANCODE_9:
            case SDL_SCANCODE_KP_9:
                if (event.type == SDL_KEYDOWN) {
                    input |= 0x1;
                } else {
                    input &= ~0x1;
                }
                break;

            default:
                break;
        }
    }

    return input;
}


keypad_update_t keyboard_manage(unsigned long ts) {
    unsigned int keymap = keyboard_read();
    return keypad_routine(keyboard, 40, 1500, 100, ts, keymap);
}
