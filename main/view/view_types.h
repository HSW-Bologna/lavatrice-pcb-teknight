#ifndef VIEW_TYPES_H_INCLUDED
#define VIEW_TYPES_H_INCLUDED

#include <stdint.h>
#include "../../components/generic_embedded_libs/gel/keypad/keypad.h"

typedef enum {
    VIEW_PAGE_COMMAND_CODE_NOTHING = 0,
    VIEW_PAGE_COMMAND_CODE_REBASE,
    VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE,
    VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE_EXTRA,
    VIEW_PAGE_COMMAND_CODE_BACK,
    VIEW_PAGE_COMMAND_CODE_UPDATE,
} view_page_command_code_t;

typedef struct {
    view_page_command_code_t code;

    union {
        struct {
            const void *page;
            void *      extra;
        };
    };
} view_page_command_t;


typedef enum {
    VIEW_CONTROLLER_COMMAND_CODE_NOTHING=0,
    VIEW_CONTROLLER_COMMAND_CODE_SKIP_RIGHT,
    VIEW_CONTROLLER_COMMAND_CODE_PADLOCK,
    VIEW_CONTROLLER_COMMAND_CODE_SKIP_LEFT,
    VIEW_CONTROLLER_COMMAND_CODE_MINUS,
    VIEW_CONTROLLER_COMMAND_CODE_PLAY,
    VIEW_CONTROLLER_COMMAND_CODE_PLUS,
    VIEW_CONTROLLER_COMMAND_CODE_GLOBE,
    VIEW_CONTROLLER_COMMAND_CODE_DOC,
    VIEW_CONTROLLER_COMMAND_CODE_STOP
} view_controller_command_code_t;


typedef struct {
    view_controller_command_code_t code;
} view_controller_command_t;


typedef struct {
    view_page_command_t       vmsg;
    view_controller_command_t cmsg;
} view_message_t;

typedef uint8_t view_t;
typedef keypad_update_t view_event_t;

#endif
