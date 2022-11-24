#include <assert.h>
#include "libconf.h"
#include "modbus_server.h"
#include "gel/timer/timecheck.h"
#include "peripherals/uart_driver.h"
#include "peripherals/digout.h"
#include "peripherals/timer.h"
#include "model/model.h"
#include "controller.h"
#include <xc.h>


#define MINION_ADDRESS 1

#define COMMAND_STOP             0
#define COMMAND_START_PROGRAM_1  1
#define COMMAND_START_PROGRAM_2  2
#define COMMAND_START_PROGRAM_3  3
#define COMMAND_START_PROGRAM_4  4
#define COMMAND_START_PROGRAM_5  5
#define COMMAND_PAUSE            6
#define COMMAND_SAVE_PARAMS      7
#define COMMAND_MACHINE_SHUTDOWN 8
#define COMMAND_MACHINE_RESUME   9

#define HOLDING_REGISTER_COMMAND                0
#define HOLDING_REGISTER_EVENT_COUNT            1
#define HOLDING_REGISTER_EVENTS_START           2
#define HOLDING_REGISTER_PROGRAM_NUMBER         10
#define HOLDING_REGISTER_PROGRAM_STEP           11
#define HOLDING_REGISTER_PROGRAM_ELAPSED_TIME   12
#define HOLDING_REGISTER_PROGRAM_REMAINING_TIME 13
#define HOLDING_REGISTER_PROGRAM_TEMPERATURE    14

#define HOLDING_REGISTER_PARMAC_START 32

#define HOLDING_REGISTER_PARCYCLE_1_START 128
#define HOLDING_REGISTER_PARCYCLE_2_START (HOLDING_REGISTER_PARCYCLE_1_START + 32)
#define HOLDING_REGISTER_PARCYCLE_3_START (HOLDING_REGISTER_PARCYCLE_2_START + 32)
#define HOLDING_REGISTER_PARCYCLE_4_START (HOLDING_REGISTER_PARCYCLE_3_START + 32)
#define HOLDING_REGISTER_PARCYCLE_5_START (HOLDING_REGISTER_PARCYCLE_4_START + 32)

#define HOLDING_REGISTER_STATS_ACTIVITY_TIME_HIGH 320
#define HOLDING_REGISTER_STATS_ACTIVITY_TIME_LOW  321
#define HOLDING_REGISTER_STATS_WORK_TIME_HIGH     322
#define HOLDING_REGISTER_STATS_WORK_TIME_LOW      323
#define HOLDING_REGISTER_STATS_ROTATION_TIME_HIGH 324
#define HOLDING_REGISTER_STATS_ROTATION_TIME_LOW  325
#define HOLDING_REGISTER_STATS_FAN_TIME_HIGH      326
#define HOLDING_REGISTER_STATS_FAN_TIME_LOW       327
#define HOLDING_REGISTER_STATS_HEATING_TIME_HIGH  328
#define HOLDING_REGISTER_STATS_HEATING_TIME_LOW   329
#define HOLDING_REGISTER_STATS_CREDIT             330
#define HOLDING_REGISTER_STATS_PARTIAL_CYCLES     331
#define HOLDING_REGISTER_STATS_TOTAL_CYCLES       332
#define HOLDING_REGISTER_STATS_COINS              333


static ModbusSlave minion;

static ModbusError exception_callback(const ModbusSlave *minion, uint8_t function, ModbusExceptionCode code);
static ModbusError register_callback(const ModbusSlave *status, const ModbusRegisterCallbackArgs *args,
                                     ModbusRegisterCallbackResult *result);
static ModbusError modbus_static_allocator(ModbusBuffer *buffer, uint16_t size, void *context);


static unsigned long parameters_save_timestamp = 0;
static uint8_t       parameters_save_flag      = 0;


void modbus_server_init(void) {
    ModbusErrorInfo err;
    err = modbusSlaveInit(&minion,
                          register_callback,                  // Callback for register operations
                          exception_callback,                 // Callback for handling minion exceptions (optional)
                          modbus_static_allocator,            // Memory allocator for allocating responses
                          modbusSlaveDefaultFunctions,        // Set of supported functions
                          modbusSlaveDefaultFunctionCount     // Number of supported functions
    );

    // Check for errors
    assert(modbusIsOk(err) && "modbusSlaveInit() failed");
}


