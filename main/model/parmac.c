#include <stdio.h>
#include "gel/parameter/parameter.h"
#include "model.h"
#include "parmac.h"
#include "descriptions/AUTOGEN_FILE_parmac.h"

#define NUM_PARAMETERS 4

#define AL_USER 0x01
#define AL_TECH 0x02


static void formatta(char *string, const void *arg);


static parameter_handle_t parameters[NUM_PARAMETERS];


void parmac_init(model_t *p, int reset) {
#define FINT(i) ((parameter_user_data_t){parmac_descriptions[i], formatta, NULL, NULL})

    size_t i = 0;
    // clang-format off
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.lingua,               NULL, NULL, 0, 1, 0, 1, AL_USER,     FINT(PARMAC_DESCRIPTIONS_LINGUA),               NULL, NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.modello,              NULL, NULL, 0, 5, 0, 1, AL_USER,     FINT(PARMAC_DESCRIPTIONS_MODELLO),              NULL, NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.logo,                 NULL, NULL, 0, 5, 0, 1, AL_TECH,     FINT(PARMAC_DESCRIPTIONS_LOGO),                 NULL, NULL);
    parameters[i++] = PARAMETER_C99(PARAMETER_TYPE_UINT8, &p->pmac.livello_accesso,      NULL, NULL, 0, 2, 0, 1, AL_TECH,     FINT(PARMAC_DESCRIPTIONS_LIVELLO_ACCESSO),      NULL, NULL);
    // clang-format on

    parameter_check_ranges(parameters, NUM_PARAMETERS);
    if (reset)
        parameter_reset_to_defaults(parameters, NUM_PARAMETERS);
}


void parmac_operation(size_t parameter, int op) {
    parameter_operator(parameter_get_handle(parameters, NUM_PARAMETERS, parameter, AL_USER | AL_TECH), op);
}


const char *parmac_get_description(const model_t *pmodel, size_t parameter) {
    (void)pmodel;
    parameter_user_data_t data =
        parameter_get_user_data(parameter_get_handle(parameters, NUM_PARAMETERS, parameter, AL_USER | AL_TECH));

    return data.descrizione[pmodel->pmac.lingua];
}


void parmac_format_value(char *string, size_t parameter) {
    parameter_handle_t *  par  = parameter_get_handle(parameters, NUM_PARAMETERS, parameter, AL_USER | AL_TECH);
    parameter_user_data_t data = parameter_get_user_data(par);

    data.format(string, par);
}


size_t parmac_get_tot_parameters(void) {
    return parameter_get_count(parameters, NUM_PARAMETERS, AL_USER | AL_TECH);
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