#include "view/view_types.h"
#include "model/model.h"
#include "controller.h"
#include "pwm.h"


void controller_process_msg(view_controller_command_t *msg, model_t *model) {
    
    switch (msg->code) {
        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM: {
            pwm_set(model->pwm);
            break;
        }
    }
    
}

