#include "common.h"

#include "gel/timer/timecheck.h"


static void timer_task(lv_task_t * task);


lv_obj_t *view_common_title(lv_obj_t *root, char *str) {
    lv_obj_t *cont = lv_cont_create(root, NULL);

    static lv_style_t style;
    lv_style_copy(&style, lv_obj_get_style(cont));
    style.body.border.part    = LV_BORDER_BOTTOM | LV_BORDER_TOP;
    style.body.border.width   = 1;
    style.body.border.color   = LV_COLOR_BLACK;
    style.body.padding.inner  = 0;
    style.body.padding.top    = 2;
    style.body.padding.bottom = 2;
    lv_obj_set_style(cont, &style);

    lv_obj_t *title = lv_label_create(cont, NULL);
    lv_label_set_align(title, LV_LABEL_ALIGN_LEFT);
    lv_label_set_long_mode(title, LV_LABEL_LONG_CROP);
    lv_label_set_text(title, str);
    lv_obj_set_width(title, LV_HOR_RES_MAX - 4);

    lv_cont_set_fit2(cont, LV_FIT_NONE, LV_FIT_TIGHT);
    lv_obj_set_width(cont, LV_HOR_RES_MAX - 4);
    lv_obj_align(cont, NULL, LV_ALIGN_IN_TOP_MID, 0, 2);
    lv_obj_align(title, NULL, LV_ALIGN_CENTER, 0, 0);

    return title;
}


void view_common_password_add_key(view_common_password_t *inserted, button_t new, unsigned long timestamp) {
    if (is_expired(inserted->last_timestamp, timestamp, VIEW_PASSWORD_TIMEOUT)) {
        view_common_password_reset(inserted, timestamp);
    }
    inserted->password[inserted->index] = new;
    inserted->index                     = (inserted->index + 1) % VIEW_PASSWORD_SIZE;
    inserted->last_timestamp            = timestamp;
}


void view_common_password_reset(view_common_password_t *inserted, unsigned long timestamp) {
    size_t i = 0;
    for (i = 0; i < VIEW_PASSWORD_SIZE; i++) {
        inserted->password[i] = BUTTON_NONE;
    }
    inserted->index          = 0;
    inserted->last_timestamp = timestamp;
}


int view_common_check_password(view_common_password_t *inserted, button_t password[static VIEW_PASSWORD_SIZE],
                               unsigned long timestamp) {
    if (is_expired(inserted->last_timestamp, timestamp, VIEW_PASSWORD_TIMEOUT)) {
        view_common_password_reset(inserted, timestamp);
        return 0;
    }

    size_t i = 0;
    for (i = 0; i < VIEW_PASSWORD_SIZE; i++) {
        if (inserted->password[(inserted->index + i) % VIEW_PASSWORD_SIZE] != password[i]) {
            return 0;
        }
    }
    return 1;
}


lv_task_t *view_common_register_timer(unsigned long period) {
    return lv_task_create(timer_task, period, LV_TASK_PRIO_OFF, NULL);
}


static void timer_task(lv_task_t * task) {
    (void)task;
    view_event((view_event_t) {.code=VIEW_EVENT_TIMER});
}