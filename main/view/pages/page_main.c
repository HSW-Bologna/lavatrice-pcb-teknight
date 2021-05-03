#include "view/view.h"
#include "gel/pagemanager/page_manager.h"
#include "model/model.h"
#include "keyboard.h"


static void *create_page(model_t *model, void *extra) {
    return NULL;
}


static view_message_t process_page_event(model_t *model, void *arg, pman_event_t update){
    view_message_t msg = {.vmsg = {VIEW_PAGE_COMMAND_CODE_NOTHING}};
    
    if (update.event==KEY_CLICK) {
        switch (update.code) {
            case BUTTON_SKIP_RIGHT:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_SKIP_RIGHT;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_PADLOCK:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_PADLOCK;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_SKIP_LEFT:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_SKIP_LEFT;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_MINUS:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_MINUS;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_PLAY:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_PLAY;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_PLUS:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_PLUS;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_GLOBE:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_GLOBE;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_DOC:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_DOC;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
            case BUTTON_STOP:
                msg.cmsg.code = VIEW_CONTROLLER_COMMAND_CODE_STOP;
                msg.vmsg.code = VIEW_PAGE_COMMAND_CODE_UPDATE;
                break;
        }
    }
    return msg;
}

static view_t update_page(model_t *model, void *arg){
    view_t view = 0;
    
    return view;
}

const pman_page_t page_main = {
    .create = create_page,
    .update        = update_page,
    .process_event = process_page_event,
};