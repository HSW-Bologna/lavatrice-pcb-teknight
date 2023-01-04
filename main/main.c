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
/*  ver. att.:  03/01/2023  02.4                                              */
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

//                                    12345678901234567890
const unsigned char versione_prg[] = "V:02.4  D:03/01/2023";



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
/*  rev.:       04/08/2021 (00.1)                                             */
/*                                                                            */
/*      - prima versione con interfaccia quasi completa e gestione completa   */
/*        di tutte le periferiche presenti sulla scheda                       */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       06/10/2021 (00.2)                                             */
/*                                                                            */
/*      - prima versione con interfaccia quasi completa e gestione completa   */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       22/11/2021 (00.3)                                             */
/*                                                                            */
/*      - implementazione ciclo                                               */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       21/12/2021 (00.4) (a MI con PRIMO PROTOTIPO e Flavio)         */
/*                                                                            */
/*      - migliorata gestione velocita' ventilazione come originaria          */
/*      - rigestito MENU OPERATORE                                            */
/*      - migliorate visualizzazioni                                          */
/*      - corretti alcuni errori rilevati alla 'prima accensione'             */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       27/01/2022 (00.5)                                             */
/*                                                                            */
/*      - migliorata gestione riscaldamento                                   */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       15/02/2022 (00.6)                                             */
/*                                                                            */
/*      - modifiche dopo test con Danilo                                      */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       24/02/2022 (01.0)                                             */
/*                                                                            */
/*      - ultima release mandata a Milano (200 schede)                        */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       19/04/2022 (01.1)                                             */
/*                                                                            */
/*      - corretto errore GT EMERGENZA (lo faceva solo in MARCIA)             */
/*      - modificato ordine GT ALLARMI (RAM,EME,INV,FIL,OBL)                  */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       19/04/2022 (01.2)                                             */
/*                                                                            */
/*      - aggiunti valori STD in PAR CIC  OFFSET TH/TL e RH RES               */
/*      - corretto errore GT INPUT PAGAMENTO ( GETTONE1 ) da IN5 a IN3        */
/*      - in "PAGINA CONTRASTO" con [ MEUNU ] set contrasto base; 26          */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       04/05/2022 (01.3)                                             */
/*                                                                            */
/*      - messa a posto tabella PAR CIC "uint8_t valori[NUM_CICLI][17]"       */
/*      - corretto errore GT PAR MAC "abilita_stop_tempo_ciclo"               */
/*      - messo a 1 senso INPUT di EMERGENZA, ALL MOTORE e FILTRO APERTO      */
/*      - messo a 0 "pmac.abilita_stop_tempo_ciclo" in macchine SELF e OPL    */
/*      - messo a posto visualizzazione tempo da fermo (0) senza gettoniera   */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       06/05/2022 (01.4)                                             */
/*                                                                            */
/*      - rivista GT modelli GAS                                              */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       19/05/2022 (01.5)                                             */
/*                                                                            */
/*      - rivista GT prorgrammazione                                          */
/*      - creata ventilazione con apertura oblo                               */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       30/05/2022 (01.6)                                             */
/*                                                                            */
/*      - corretto errore scambio OUT 6 con 4 (digout.h in una "dir temp"!!!) */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       12/07/2022 (01.7)                                             */
/*                                                                            */
/*      - riscambiati in "digout.h" OUT 4 con OUT 6 (per recupero v 01.5 !!!) */
/*      - corretta "somma di tempi" con macchina IN MARCIA in "model.c"       */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       20/07/2022 (01.8)                                             */
/*                                                                            */
/*      - gestita sonda T/RH per asciugatura AUTO con "DRY CONTROL"           */
/*      - mod.limiti 'temperatura_sicurezza_1': ora 1-130 D=130 ( ROTTA 140)  */
/*      - messo DEF a  0 PAR MAC "pmac.allarme_inverter_na_nc"                */
/*      - messo DEF a 30 PAR MAC "pmac.tempo_uscita_pagine"                   */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       21/10/2022 (01.9)                                             */
/*                                                                            */
/*      - migliorata gestione DEBOUNCE IN gettoniera/cassa (prima con impulsi */
/*        con PERIODO di 100ms dt/50% perdeva 1 su 3 GETT: ora arrivo a 80/75 */
/*                                                                            */
/*      - corretto errore in CICLO: ora aggiungendo credito in RAFFREDDAMENTO */
/*        si ripassa in ASCIUGATURA con stessa TEMPERATURA e TEMPO NUOVO      */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       26/10/2022 (02.0)                                             */
/*                                                                            */
/*      - portata gestione DIGIN (INPUT, GETTONI/CASSA, IN MONETE) in INT ms, */
/*        => testati TUTTI IN con impulso di 20ms con 40ms PERIODO dt 50%     */
/*                                                                            */
/*      - provato a correggere errore in marcia che non faceva partire venti- */
/*        lazione forzata se impostata != 0                                   */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       07/11/2022 (02.1)                                             */
/*                                                                            */
/*      - corretto errore in RAFFREDDAMENTO che non faceva ripartire il moto  */
/*        cesto dopo aver aperto oblo' e ridato START (in "gt_cesto")         */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       24/11/2022 (02.2)                                             */
/*                                                                            */
/*      - corretto errore in inserimento monete con gettoniera in moto        */
/*      - aggiunte 2 lingue (F, D) solo "MESSAGGI" non "PAR MAC"              */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       24/11/2022 (02.3)                                             */
/*                                                                            */
/*      - Server modbus                                                       */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/*                                                                            */
/*  rev.:       03/01/2023 (02.4)                                             */
/*                                                                            */
/*      - BLOCCATO ACCESSO CON PW CON MACCHINA NON FERMA (da MIGLIORARE)      */
/*                                                                            */
/*      - corretto errore in riavvio da raffreddamento con pay e ERRORE IN CO-*/
/*        RSO: partiva asciugatura anche con OBLO' APERTO (o altro ERR)       */
/*                                                                            */
/*      - introdotto "f_avv_aprire_oblo" per AVVISO A FINE CICLO              */
/*                                                                            */
/*      - aggiunto anche AVVISO SONORO FINE CICLO                             */
/*                                                                            */
/*      - introdotto "pmac.abilita_inversione_velocita"     # 58              */
/*                                                                            */
/*      - introdotto "pmac.abilita_disabilito_allarmi"      # 59              */
/*                                                                            */
/*      - introdotto "pmac.tipo_out_macchina_occupata" a 3                    */
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
#include "controller/gt_reset_bruciatore.h"
#include "controller/gt_riscaldamento.h"
#include "controller/gt_presenza_aria.h"

