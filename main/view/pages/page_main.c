#include "gel/pagemanager/page_manager.h"
#include "lvgl/lvgl.h"
#include "model/model.h"
#include "peripherals/keyboard.h"
#include "peripherals/timer.h"
#include "view/common.h"
#include "view/fonts/legacy_fonts.h"
#include "view/images/legacy.h"
#include "view/intl/intl.h"
#include "view/styles.h"
#include "view/view.h"
#include "view/view_types.h"
#include "view/widgets/custom_lv_img.h"
#include <stdio.h>

static struct {
  size_t index;
  view_common_password_t password;
  lv_obj_t *status;

  lv_obj_t *t_count;
  lv_task_t *task;
  
  lv_obj_t *label;
} page_data;

static void *create_page(model_t *model, void *extra) {
   page_data.task = view_common_register_timer(1000);
   return NULL;
}

static void open_page(model_t *model, void *data) {
  view_common_password_reset(&page_data.password, get_millis());

  lv_obj_t *img = custom_lv_img_create(lv_scr_act(), NULL);
  custom_lv_img_set_src(img, &legacy_img_programs);
  lv_obj_align(img, NULL, LV_ALIGN_IN_TOP_LEFT, 0, 0);

  lv_obj_t *lbl = lv_label_create(lv_scr_act(), NULL);
  lv_obj_set_style(lbl, &style_label_8x16);
  lv_label_set_align(lbl, LV_LABEL_ALIGN_CENTER);
  lv_label_set_long_mode(lbl, LV_LABEL_LONG_CROP);
  lv_obj_set_width(lbl, LV_HOR_RES);
  lv_obj_align(lbl, NULL, LV_ALIGN_IN_BOTTOM_MID, 0, 0);

  page_data.status = lbl;
  lv_label_set_text(page_data.status,
                    view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
}

static view_message_t process_page_event(model_t *model, void *arg,
                                         pman_event_t event) {
  view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};

  switch (event.code) {
  case VIEW_EVENT_KEYPAD: {
    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;

    if (event.key_event.event == KEY_CLICK) {
      view_common_password_add_key(&page_data.password, event.key_event.code,
                                   get_millis());
      if (view_common_check_password(&page_data.password, VIEW_PASSWORD_MINUS,
                                     get_millis())) {
        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
        msg.vmsg.page = &page_digin_test;
        break;
      } else if (view_common_check_password(
                     &page_data.password, VIEW_PASSWORD_RIGHT, get_millis())) {
        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
        msg.vmsg.page = &page_parmac;
        break;
      } else if (view_common_check_password(&page_data.password,
                                            VIEW_PASSWORD_LEFT, get_millis())) {
        msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
        msg.vmsg.page = &page_scelta_programma;
        break;
      }
    }

    if (event.key_event.code == BUTTON_STOP_MENU &&
        event.key_event.event == KEY_CLICK) {
      msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_CHANGE_PAGE;
      msg.vmsg.page = &page_info;
    } else if (event.key_event.code == BUTTON_LINGUA &&
               event.key_event.event == KEY_CLICK) {
      model_cambia_lingua(model);
      lv_label_set_text(page_data.status,
                        view_intl_get_string(model, STRINGS_SCELTA_PROGRAMMA));
    } else if (event.key_event.code == BUTTON_PLAY &&
               event.key_event.event == KEY_CLICK) {
      if (model->status.stato == STATO_OFF) {
        msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_STATO_START;
      }
    } else if (event.key_event.code == BUTTON_STOP &&
               event.key_event.event == KEY_CLICK) {
      if (model->status.stato == STATO_ON) {
        msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_STATO_STOP;
      }
    }

    break;
  }
  case VIEW_EVENT_MODEL_UPDATE: {
    msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
    break;
  }

  case VIEW_EVENT_STATO_UPDATE: {
      
    if (model_get_stato(model) == STATO_ON) {
      lv_label_set_text(page_data.status, "STATO ON");
      lv_task_set_prio(page_data.task, LV_TASK_PRIO_MID);
        lv_obj_t *lbltimer = lv_label_create(lv_scr_act(), NULL);
        lv_obj_set_auto_realign(lbltimer, 1);
        lv_obj_align(lbltimer, NULL, LV_ALIGN_IN_TOP_RIGHT, 0, 10);
        page_data.t_count = lbltimer;
    } else if (model_get_stato(model) == STATO_OFF) {
      lv_task_set_prio(page_data.task, LV_TASK_PRIO_OFF);
      lv_task_reset(page_data.task);
      
    }
    break;
  }
  case VIEW_EVENT_TIMER: {
        lv_label_set_text_fmt(page_data.t_count, "%isec", model_get_stato_timer(model));
            break;
        }
  default:
    break;
  }

  return msg;
}

static view_t update_page(model_t *pmodel, void *arg) {
  lv_label_set_text_fmt(page_data.label, "%i", pmodel->pwoff.credito);
  return 0;
}

static void page_destroy(void *data, void *extra) {
    lv_task_del(page_data.task);
}

static void view_close(void *data) {
    (void)data;
    lv_obj_clean(lv_scr_act());
    lv_task_set_prio(page_data.task, LV_TASK_PRIO_OFF);
}

const pman_page_t page_main = {
    .create = create_page,
    .open = open_page,
    .update = update_page,
    .process_event = process_page_event,
    .close = view_close,
    .destroy       = page_destroy,
};