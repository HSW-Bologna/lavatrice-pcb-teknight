#ifndef VIEW_COMMON_H_INCLUDED
#define VIEW_COMMON_H_INCLUDED

#include "view.h"
#include "peripherals/keyboard.h"


#define VIEW_PASSWORD_TIMEOUT   4000UL
#define VIEW_PASSWORD_MAX_SIZE  5
#define VIEW_PASSWORD_MINUS     ((button_t[]){BUTTON_MINUS, BUTTON_MINUS})
#define VIEW_PASSWORD_PLUS      ((button_t[]){BUTTON_PLUS, BUTTON_PLUS})
#define VIEW_PASSWORD_RIGHT     ((button_t[]){BUTTON_SKIP_RIGHT, BUTTON_SKIP_RIGHT})
#define VIEW_PASSWORD_LEFT      ((button_t[]){BUTTON_SKIP_LEFT, BUTTON_SKIP_LEFT})
#define VIEW_SHORT_PASSWORD_LEN 2

typedef struct {
    button_t      password[VIEW_PASSWORD_MAX_SIZE];
    size_t        index;
    unsigned long last_timestamp;
} view_common_password_t;


lv_obj_t * view_common_title(lv_obj_t *root, const char *str);
void       view_common_password_add_key(view_common_password_t *inserted, button_t new, unsigned long timestamp);
int        view_common_check_password(view_common_password_t *inserted, button_t *password, size_t length,
                                      unsigned long timestamp);
void       view_common_password_reset(view_common_password_t *password, unsigned long timestamp);
lv_task_t *view_common_register_timer(unsigned long period);
int        view_common_check_password_started(view_common_password_t *inserted);
void *     view_common_malloc_page_data(size_t size);

#endif