void modbus_server_manage(model_t *pmodel) {
    uint8_t              buffer[256];
    static unsigned long timestamp = 0;

    if (is_expired(timestamp, get_millis(), 10)) {
        int len = uart_read_rx_buffer(buffer);

        if (len >= 5) {
            modbusSlaveSetUserPointer(&minion, pmodel);

            ModbusErrorInfo err;
            err = modbusParseRequestRTU(&minion, MINION_ADDRESS, buffer, len);
            if (modbusIsOk(err)) {
                uart_async_write((uint8_t *)modbusSlaveGetResponse(&minion), modbusSlaveGetResponseLength(&minion));
                uart_clean_rx_buffer();
            }
        }

        timestamp = get_millis();
    }

    if (parameters_save_flag) {
        controller_save_pars(pmodel);
        parameters_save_timestamp = get_millis();
        parameters_save_flag      = 0;
    }
}


static ModbusError exception_callback(const ModbusSlave *minion, uint8_t function, ModbusExceptionCode code) {
    Nop();
    Nop();
    Nop();
    // Always return MODBUS_OK
    return MODBUS_OK;
}


static ModbusError register_callback(const ModbusSlave *status, const ModbusRegisterCallbackArgs *args,
                                     ModbusRegisterCallbackResult *result) {
    if (args->type != MODBUS_HOLDING_REGISTER) {
        result->exceptionCode = MODBUS_EXCEP_ILLEGAL_FUNCTION;
        return MODBUS_OK;
    }

    model_t *pmodel = modbusSlaveGetUserPointer(status);

    parmac_t *pmac = &pmodel->pmac;

    uint8_t *parmac_array[] = {
        &pmac->machine_id,
        &pmac->lingua,
        &pmac->lingua_max,
        &pmac->logo_ditta,
        &pmac->abilita_visualizzazione_temperatura,
        &pmac->abilita_tasto_menu,
        &pmac->abilita_visualizzazione_cicli_totali,
        &pmac->abilita_parametri_ridotti,
        &pmac->modello_macchina,
        &pmac->abilita_autoavvio,
        &pmac->tipo_pausa_asciugatura,
        &pmac->abilita_gas,
        &pmac->numero_tentativi_reset_gas,
        &pmac->abilita_reset_gas_esteso,
        &pmac->abilita_blocco_no_aria,
        &pmac->allarme_inverter_na_nc,
        &pmac->allarme_filtro_na_nc,
        &pmac->emergenza_na_nc,
    };

    parciclo_t *pciclo = pmodel->pciclo;

    uint8_t *parciclo_array[NUM_CICLI][17] = {0};
    for (size_t i = 0; i < NUM_CICLI; i++) {
        size_t par_i               = 0;
        parciclo_array[i][par_i++] = &pciclo[i].tipo_asciugatura_m_a;
        parciclo_array[i][par_i++] = &pciclo[i].tempo_durata_asciugatura;
        parciclo_array[i][par_i++] = &pciclo[i].abilita_attesa_temperatura;
        parciclo_array[i][par_i++] = &pciclo[i].abilita_inversione_asciugatura;
        parciclo_array[i][par_i++] = &pciclo[i].tempo_giro_asciugatura;
        parciclo_array[i][par_i++] = &pciclo[i].tempo_pausa_asciugatura;
        parciclo_array[i][par_i++] = &pciclo[i].velocita_asciugatura;
        parciclo_array[i][par_i++] = &pciclo[i].temperatura_aria_1;
        parciclo_array[i][par_i++] = &pciclo[i].offset_temperatura_aria_alto;
        parciclo_array[i][par_i++] = &pciclo[i].offset_temperatura_aria_basso;
        parciclo_array[i][par_i++] = &pciclo[i].umidita_residua_dry_auto;
        parciclo_array[i][par_i++] = &pciclo[i].abilita_raffreddamento;
        parciclo_array[i][par_i++] = &pciclo[i].tempo_durata_raffreddamento;
        parciclo_array[i][par_i++] = &pciclo[i].abilita_inversione_raffreddamento;
        parciclo_array[i][par_i++] = &pciclo[i].tempo_giro_raffreddamento;
        parciclo_array[i][par_i++] = &pciclo[i].tempo_pausa_raffreddamento;
        parciclo_array[i][par_i++] = &pciclo[i].abilita_antipiega;
    }

    switch (args->query) {
        case MODBUS_REGQ_R_CHECK:
            switch (args->index) {
                case HOLDING_REGISTER_COMMAND ... HOLDING_REGISTER_PROGRAM_TEMPERATURE:
                case HOLDING_REGISTER_PARMAC_START ... HOLDING_REGISTER_PARMAC_START +
                    (sizeof(parmac_array) / sizeof(parmac_array[0])):
                case HOLDING_REGISTER_PARCYCLE_1_START ... HOLDING_REGISTER_PARCYCLE_1_START +
                    (sizeof(parciclo_array[0]) / sizeof(parciclo_array[0][0])):
                case HOLDING_REGISTER_PARCYCLE_2_START ... HOLDING_REGISTER_PARCYCLE_2_START +
                    (sizeof(parciclo_array[1]) / sizeof(parciclo_array[1][0])):
                case HOLDING_REGISTER_PARCYCLE_3_START ... HOLDING_REGISTER_PARCYCLE_3_START +
                    (sizeof(parciclo_array[2]) / sizeof(parciclo_array[2][0])):
                case HOLDING_REGISTER_PARCYCLE_4_START ... HOLDING_REGISTER_PARCYCLE_4_START +
                    (sizeof(parciclo_array[3]) / sizeof(parciclo_array[3][0])):
                case HOLDING_REGISTER_PARCYCLE_5_START ... HOLDING_REGISTER_PARCYCLE_5_START +
                    (sizeof(parciclo_array[4]) / sizeof(parciclo_array[4][0])):
                case HOLDING_REGISTER_STATS_ACTIVITY_TIME_HIGH ... HOLDING_REGISTER_STATS_COINS:
                    result->exceptionCode = MODBUS_EXCEP_NONE;
                    break;

                default:
                    result->exceptionCode = MODBUS_EXCEP_NACK;
                    break;
            }
            break;

        case MODBUS_REGQ_W_CHECK: {
            switch (args->index) {
                case HOLDING_REGISTER_COMMAND:
                case HOLDING_REGISTER_PARMAC_START ... HOLDING_REGISTER_PARMAC_START +
                    (sizeof(parmac_array) / sizeof(parmac_array[0])):
                case HOLDING_REGISTER_PARCYCLE_1_START ... HOLDING_REGISTER_PARCYCLE_1_START +
                    (sizeof(parciclo_array[0]) / sizeof(parciclo_array[0][0])):
                case HOLDING_REGISTER_PARCYCLE_2_START ... HOLDING_REGISTER_PARCYCLE_2_START +
                    (sizeof(parciclo_array[1]) / sizeof(parciclo_array[1][0])):
                case HOLDING_REGISTER_PARCYCLE_3_START ... HOLDING_REGISTER_PARCYCLE_3_START +
                    (sizeof(parciclo_array[2]) / sizeof(parciclo_array[2][0])):
                case HOLDING_REGISTER_PARCYCLE_4_START ... HOLDING_REGISTER_PARCYCLE_4_START +
                    (sizeof(parciclo_array[3]) / sizeof(parciclo_array[3][0])):
                case HOLDING_REGISTER_PARCYCLE_5_START ... HOLDING_REGISTER_PARCYCLE_5_START +
                    (sizeof(parciclo_array[4]) / sizeof(parciclo_array[4][0])):
                    result->exceptionCode = MODBUS_EXCEP_NONE;
                    break;

                default:
                    result->exceptionCode = MODBUS_EXCEP_NACK;
                    break;
            }
            break;
        }

        // Read register
        case MODBUS_REGQ_R: {
            switch (args->index) {
                case HOLDING_REGISTER_COMMAND:
                    result->value = 0;
                    break;
                case HOLDING_REGISTER_EVENT_COUNT:
                    result->value = pmodel->events_num;
                    break;
                case HOLDING_REGISTER_EVENTS_START ... HOLDING_REGISTER_EVENTS_START + 7: {
                    size_t i      = args->index - HOLDING_REGISTER_EVENTS_START;
                    result->value = (model_get_nth_event(pmodel, i * 2) << 8) | model_get_nth_event(pmodel, i * 2 + 1);
                    break;
                }
                case HOLDING_REGISTER_PROGRAM_NUMBER:
                    result->value = pmodel->status.ciclo + 1;
                    break;
                case HOLDING_REGISTER_PROGRAM_STEP:
                    result->value = pmodel->status.stato_step;
                    break;
                case HOLDING_REGISTER_PROGRAM_ELAPSED_TIME:
                    result->value = model_get_tempo_passato(pmodel);
                    break;
                case HOLDING_REGISTER_PROGRAM_REMAINING_TIME:
                    if (model_ciclo_selezionato(pmodel)) {
                        if (model_get_status_stopped(pmodel)) {
                            result->value = model_secondi_durata_asciugatura_da_mostrare(pmodel);
                        } else {
                            result->value = model_get_stato_timer(pmodel);
                        }
                    }
                    break;
                case HOLDING_REGISTER_PROGRAM_TEMPERATURE:
                    result->value = model_get_temperatura_corrente(pmodel);
                    break;
                case HOLDING_REGISTER_PARMAC_START ... HOLDING_REGISTER_PARMAC_START +
                    (sizeof(parmac_array) / sizeof(parmac_array[0])):
                    result->value = *parmac_array[args->index - HOLDING_REGISTER_PARMAC_START];
                    break;
                case HOLDING_REGISTER_PARCYCLE_1_START ... HOLDING_REGISTER_PARCYCLE_1_START +
                    (sizeof(parciclo_array[0]) / sizeof(parciclo_array[0][0])):
                    result->value = *parciclo_array[0][args->index - HOLDING_REGISTER_PARCYCLE_1_START];
                    break;
                case HOLDING_REGISTER_PARCYCLE_2_START ... HOLDING_REGISTER_PARCYCLE_2_START +
                    (sizeof(parciclo_array[1]) / sizeof(parciclo_array[1][0])):
                    result->value = *parciclo_array[1][args->index - HOLDING_REGISTER_PARCYCLE_2_START];
                    break;
                case HOLDING_REGISTER_PARCYCLE_3_START ... HOLDING_REGISTER_PARCYCLE_3_START +
                    (sizeof(parciclo_array[2]) / sizeof(parciclo_array[2][0])):
                    result->value = *parciclo_array[2][args->index - HOLDING_REGISTER_PARCYCLE_3_START];
                    break;
                case HOLDING_REGISTER_PARCYCLE_4_START ... HOLDING_REGISTER_PARCYCLE_4_START +
                    (sizeof(parciclo_array[3]) / sizeof(parciclo_array[3][0])):
                    result->value = *parciclo_array[3][args->index - HOLDING_REGISTER_PARCYCLE_4_START];
                    break;
                case HOLDING_REGISTER_PARCYCLE_5_START ... HOLDING_REGISTER_PARCYCLE_5_START +
                    (sizeof(parciclo_array[4]) / sizeof(parciclo_array[4][0])):
                    result->value = *parciclo_array[4][args->index - HOLDING_REGISTER_PARCYCLE_5_START];
                    break;
                case HOLDING_REGISTER_STATS_ACTIVITY_TIME_HIGH:
                    result->value = (pmodel->pwoff.tempo_attivita >> 16) & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_ACTIVITY_TIME_LOW:
                    result->value = pmodel->pwoff.tempo_attivita & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_WORK_TIME_HIGH:
                    result->value = (pmodel->pwoff.tempo_lavoro >> 16) & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_WORK_TIME_LOW:
                    result->value = pmodel->pwoff.tempo_lavoro & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_ROTATION_TIME_HIGH:
                    result->value = (pmodel->pwoff.tempo_moto >> 16) & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_ROTATION_TIME_LOW:
                    result->value = pmodel->pwoff.tempo_moto & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_FAN_TIME_HIGH:
                    result->value = (pmodel->pwoff.tempo_ventilazione >> 16) & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_FAN_TIME_LOW:
                    result->value = pmodel->pwoff.tempo_ventilazione & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_HEATING_TIME_HIGH:
                    result->value = (pmodel->pwoff.tempo_ventilazione >> 16) & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_HEATING_TIME_LOW:
                    result->value = pmodel->pwoff.tempo_ventilazione & 0xFFFF;
                    break;
                case HOLDING_REGISTER_STATS_CREDIT:
                    result->value = pmodel->pwoff.credito;
                    break;
                case HOLDING_REGISTER_STATS_PARTIAL_CYCLES:
                    result->value = pmodel->pwoff.cicli_parziali;
                    break;
                case HOLDING_REGISTER_STATS_TOTAL_CYCLES:
                    result->value = pmodel->pwoff.cicli_totali;
                    break;
                case HOLDING_REGISTER_STATS_COINS:
                    result->value = pmodel->pwoff.gettoni;
                    break;
            }
            break;
        }

        // Write register
        case MODBUS_REGQ_W: {
            switch (args->index) {
                case HOLDING_REGISTER_COMMAND: {
                    switch (args->value) {
                        case COMMAND_STOP:
                            model_set_status_stopped(pmodel);
                            break;
                        case COMMAND_START_PROGRAM_1:
                            model_seleziona_ciclo(pmodel, 0);
                            break;
                        case COMMAND_START_PROGRAM_2:
                            model_seleziona_ciclo(pmodel, 1);
                            break;
                        case COMMAND_START_PROGRAM_3:
                            model_seleziona_ciclo(pmodel, 2);
                            break;
                        case COMMAND_START_PROGRAM_4:
                            model_seleziona_ciclo(pmodel, 3);
                            break;
                        case COMMAND_START_PROGRAM_5:
                            model_seleziona_ciclo(pmodel, 4);
                            break;
                        case COMMAND_PAUSE:
                            model_set_status_pause(pmodel);
                            break;
                        case COMMAND_SAVE_PARAMS:
                            if (is_expired(parameters_save_timestamp, get_millis(), 10000UL)) {
                                parameters_save_flag = 1;
                            }
                            break;
                        case COMMAND_MACHINE_SHUTDOWN:
                        case COMMAND_MACHINE_RESUME:
                            // Cos'e' il blocco macchina?
                            break;
                    }
                    break;
                }

                case HOLDING_REGISTER_PARMAC_START ... HOLDING_REGISTER_PARMAC_START +
                    (sizeof(parmac_array) / sizeof(parmac_array[0])):
                    *parmac_array[args->index - HOLDING_REGISTER_PARMAC_START] = args->value;
                    break;
                case HOLDING_REGISTER_PARCYCLE_1_START ... HOLDING_REGISTER_PARCYCLE_1_START +
                    (sizeof(parciclo_array[0]) / sizeof(parciclo_array[0][0])):
                    *parciclo_array[0][args->index - HOLDING_REGISTER_PARCYCLE_1_START] = args->value;
                    break;
                case HOLDING_REGISTER_PARCYCLE_2_START ... HOLDING_REGISTER_PARCYCLE_2_START +
                    (sizeof(parciclo_array[1]) / sizeof(parciclo_array[1][0])):
                    *parciclo_array[1][args->index - HOLDING_REGISTER_PARCYCLE_2_START] = args->value;
                    break;
                case HOLDING_REGISTER_PARCYCLE_3_START ... HOLDING_REGISTER_PARCYCLE_3_START +
                    (sizeof(parciclo_array[2]) / sizeof(parciclo_array[2][0])):
                    *parciclo_array[2][args->index - HOLDING_REGISTER_PARCYCLE_3_START] = args->value;
                    break;
                case HOLDING_REGISTER_PARCYCLE_4_START ... HOLDING_REGISTER_PARCYCLE_4_START +
                    (sizeof(parciclo_array[3]) / sizeof(parciclo_array[3][0])):
                    *parciclo_array[3][args->index - HOLDING_REGISTER_PARCYCLE_4_START] = args->value;
                    break;
                case HOLDING_REGISTER_PARCYCLE_5_START ... HOLDING_REGISTER_PARCYCLE_5_START +
                    (sizeof(parciclo_array[4]) / sizeof(parciclo_array[4][0])):
                    *parciclo_array[4][args->index - HOLDING_REGISTER_PARCYCLE_5_START] = args->value;
                    break;
            }
            break;
        }

        default:
            break;
    }

    // Always return MODBUS_OK
    return MODBUS_OK;
}


static ModbusError modbus_static_allocator(ModbusBuffer *buffer, uint16_t size, void *context) {
    static uint8_t request[256];

    if (!size) {
        // Pretend we're freeing the buffer
        buffer->data = NULL;
        return MODBUS_OK;
    } else {
        if (size > 256) {
            // Requested size is too big, return allocation error
            buffer->data = NULL;
            return MODBUS_ERROR_ALLOC;
        } else {
            // Return a pointer to one of the static buffers depending
            // on the declared purpose of the buffer
            buffer->data = request;
            return MODBUS_OK;
        }
    }
}