model_t model;



int main(void)
{
    unsigned long tskp = 0, ts_input = 0, ts_temperature = 0, ts_spi = 0, ts_allarmi = 0;

    // inizializzazioni ----------------------- //
    system_init();

    spi_init();
    nt7534_init();
    digout_init();
    led_init();
    keyboard_init();

    i2c_bitbang_init(2);
    digin_init();
    timer_init();
    ptc_init();
    pwoff_init();
    pwm_init();
    gettoniera_init();
    uart_init();
    modbus_server_init();

    model_init(&model);
    view_init(&model, nt7534_flush, nt7534_rounder, nt7534_set_px, keyboard_reset);
    
    controller_init(&model);
    
    model_get_pwoff(&model);
    
    
    
    
    
#warning "  ####  DA Rimuovere !!!! FATTA PER DANILO !!!!  #### " // -TODO !!!!
    
//    model.status.f_no_gt_all = 1; // #########################################
    
//    model.status.f_no_gt_all = 0;
//    
//    if (model.pmac.abilita_disabilito_allarmi == 1)
//    {
//        model.status.f_no_gt_all = 1;
//    }
    
    
    
    digout_buzzer_bip(4, 200, 200);

    // MAIN LOOP ============================================================ //
    for (;;) {
        controller_manage_gui(&model);
        modbus_server_manage(&model);
        
        
        // gestione macchina ------------------ //
        if (is_expired(ts_allarmi, get_millis(), 200))
        {
            model.status.f_no_gt_all = 0;
            
            if (model.pmac.abilita_disabilito_allarmi == 1)
            {
                model.status.f_no_gt_all = 1;
            }
            gt_allarmi(&model);
        }

        gt_ciclo(&model, get_millis());

        gt_ventilazione(&model, get_millis());
        //ventilazione_apertura_oblo(&model, get_millis());
        
        gt_presenza_aria(&model, get_millis());
        gt_riscaldamento(&model, get_millis());
        gt_umidita(&model, get_millis());

        gt_cesto(&model, get_millis());
        gt_macchina_occupata(&model);
        gt_reset_bruciatore(&model, get_millis());
        gt_reset_bruciatore_extended(&model, get_millis());
        model.outputs = rele_get_status();

        ClrWdt();

        if (is_expired(ts_input, get_millis(), 2))
        {
            if (digin_take_reading())
            {
                view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});

                model.inputs = digin_get_inputs();
            }
            
            ts_input = get_millis();
        }



        if (is_expired(tskp, get_millis(), 5)) {
            keypad_update_t update = keyboard_manage(get_millis());

            if (update.event != KEY_NOTHING) {
                view_event((view_event_t){.code = VIEW_EVENT_KEYPAD, .key_event = update});
            }
            if (model_is_in_test(&model)) {
                pwm_set_test((&model) , model.pwm1, 1);
                pwm_set_test((&model) ,model.pwm2, 2);
            }
            tskp = get_millis();
        }



        if (is_expired(ts_temperature, get_millis(), 50)) {
            ptc_read_temperature();
            view_event((view_event_t){.code = VIEW_EVENT_MODEL_UPDATE});

            model.ptc_adc         = ptc_get_adc_value();
            model.ptc_temperature = ptc_get_temperature();

            if (model.pmac.tipo_pausa_asciugatura == 0) {
                model.status.temperatura_rilevata = model.ptc_temperature;
            }
            
            uint16_t gettoni_gettoniera = 0;
            uint16_t gettoni_ingresso = 0;
            if (timer_get_gettoni(&gettoni_gettoniera, &gettoni_ingresso))
            {
                if (model_is_in_test(&model))
                {
                    view_event((view_event_t){.code = VIEW_EVENT_COIN, .coins = gettoni_gettoniera + gettoni_ingresso});
                }
                else
                {
                    view_event((view_event_t){.code = VIEW_EVENT_COIN});
                    model_event(&model, EVENT_COIN);
                    model_aggiungi_gettoni(&model, gettoni_gettoniera, gettoni_ingresso);
                    controller_update_pwoff(&model);
                }
            }
                        
            ts_temperature        = get_millis();
        }



        if (is_expired(ts_spi, get_millis(), 500)) {
            uint16_t temp, hum;

            if (temperature_read(&temp, &hum) == 0) {
                model.sht_temperature = temp;
                model.sht_umidity     = hum / 100;
            }

            if (model.pmac.tipo_pausa_asciugatura == 1) {
                model.status.temperatura_rilevata = model.sht_temperature/100;
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
