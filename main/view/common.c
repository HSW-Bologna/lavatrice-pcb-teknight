#include "common.h"


void view_common_title(lv_obj_t *root, char *str) {
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
    lv_label_set_align(title,LV_LABEL_ALIGN_CENTER);
    lv_label_set_long_mode(title, LV_LABEL_LONG_CROP);
    lv_label_set_text(title, str);
    lv_obj_set_width(title, LV_HOR_RES_MAX - 4);

    lv_cont_set_fit2(cont, LV_FIT_NONE, LV_FIT_TIGHT);
    lv_obj_set_width(cont, LV_HOR_RES_MAX - 4);
    lv_obj_align(cont, NULL, LV_ALIGN_IN_TOP_MID, 0, 2);
    lv_obj_align(title, NULL, LV_ALIGN_CENTER, 0, 0);
}