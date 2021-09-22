/******************************************************************************/
/*                                                                            */
/*      H   H      SSSS     W   W                                             */
/*      H   H     S         W   W                                             */
/*      HHHHH      SSS      W   W                                             */
/*      H   H         S     W W W                                             */
/*      H   H  *  SSSS   *   W W   *  snc                                     */
/*                                                                            */
/*      *********************************                                     */
/*                                                                            */
/*  HSW snc - Casalecchio di Reno (BO) ITALY                                  */
/*  ----------------------------------------                                  */
/*                                                                            */
/*  programma:  Essicatoio Paperoga (Versione ridotta della MiniEco)          */
/*                                                                            */
/*  cliente:    MS GROUP - Settimo Milanese (MI)                              */
/*                                                                            */
/*  ver. 00.0:  05/05/2021  dalla da MiniEco V:17.4   D:11/04/2021            */
/*                                                                            */
/*  ver. att.:  05/08/2021  00.1                                              */
/*                                                                            */
/*  BY:         Maldus (Mattia MALDINI) & Virginia NEGRI & Massimo ZANNA      */
/*                                                                            */
/*  NNB:        SENSO DEGLI INGRESSI: DRITTO                                  */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  micro:      MicroChip PIC PIC24FJ256GA705 - 32MHz                         */
/*              xxxK Flash - xxK Auxiliary Flash - xxxxxxb Ram                */
/*              xxxxxxxxb ?xxxxxxxx b ?            xxxxxxxb                   */
/*                                                                            */
/* ************************************************************************** */

//                                  12345678901234567890
const unsigned char versione_prg[] = "V:00.1  D:05/08/2021";



/* ************************************************************************** */
/*                                                                            */
/*  PASSWORD                                                                  */
/*  --------                                                                  */
/*                                                                            */
/*                                                                            */
/*============================================================================*/
/*                                                                            */
/*                                                                            */
/*                                                                            */
/* ************************************************************************** */



/******************************************************************************/
/*                                                                            */
/*  rev.:       05/05/2021 (00.0)                                             */
/*                                                                            */
/*      - versione di partenza dalla MiniEco V:17.4   D:11/04/2021            */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       04/08/2021 (01.1)                                             */
/*                                                                            */
/*      - xxxxxx                                                              */
/*                                                                            */
/******************************************************************************/



#include "peripherals/system.h"
#include "peripherals/hardwareprofile.h"
#include "lvgl/lvgl.h"
#include "peripherals/NT7534.h"
#include "peripherals/digout.h"
#include "peripherals/spi.h"
#include "peripherals/temperature.h"
#include "peripherals/keyboard.h"
#include "peripherals/digin.h"
#include "peripherals/ptc.h"
#include "peripherals/i2c_devices.h"
#include "i2c_ports/PIC/i2c_driver.h"
#include "i2c_ports/PIC/i2c_bitbang.h"
#include "i2c_common/i2c_common.h"
#include "peripherals/timer.h"
#include "gel/timer/timecheck.h"
#include "model/model.h"
#include "view/view.h"
#include "controller/gui.h"
#include "pwoff.h"
#include "gettoniera.h"
#include "peripherals/pwm.h"
#include "uart_driver.h"
#include "controller/modbus_server.h"
#include "controller/controller.h"
#include "controller/stato.h"

#include "peripherals/led.h"

#include "controller/gt_allarmi.h"
#include "controller/ciclo.h"

#include "controller/gt_cesto.h"
#include "controller/gt_macchina_occupata.h"
#include "controller/gt_ventilazione.h"

static model_t model;



int main(void) {
    unsigned long tskp = 0, ts_input = 0, ts_temperature = 0, ts_spi = 0;

    // inizializzazioni
    system_init();

    spi_init();
    nt7534_init();
    digout_init();
    led_init();
    keyboard_init();

    i2c_bitbang_init(5);
    digin_init();
    timer_init();
    ptc_init();
    pwoff_init();
    pwm_init();
    gettoniera_init();
    uart_init();
    modbus_server_init();

    model_init(&model);
    controller_init(&model);
    view_init(&model, nt7534_flush, nt7534_rounder, nt7534_set_px, keyboard_reset);
    digout_buzzer_bip(2, 100, 100);

    for (;;) {
        controller_manage_gui(&model);
        modbus_server_manage();

        gt_allarmi(&model);

        gt_ciclo(&model, get_millis());

        gt_cesto(&model, get_millis());
        gt_macchina_occupata(&model);
        gt_ventilazione(&model, get_millis());

        ClrWdt();

        if (is_expired(ts_input, get_millis(), 2)) {
            if (digin_take_reading()) {
                view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});

                model.inputs = digin_get_inputs();
            }

            if (gettoniera_take_insert()) {
                if (model_is_in_test(&model)) {
                    view_event((view_event_t){.code = VIEW_EVENT_COIN, .coins = gettoniera_get_count()});
                } else {
                    view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});
                    model.pwoff.credito += gettoniera_get_count();
                    controller_update_pwoff(&model);
                }
                gettoniera_reset_count();
            }
            ts_input = get_millis();
        }

        if (is_expired(tskp, get_millis(), 5)) {
            keypad_update_t update = keyboard_manage(get_millis());

            if (update.event != KEY_NOTHING) {
                view_event((view_event_t){.code = VIEW_EVENT_KEYPAD, .key_event = update});
            }
            tskp = get_millis();
        }

        if (is_expired(ts_temperature, get_millis(), 50)) {
            ptc_read_temperature();
            view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});

            model.ptc_adc         = ptc_get_adc_value();
            model.ptc_temperature = ptc_get_temperature();
            ts_temperature        = get_millis();
        }

        if (is_expired(ts_spi, get_millis(), 500)) {
            uint16_t temp, hum;

            if (temperature_read(&temp, &hum) == 0) {
                model.sht_temperature = temp;
                model.sht_umidity     = hum / 100;
            }
            ts_spi = get_millis();
        }

        if (timer_second_passed()) {
            model_add_second(&model);
            controller_update_pwoff(&model);
        }

        // controllo buzzer
        digout_buzzer_check();

        __delay_us(10);
    }
    return 0;
}
