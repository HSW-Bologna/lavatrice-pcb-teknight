#include <stdio.h>
#include "gel/parameter/parameter.h"
#include "model.h"
#include "parmac.h"
#include "descriptions/AUTOGEN_FILE_parmac.h"

#define NUM_PARAMETERS 2 

#define AL_USER 0x01


static void formatta(char *string, const void *arg);


static parameter_handle_t parameters[NUM_CICLI][NUM_PARAMETERS];


void parciclo_init(model_t *p, int reset) {
#define FINT(i) ((parameter_user_data_t){parmac_descriptions[i], formatta, NULL, NULL})

    size_t i = 0, j = 0;
    for (i = 0; i < NUM_CICLI; i++) {
        j = 0;
        // clang-format off
        /*                                 Tipo                  Puntatore                                     PMIN    PMAX    MIN  MAX   DEF   STEP  ACCESS       STRINGHE                                        RUNTIME     ARG */
        parameters[i][j++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pciclo[i].tipo_asciugatura,               NULL,   NULL,   0,   2,    0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TIPO_ASCIUGATURA),     NULL,       NULL);
        parameters[i][j++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pciclo[i].tempo_durata_asciugatura,       NULL,   NULL,   0,   100,  0,    1,    AL_USER,     FINT(PARMAC_DESCRIPTIONS_TEMPO_DURATA),     NULL,       NULL);
        // clang-format on

        parameter_check_ranges(parameters[i], NUM_PARAMETERS);
        if (reset) {
            parameter_reset_to_defaults(parameters[i], NUM_PARAMETERS);
        }
    }
}


void parciclo_operation(size_t parameter, tipo_ciclo_t ciclo, int op) {
    parameter_operator(parameter_get_handle(parameters[ciclo], NUM_PARAMETERS, parameter, AL_USER), op);
}


const char *parciclo_get_description(const model_t *pmodel, tipo_ciclo_t ciclo, size_t parameter) {
    (void)pmodel;
    parameter_user_data_t data =
        parameter_get_user_data(parameter_get_handle(parameters[ciclo], NUM_PARAMETERS, parameter, AL_USER));

    return data.descrizione[pmodel->pmac.lingua];
}


void parciclo_format_value(char *string, tipo_ciclo_t ciclo, size_t parameter) {
    parameter_handle_t *  par  = parameter_get_handle(parameters[ciclo], NUM_PARAMETERS, parameter, AL_USER);
    parameter_user_data_t data = parameter_get_user_data(par);

    data.format(string, par);
}


size_t parciclo_get_tot_parameters(tipo_ciclo_t ciclo) {
    return parameter_get_count(parameters[ciclo], NUM_PARAMETERS, AL_USER);
}


static void formatta(char *string, const void *arg) {
    const parameter_handle_t *par = arg;

    switch (par->type) {
        case PARAMETER_TYPE_UINT8:
            sprintf(string, "%i", *(uint8_t *)par->pointer);
            break;

        case PARAMETER_TYPE_UINT16:
            sprintf(string, "%i", *(uint16_t *)par->pointer);
            break;

        default:
            sprintf(string, "Errore!");
            break;
    }
}