#include "controller.h"

#include "controller/stato.h"
#include "view/view_types.h"
#include "model/model.h"
#include "peripherals/pwm.h"
#include "peripherals/digout.h"
#include "peripherals/led.h"
#include "view/view.h"
#include "peripherals/i2c_devices.h"
#include "peripherals/NT7534.h"
#include "i2c_devices/eeprom/24LC16/24LC16.h"
#include "controller.h"
#include "gel/serializer/serializer.h"
#include "peripherals/pwoff.h"
#include "gel/wearleveling/wearleveling.h"


#define PAR_START_ADDRESS    0
#define PRIVATE_PARS_ADDRESS 128


void controller_process_msg(view_controller_command_t *msg, model_t *pmodel) {
    switch (msg->code) {
        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_PWM: {
            if (msg->pwm_channel == 1) {
                pmodel->pwm1 = msg->value;
            } else if (msg->pwm_channel == 2) {
                pmodel->pwm2 = msg->value;
            }
            if (msg->value == 0) {
                int i = 0;
                for (i = 0; i < 6; i++) {
                    rele_update(i, 0);
                    pmodel->outputs = rele_get_status();
                }
            } else {
                int i = 0;
                for (i = 0; i < 6; i++) {
                    if (i != (msg->output) - 1) {
                        rele_update(i, 0);
                    } else {
                        rele_update(i, 1);
                    }
                }
                pmodel->outputs = rele_get_status();
            }
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_DIGOUT: {
            rele_update(msg->output - 1, msg->value);
            int i = 0;
            for (i = 0; i < 6; i++) {
                if (i != (msg->output) - 1)
                    rele_update(i, 0);
            }
            pmodel->outputs = rele_get_status();

            view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_DIGOUT_TURNOFF: {
            int i = 0;
            for (i = 0; i < 6; i++) {
                rele_update(i, 0);
                pmodel->outputs = rele_get_status();
            }

            view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_PARAMETERS_SAVE: {
            digout_buzzer_stop();
            controller_save_pars(pmodel);
            view_event((view_event_t){.code = VIEW_EVENT_SAVED});
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_RESET_RAM: {
            controller_save_pars(pmodel);
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_LED: {
            led_set_color(msg->led);
            break;
        }

        case VIEW_CONTROLLER_COMMAND_CODE_UPDATE_CONTRAST:
            nt7534_reconfigure(pmodel->hsw.contrasto);
            break;

        case VIEW_CONTROLLER_COMMAND_CODE_PRIVATE_PARAMETERS_SAVE:
            controller_save_private_pars(pmodel);
            break;

        case VIEW_CONTROLLER_COMMAND_CODE_NOTHING:
            break;
    }
}


void controller_init(model_t *pmodel) {
    nt7534_reconfigure(pmodel->hsw.contrasto);
    view_change_page(pmodel, &page_main);
}


void controller_save_pars(model_t *pmodel) {
    uint8_t data[PARS_SERIALIZED_SIZE] = {0};
    size_t  i                          = 0;     // model_pars_serialize(pmodel, data);
    EE24LC16_SEQUENTIAL_WRITE(eeprom_driver, PAR_START_ADDRESS, data, i);
}


void controller_save_private_pars(model_t *pmodel) {
    uint8_t data[PRIVATE_PARS_SERIALIZED_SIZE] = {0};
    size_t  i                                  = 0;     // model_private_parameters_serialize(pmodel, data);
    EE24LC16_SEQUENTIAL_WRITE(eeprom_driver, PRIVATE_PARS_ADDRESS, data, i);
}
