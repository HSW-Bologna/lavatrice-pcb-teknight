#include <stdlib.h>

#include "gel/collections/queue.h"

#include "model/model.h"
#include "view/view.h"


QUEUE_DECLARATION(event_queue, view_event_t, 8);
QUEUE_DEFINITION(event_queue, view_event_t);
static struct event_queue q;


static page_manager_t pman;


view_t view_init(model_t *model, void (*flush_cb)(struct _disp_drv_t *, const lv_area_t *, lv_color_t *),
                void (*rounder_cb)(struct _disp_drv_t *, lv_area_t *),
                void (*set_px_cb)(struct _disp_drv_t *, uint8_t *, lv_coord_t, lv_coord_t, lv_coord_t, lv_color_t, lv_opa_t)
        ) {
    static lv_disp_buf_t disp_buf;
    static uint8_t gbuf[256];
    lv_disp_buf_init(&disp_buf, gbuf, NULL, 2048 );
    lv_disp_drv_t disp_drv;
    lv_disp_drv_init(&disp_drv);
    disp_drv.buffer=&disp_buf;
    disp_drv.flush_cb=flush_cb;
    disp_drv.set_px_cb=set_px_cb;
    disp_drv.rounder_cb=rounder_cb;
    lv_disp_drv_register(&disp_drv);
    
    lv_theme_t *th = lv_theme_mono_init(0,&hsw_8x8_font);
    lv_theme_set_current(th);
    
    pman_init(&pman);
    event_queue_init(&q);
    return view_change_page(model, &page_main);
}


view_t view_change_page_extra(model_t *model, const pman_page_t *page, void *extra) {
    event_queue_init(&q);     // Butta tutti gli eventi precedenti quando cambi la pagina
    return pman_change_page_extra(&pman, model, *page, extra);
}


view_t view_change_page(model_t *model, const pman_page_t *page) {
   return view_change_page_extra(model, page, NULL);
}


view_t view_rebase_page(model_t *model, const pman_page_t *page) {
    event_queue_init(&q);
    return pman_rebase_page(&pman, model, *(pman_page_t *)page);
}


int view_get_next_msg(model_t *model, view_message_t *msg, view_event_t *eventcopy) {
    view_event_t event;
    int          found = 0;

    if (!event_queue_is_empty(&q)) {
        event_queue_dequeue(&q, &event);
        found = 1;
    }

    if (found) {
        *msg = pman.current_page.process_event(model, pman.current_page.data, event);
        if (eventcopy)
            *eventcopy = event;
    }

    return found;
}


int view_process_msg(view_page_command_t vmsg, model_t *model) {
    if (vmsg.code == VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE) {
        view_change_page(model, vmsg.page);
    } else if (vmsg.code == VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE_EXTRA) {
        view_change_page_extra(model, vmsg.page, vmsg.extra);
    } else if (vmsg.code == VIEW_PAGE_COMMAND_CODE_BACK) {
        pman_back(&pman, model);
        event_queue_init(&q);
       // view_event((view_event_t){.code = VIEW_EVENT_CODE_OPEN});
    } else if (vmsg.code == VIEW_PAGE_COMMAND_CODE_REBASE) {
        view_rebase_page(model, vmsg.page);
    } else if (vmsg.code == VIEW_PAGE_COMMAND_CODE_UPDATE) {
        pman_page_update(&pman, model);
        return 1;
    }
    return 0;
}


void view_event(view_event_t event) {
    event_queue_enqueue(&q, &event);
}



void view_close_all(void *data) {
    (void)data;
    lv_obj_clean(lv_scr_act());
}