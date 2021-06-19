#include "styles.h"
#include "fonts/legacy_fonts.h"

lv_style_t style_label_8x16;

void styles_init(void) {
    lv_style_copy(&style_label_8x16, &lv_style_plain);
    style_label_8x16.text.font = &hsw_8x16_font;
}