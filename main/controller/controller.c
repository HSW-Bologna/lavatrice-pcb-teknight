#include "view/view_types.h"
#include "model/model.h"
#include "controller.h"
#include "peripherals/pwm.h"
#include "peripherals/digout.h"
#include "view/view.h"


void controller_process_msg(view_controller_command_t *msg, model_t *pmodel) {
    switch (msg->code) {
        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM: {
            pwm_set(pmodel->pwm);
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_DIGOUT: {
            if (msg->output>0) {
                rele_set(msg->output-1, msg->value);
                pmodel->outputs=rele_get_status();
            }
            if (msg->output==0) {
                
            }
            
            view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});
            break;
        }
        
        case VIEW_CONTROLLER_COMMAND_CODE_NOTHING:
            break;
    }
}
