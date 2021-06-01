#ifndef VIEW_COMMON_H_INCLUDED
#define VIEW_COMMON_H_INCLUDED

#include "view.h"
#include "peripherals/keyboard.h"


#define VIEW_PASSWORD_TIMEOUT 4000UL
#define VIEW_PASSWORD_SIZE    5
#define VIEW_PASSWORD_MINUS                                                                                            \
    ((button_t[VIEW_PASSWORD_SIZE]){BUTTON_STOP, BUTTON_STOP, BUTTON_STOP, BUTTON_MINUS, BUTTON_MINUS})

typedef struct {
    button_t      password[VIEW_PASSWORD_SIZE];
    size_t        index;
    unsigned long last_timestamp;
} view_common_password_t;


lv_obj_t *view_common_title(lv_obj_t *root, char *str);
void      view_common_password_add_key(view_common_password_t *inserted, button_t new, unsigned long timestamp);
int       view_common_check_password(view_common_password_t *inserted, button_t password[static VIEW_PASSWORD_SIZE],
                                     unsigned long timestamp);
void      view_common_password_reset(view_common_password_t *password, unsigned long timestamp);

#endif