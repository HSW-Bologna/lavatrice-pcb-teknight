#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=components/generic_embedded_libs/gel/collections/circular_buffer.c components/generic_embedded_libs/gel/crc/crc16-ccitt.c components/generic_embedded_libs/gel/data_structures/struct_update.c components/generic_embedded_libs/gel/data_structures/watcher.c components/generic_embedded_libs/gel/debounce/debounce.c components/generic_embedded_libs/gel/debounce/pulsecounter.c components/generic_embedded_libs/gel/keypad/keypad.c components/generic_embedded_libs/gel/pagemanager/page_manager.c components/generic_embedded_libs/gel/parameter/parameter.c components/generic_embedded_libs/gel/timer/stopwatch.c components/generic_embedded_libs/gel/wearleveling/wearleveling.c components/I2C/i2c_common/i2c_common.c components/I2C/i2c_devices/eeprom/24LC16/24LC16.c components/I2C/i2c_ports/PIC/i2c_bitbang.c components/I2C/i2c_ports/PIC/i2c_driver.c components/lvgl/porting/lv_port_disp_template.c components/lvgl/porting/lv_port_fs_template.c components/lvgl/porting/lv_port_indev_template.c components/lvgl/src/lv_core/lv_debug.c components/lvgl/src/lv_core/lv_disp.c components/lvgl/src/lv_core/lv_group.c components/lvgl/src/lv_core/lv_indev.c components/lvgl/src/lv_core/lv_obj.c components/lvgl/src/lv_core/lv_refr.c components/lvgl/src/lv_core/lv_style.c components/lvgl/src/lv_draw/lv_draw.c components/lvgl/src/lv_draw/lv_draw_arc.c components/lvgl/src/lv_draw/lv_draw_basic.c components/lvgl/src/lv_draw/lv_draw_img.c components/lvgl/src/lv_draw/lv_draw_label.c components/lvgl/src/lv_draw/lv_draw_line.c components/lvgl/src/lv_draw/lv_draw_rect.c components/lvgl/src/lv_draw/lv_draw_triangle.c components/lvgl/src/lv_draw/lv_img_cache.c components/lvgl/src/lv_draw/lv_img_decoder.c components/lvgl/src/lv_font/lv_font.c components/lvgl/src/lv_font/lv_font_fmt_txt.c components/lvgl/src/lv_font/lv_font_roboto_12.c components/lvgl/src/lv_font/lv_font_roboto_12_subpx.c components/lvgl/src/lv_font/lv_font_roboto_16.c components/lvgl/src/lv_font/lv_font_roboto_22.c components/lvgl/src/lv_font/lv_font_roboto_28.c components/lvgl/src/lv_font/lv_font_roboto_28_compressed.c components/lvgl/src/lv_font/lv_font_unscii_8.c components/lvgl/src/lv_hal/lv_hal_disp.c components/lvgl/src/lv_hal/lv_hal_indev.c components/lvgl/src/lv_hal/lv_hal_tick.c components/lvgl/src/lv_misc/lv_anim.c components/lvgl/src/lv_misc/lv_area.c components/lvgl/src/lv_misc/lv_async.c components/lvgl/src/lv_misc/lv_bidi.c components/lvgl/src/lv_misc/lv_circ.c components/lvgl/src/lv_misc/lv_color.c components/lvgl/src/lv_misc/lv_fs.c components/lvgl/src/lv_misc/lv_gc.c components/lvgl/src/lv_misc/lv_ll.c components/lvgl/src/lv_misc/lv_log.c components/lvgl/src/lv_misc/lv_math.c components/lvgl/src/lv_misc/lv_mem.c components/lvgl/src/lv_misc/lv_printf.c components/lvgl/src/lv_misc/lv_task.c components/lvgl/src/lv_misc/lv_templ.c components/lvgl/src/lv_misc/lv_txt.c components/lvgl/src/lv_misc/lv_utils.c components/lvgl/src/lv_objx/lv_arc.c components/lvgl/src/lv_objx/lv_bar.c components/lvgl/src/lv_objx/lv_btn.c components/lvgl/src/lv_objx/lv_btnm.c components/lvgl/src/lv_objx/lv_calendar.c components/lvgl/src/lv_objx/lv_canvas.c components/lvgl/src/lv_objx/lv_cb.c components/lvgl/src/lv_objx/lv_chart.c components/lvgl/src/lv_objx/lv_cont.c components/lvgl/src/lv_objx/lv_cpicker.c components/lvgl/src/lv_objx/lv_ddlist.c components/lvgl/src/lv_objx/lv_gauge.c components/lvgl/src/lv_objx/lv_img.c components/lvgl/src/lv_objx/lv_imgbtn.c components/lvgl/src/lv_objx/lv_kb.c components/lvgl/src/lv_objx/lv_label.c components/lvgl/src/lv_objx/lv_led.c components/lvgl/src/lv_objx/lv_line.c components/lvgl/src/lv_objx/lv_list.c components/lvgl/src/lv_objx/lv_lmeter.c components/lvgl/src/lv_objx/lv_mbox.c components/lvgl/src/lv_objx/lv_objx_templ.c components/lvgl/src/lv_objx/lv_page.c components/lvgl/src/lv_objx/lv_preload.c components/lvgl/src/lv_objx/lv_roller.c components/lvgl/src/lv_objx/lv_slider.c components/lvgl/src/lv_objx/lv_spinbox.c components/lvgl/src/lv_objx/lv_sw.c components/lvgl/src/lv_objx/lv_ta.c components/lvgl/src/lv_objx/lv_table.c components/lvgl/src/lv_objx/lv_tabview.c components/lvgl/src/lv_objx/lv_tileview.c components/lvgl/src/lv_objx/lv_win.c components/lvgl/src/lv_themes/lv_theme.c components/lvgl/src/lv_themes/lv_theme_alien.c components/lvgl/src/lv_themes/lv_theme_default.c components/lvgl/src/lv_themes/lv_theme_material.c components/lvgl/src/lv_themes/lv_theme_mono.c components/lvgl/src/lv_themes/lv_theme_nemo.c components/lvgl/src/lv_themes/lv_theme_night.c components/lvgl/src/lv_themes/lv_theme_templ.c components/lvgl/src/lv_themes/lv_theme_zen.c components/SPI/spi_common/spi_common.c components/SPI/spi_devices/io/MCP23S08/mcp23s08.c main/controller/gui.c main/controller/controller.c main/controller/modbus_server.c main/controller/ciclo.c main/controller/gt_cesto.c main/controller/gt_riscaldamento.c main/controller/gt_ventilazione.c main/controller/gt_allarmi.c main/controller/gt_reset_bruciatore.c main/controller/gt_macchina_occupata.c main/controller/gt_presenza_aria.c main/model/descriptions/AUTOGEN_FILE_parmac.c main/model/model.c main/model/parmac.c main/model/parciclo.c main/peripherals/system.c main/peripherals/NT7534.c main/peripherals/digin.c main/peripherals/i2c_devices.c main/peripherals/timer.c main/peripherals/ptc.c main/peripherals/pwoff.c main/peripherals/digout.c main/peripherals/keyboard.c main/peripherals/temperature.c main/peripherals/spi.c main/peripherals/pwm.c main/peripherals/gettoniera.c main/peripherals/uart_driver.c main/peripherals/traps.c main/peripherals/led.c main/utils/assert.c main/utils/lightmodbus-impl.c main/view/fonts/hsw8x8.c main/view/fonts/legacy_fonts.c main/view/fonts/hsw8x16.c main/view/fonts/hsw6x8.c main/view/images/legacy_img_insert_coin.c main/view/images/legacy_img_programs.c main/view/images/legacy_img_warning.c main/view/images/legacy_img_stop.c main/view/images/legacy_img_program_caldo.c main/view/images/legacy_img_program_tiepido.c main/view/images/lgacy_img_program_medio.c main/view/images/legacy_img_program_lana.c main/view/images/legacy_img_program_freddo.c main/view/images/legacy_img_logo_hoover.c main/view/images/legacy_img_logo_ciao.c main/view/images/legacy_img_logo_hsw.c main/view/images/legacy_img_logo_msgroup.c main/view/images/legacy_img_logo_rotondi.c main/view/images/legacy_img_logo_schulthess.c main/view/images/legacy_img_chiudere_oblo.c main/view/images/legacy_img_aprire_oblo.c main/view/images/legacy_img_raffreddamento.c main/view/images/legacy_img_antipiega.c main/view/intl/intl.c main/view/intl/AUTOGEN_FILE_strings.c main/view/pages/page_main.c main/view/pages/page_temperature_test.c main/view/pages/page_digout_test.c main/view/pages/page_digin_test.c main/view/pages/page_pwm_test.c main/view/pages/page_led_test.c main/view/pages/page_parmac.c main/view/pages/page_info.c main/view/pages/page_scelta_programma.c main/view/pages/page_parciclo.c main/view/pages/page_splash.c main/view/pages/page_reset_ram.c main/view/pages/page_commissioning.c main/view/pages/page_coin_test.c main/view/pages/page_contrast.c main/view/pages/page_stats.c main/view/pages/page_ram_error.c main/view/widgets/custom_lv_img.c main/view/view.c main/view/common.c main/view/styles.c main/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o ${OBJECTDIR}/components/SPI/spi_common/spi_common.o ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o ${OBJECTDIR}/main/controller/gui.o ${OBJECTDIR}/main/controller/controller.o ${OBJECTDIR}/main/controller/modbus_server.o ${OBJECTDIR}/main/controller/ciclo.o ${OBJECTDIR}/main/controller/gt_cesto.o ${OBJECTDIR}/main/controller/gt_riscaldamento.o ${OBJECTDIR}/main/controller/gt_ventilazione.o ${OBJECTDIR}/main/controller/gt_allarmi.o ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o ${OBJECTDIR}/main/controller/gt_macchina_occupata.o ${OBJECTDIR}/main/controller/gt_presenza_aria.o ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o ${OBJECTDIR}/main/model/model.o ${OBJECTDIR}/main/model/parmac.o ${OBJECTDIR}/main/model/parciclo.o ${OBJECTDIR}/main/peripherals/system.o ${OBJECTDIR}/main/peripherals/NT7534.o ${OBJECTDIR}/main/peripherals/digin.o ${OBJECTDIR}/main/peripherals/i2c_devices.o ${OBJECTDIR}/main/peripherals/timer.o ${OBJECTDIR}/main/peripherals/ptc.o ${OBJECTDIR}/main/peripherals/pwoff.o ${OBJECTDIR}/main/peripherals/digout.o ${OBJECTDIR}/main/peripherals/keyboard.o ${OBJECTDIR}/main/peripherals/temperature.o ${OBJECTDIR}/main/peripherals/spi.o ${OBJECTDIR}/main/peripherals/pwm.o ${OBJECTDIR}/main/peripherals/gettoniera.o ${OBJECTDIR}/main/peripherals/uart_driver.o ${OBJECTDIR}/main/peripherals/traps.o ${OBJECTDIR}/main/peripherals/led.o ${OBJECTDIR}/main/utils/assert.o ${OBJECTDIR}/main/utils/lightmodbus-impl.o ${OBJECTDIR}/main/view/fonts/hsw8x8.o ${OBJECTDIR}/main/view/fonts/legacy_fonts.o ${OBJECTDIR}/main/view/fonts/hsw8x16.o ${OBJECTDIR}/main/view/fonts/hsw6x8.o ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o ${OBJECTDIR}/main/view/images/legacy_img_programs.o ${OBJECTDIR}/main/view/images/legacy_img_warning.o ${OBJECTDIR}/main/view/images/legacy_img_stop.o ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o ${OBJECTDIR}/main/view/intl/intl.o ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o ${OBJECTDIR}/main/view/pages/page_main.o ${OBJECTDIR}/main/view/pages/page_temperature_test.o ${OBJECTDIR}/main/view/pages/page_digout_test.o ${OBJECTDIR}/main/view/pages/page_digin_test.o ${OBJECTDIR}/main/view/pages/page_pwm_test.o ${OBJECTDIR}/main/view/pages/page_led_test.o ${OBJECTDIR}/main/view/pages/page_parmac.o ${OBJECTDIR}/main/view/pages/page_info.o ${OBJECTDIR}/main/view/pages/page_scelta_programma.o ${OBJECTDIR}/main/view/pages/page_parciclo.o ${OBJECTDIR}/main/view/pages/page_splash.o ${OBJECTDIR}/main/view/pages/page_reset_ram.o ${OBJECTDIR}/main/view/pages/page_commissioning.o ${OBJECTDIR}/main/view/pages/page_coin_test.o ${OBJECTDIR}/main/view/pages/page_contrast.o ${OBJECTDIR}/main/view/pages/page_stats.o ${OBJECTDIR}/main/view/pages/page_ram_error.o ${OBJECTDIR}/main/view/widgets/custom_lv_img.o ${OBJECTDIR}/main/view/view.o ${OBJECTDIR}/main/view/common.o ${OBJECTDIR}/main/view/styles.o ${OBJECTDIR}/main/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d ${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d ${OBJECTDIR}/main/controller/gui.o.d ${OBJECTDIR}/main/controller/controller.o.d ${OBJECTDIR}/main/controller/modbus_server.o.d ${OBJECTDIR}/main/controller/ciclo.o.d ${OBJECTDIR}/main/controller/gt_cesto.o.d ${OBJECTDIR}/main/controller/gt_riscaldamento.o.d ${OBJECTDIR}/main/controller/gt_ventilazione.o.d ${OBJECTDIR}/main/controller/gt_allarmi.o.d ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d ${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d ${OBJECTDIR}/main/controller/gt_presenza_aria.o.d ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d ${OBJECTDIR}/main/model/model.o.d ${OBJECTDIR}/main/model/parmac.o.d ${OBJECTDIR}/main/model/parciclo.o.d ${OBJECTDIR}/main/peripherals/system.o.d ${OBJECTDIR}/main/peripherals/NT7534.o.d ${OBJECTDIR}/main/peripherals/digin.o.d ${OBJECTDIR}/main/peripherals/i2c_devices.o.d ${OBJECTDIR}/main/peripherals/timer.o.d ${OBJECTDIR}/main/peripherals/ptc.o.d ${OBJECTDIR}/main/peripherals/pwoff.o.d ${OBJECTDIR}/main/peripherals/digout.o.d ${OBJECTDIR}/main/peripherals/keyboard.o.d ${OBJECTDIR}/main/peripherals/temperature.o.d ${OBJECTDIR}/main/peripherals/spi.o.d ${OBJECTDIR}/main/peripherals/pwm.o.d ${OBJECTDIR}/main/peripherals/gettoniera.o.d ${OBJECTDIR}/main/peripherals/uart_driver.o.d ${OBJECTDIR}/main/peripherals/traps.o.d ${OBJECTDIR}/main/peripherals/led.o.d ${OBJECTDIR}/main/utils/assert.o.d ${OBJECTDIR}/main/utils/lightmodbus-impl.o.d ${OBJECTDIR}/main/view/fonts/hsw8x8.o.d ${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d ${OBJECTDIR}/main/view/fonts/hsw8x16.o.d ${OBJECTDIR}/main/view/fonts/hsw6x8.o.d ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d ${OBJECTDIR}/main/view/images/legacy_img_programs.o.d ${OBJECTDIR}/main/view/images/legacy_img_warning.o.d ${OBJECTDIR}/main/view/images/legacy_img_stop.o.d ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d ${OBJECTDIR}/main/view/intl/intl.o.d ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d ${OBJECTDIR}/main/view/pages/page_main.o.d ${OBJECTDIR}/main/view/pages/page_temperature_test.o.d ${OBJECTDIR}/main/view/pages/page_digout_test.o.d ${OBJECTDIR}/main/view/pages/page_digin_test.o.d ${OBJECTDIR}/main/view/pages/page_pwm_test.o.d ${OBJECTDIR}/main/view/pages/page_led_test.o.d ${OBJECTDIR}/main/view/pages/page_parmac.o.d ${OBJECTDIR}/main/view/pages/page_info.o.d ${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d ${OBJECTDIR}/main/view/pages/page_parciclo.o.d ${OBJECTDIR}/main/view/pages/page_splash.o.d ${OBJECTDIR}/main/view/pages/page_reset_ram.o.d ${OBJECTDIR}/main/view/pages/page_commissioning.o.d ${OBJECTDIR}/main/view/pages/page_coin_test.o.d ${OBJECTDIR}/main/view/pages/page_contrast.o.d ${OBJECTDIR}/main/view/pages/page_stats.o.d ${OBJECTDIR}/main/view/pages/page_ram_error.o.d ${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d ${OBJECTDIR}/main/view/view.o.d ${OBJECTDIR}/main/view/common.o.d ${OBJECTDIR}/main/view/styles.o.d ${OBJECTDIR}/main/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o ${OBJECTDIR}/components/SPI/spi_common/spi_common.o ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o ${OBJECTDIR}/main/controller/gui.o ${OBJECTDIR}/main/controller/controller.o ${OBJECTDIR}/main/controller/modbus_server.o ${OBJECTDIR}/main/controller/ciclo.o ${OBJECTDIR}/main/controller/gt_cesto.o ${OBJECTDIR}/main/controller/gt_riscaldamento.o ${OBJECTDIR}/main/controller/gt_ventilazione.o ${OBJECTDIR}/main/controller/gt_allarmi.o ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o ${OBJECTDIR}/main/controller/gt_macchina_occupata.o ${OBJECTDIR}/main/controller/gt_presenza_aria.o ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o ${OBJECTDIR}/main/model/model.o ${OBJECTDIR}/main/model/parmac.o ${OBJECTDIR}/main/model/parciclo.o ${OBJECTDIR}/main/peripherals/system.o ${OBJECTDIR}/main/peripherals/NT7534.o ${OBJECTDIR}/main/peripherals/digin.o ${OBJECTDIR}/main/peripherals/i2c_devices.o ${OBJECTDIR}/main/peripherals/timer.o ${OBJECTDIR}/main/peripherals/ptc.o ${OBJECTDIR}/main/peripherals/pwoff.o ${OBJECTDIR}/main/peripherals/digout.o ${OBJECTDIR}/main/peripherals/keyboard.o ${OBJECTDIR}/main/peripherals/temperature.o ${OBJECTDIR}/main/peripherals/spi.o ${OBJECTDIR}/main/peripherals/pwm.o ${OBJECTDIR}/main/peripherals/gettoniera.o ${OBJECTDIR}/main/peripherals/uart_driver.o ${OBJECTDIR}/main/peripherals/traps.o ${OBJECTDIR}/main/peripherals/led.o ${OBJECTDIR}/main/utils/assert.o ${OBJECTDIR}/main/utils/lightmodbus-impl.o ${OBJECTDIR}/main/view/fonts/hsw8x8.o ${OBJECTDIR}/main/view/fonts/legacy_fonts.o ${OBJECTDIR}/main/view/fonts/hsw8x16.o ${OBJECTDIR}/main/view/fonts/hsw6x8.o ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o ${OBJECTDIR}/main/view/images/legacy_img_programs.o ${OBJECTDIR}/main/view/images/legacy_img_warning.o ${OBJECTDIR}/main/view/images/legacy_img_stop.o ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o ${OBJECTDIR}/main/view/intl/intl.o ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o ${OBJECTDIR}/main/view/pages/page_main.o ${OBJECTDIR}/main/view/pages/page_temperature_test.o ${OBJECTDIR}/main/view/pages/page_digout_test.o ${OBJECTDIR}/main/view/pages/page_digin_test.o ${OBJECTDIR}/main/view/pages/page_pwm_test.o ${OBJECTDIR}/main/view/pages/page_led_test.o ${OBJECTDIR}/main/view/pages/page_parmac.o ${OBJECTDIR}/main/view/pages/page_info.o ${OBJECTDIR}/main/view/pages/page_scelta_programma.o ${OBJECTDIR}/main/view/pages/page_parciclo.o ${OBJECTDIR}/main/view/pages/page_splash.o ${OBJECTDIR}/main/view/pages/page_reset_ram.o ${OBJECTDIR}/main/view/pages/page_commissioning.o ${OBJECTDIR}/main/view/pages/page_coin_test.o ${OBJECTDIR}/main/view/pages/page_contrast.o ${OBJECTDIR}/main/view/pages/page_stats.o ${OBJECTDIR}/main/view/pages/page_ram_error.o ${OBJECTDIR}/main/view/widgets/custom_lv_img.o ${OBJECTDIR}/main/view/view.o ${OBJECTDIR}/main/view/common.o ${OBJECTDIR}/main/view/styles.o ${OBJECTDIR}/main/main.o

# Source Files
SOURCEFILES=components/generic_embedded_libs/gel/collections/circular_buffer.c components/generic_embedded_libs/gel/crc/crc16-ccitt.c components/generic_embedded_libs/gel/data_structures/struct_update.c components/generic_embedded_libs/gel/data_structures/watcher.c components/generic_embedded_libs/gel/debounce/debounce.c components/generic_embedded_libs/gel/debounce/pulsecounter.c components/generic_embedded_libs/gel/keypad/keypad.c components/generic_embedded_libs/gel/pagemanager/page_manager.c components/generic_embedded_libs/gel/parameter/parameter.c components/generic_embedded_libs/gel/timer/stopwatch.c components/generic_embedded_libs/gel/wearleveling/wearleveling.c components/I2C/i2c_common/i2c_common.c components/I2C/i2c_devices/eeprom/24LC16/24LC16.c components/I2C/i2c_ports/PIC/i2c_bitbang.c components/I2C/i2c_ports/PIC/i2c_driver.c components/lvgl/porting/lv_port_disp_template.c components/lvgl/porting/lv_port_fs_template.c components/lvgl/porting/lv_port_indev_template.c components/lvgl/src/lv_core/lv_debug.c components/lvgl/src/lv_core/lv_disp.c components/lvgl/src/lv_core/lv_group.c components/lvgl/src/lv_core/lv_indev.c components/lvgl/src/lv_core/lv_obj.c components/lvgl/src/lv_core/lv_refr.c components/lvgl/src/lv_core/lv_style.c components/lvgl/src/lv_draw/lv_draw.c components/lvgl/src/lv_draw/lv_draw_arc.c components/lvgl/src/lv_draw/lv_draw_basic.c components/lvgl/src/lv_draw/lv_draw_img.c components/lvgl/src/lv_draw/lv_draw_label.c components/lvgl/src/lv_draw/lv_draw_line.c components/lvgl/src/lv_draw/lv_draw_rect.c components/lvgl/src/lv_draw/lv_draw_triangle.c components/lvgl/src/lv_draw/lv_img_cache.c components/lvgl/src/lv_draw/lv_img_decoder.c components/lvgl/src/lv_font/lv_font.c components/lvgl/src/lv_font/lv_font_fmt_txt.c components/lvgl/src/lv_font/lv_font_roboto_12.c components/lvgl/src/lv_font/lv_font_roboto_12_subpx.c components/lvgl/src/lv_font/lv_font_roboto_16.c components/lvgl/src/lv_font/lv_font_roboto_22.c components/lvgl/src/lv_font/lv_font_roboto_28.c components/lvgl/src/lv_font/lv_font_roboto_28_compressed.c components/lvgl/src/lv_font/lv_font_unscii_8.c components/lvgl/src/lv_hal/lv_hal_disp.c components/lvgl/src/lv_hal/lv_hal_indev.c components/lvgl/src/lv_hal/lv_hal_tick.c components/lvgl/src/lv_misc/lv_anim.c components/lvgl/src/lv_misc/lv_area.c components/lvgl/src/lv_misc/lv_async.c components/lvgl/src/lv_misc/lv_bidi.c components/lvgl/src/lv_misc/lv_circ.c components/lvgl/src/lv_misc/lv_color.c components/lvgl/src/lv_misc/lv_fs.c components/lvgl/src/lv_misc/lv_gc.c components/lvgl/src/lv_misc/lv_ll.c components/lvgl/src/lv_misc/lv_log.c components/lvgl/src/lv_misc/lv_math.c components/lvgl/src/lv_misc/lv_mem.c components/lvgl/src/lv_misc/lv_printf.c components/lvgl/src/lv_misc/lv_task.c components/lvgl/src/lv_misc/lv_templ.c components/lvgl/src/lv_misc/lv_txt.c components/lvgl/src/lv_misc/lv_utils.c components/lvgl/src/lv_objx/lv_arc.c components/lvgl/src/lv_objx/lv_bar.c components/lvgl/src/lv_objx/lv_btn.c components/lvgl/src/lv_objx/lv_btnm.c components/lvgl/src/lv_objx/lv_calendar.c components/lvgl/src/lv_objx/lv_canvas.c components/lvgl/src/lv_objx/lv_cb.c components/lvgl/src/lv_objx/lv_chart.c components/lvgl/src/lv_objx/lv_cont.c components/lvgl/src/lv_objx/lv_cpicker.c components/lvgl/src/lv_objx/lv_ddlist.c components/lvgl/src/lv_objx/lv_gauge.c components/lvgl/src/lv_objx/lv_img.c components/lvgl/src/lv_objx/lv_imgbtn.c components/lvgl/src/lv_objx/lv_kb.c components/lvgl/src/lv_objx/lv_label.c components/lvgl/src/lv_objx/lv_led.c components/lvgl/src/lv_objx/lv_line.c components/lvgl/src/lv_objx/lv_list.c components/lvgl/src/lv_objx/lv_lmeter.c components/lvgl/src/lv_objx/lv_mbox.c components/lvgl/src/lv_objx/lv_objx_templ.c components/lvgl/src/lv_objx/lv_page.c components/lvgl/src/lv_objx/lv_preload.c components/lvgl/src/lv_objx/lv_roller.c components/lvgl/src/lv_objx/lv_slider.c components/lvgl/src/lv_objx/lv_spinbox.c components/lvgl/src/lv_objx/lv_sw.c components/lvgl/src/lv_objx/lv_ta.c components/lvgl/src/lv_objx/lv_table.c components/lvgl/src/lv_objx/lv_tabview.c components/lvgl/src/lv_objx/lv_tileview.c components/lvgl/src/lv_objx/lv_win.c components/lvgl/src/lv_themes/lv_theme.c components/lvgl/src/lv_themes/lv_theme_alien.c components/lvgl/src/lv_themes/lv_theme_default.c components/lvgl/src/lv_themes/lv_theme_material.c components/lvgl/src/lv_themes/lv_theme_mono.c components/lvgl/src/lv_themes/lv_theme_nemo.c components/lvgl/src/lv_themes/lv_theme_night.c components/lvgl/src/lv_themes/lv_theme_templ.c components/lvgl/src/lv_themes/lv_theme_zen.c components/SPI/spi_common/spi_common.c components/SPI/spi_devices/io/MCP23S08/mcp23s08.c main/controller/gui.c main/controller/controller.c main/controller/modbus_server.c main/controller/ciclo.c main/controller/gt_cesto.c main/controller/gt_riscaldamento.c main/controller/gt_ventilazione.c main/controller/gt_allarmi.c main/controller/gt_reset_bruciatore.c main/controller/gt_macchina_occupata.c main/controller/gt_presenza_aria.c main/model/descriptions/AUTOGEN_FILE_parmac.c main/model/model.c main/model/parmac.c main/model/parciclo.c main/peripherals/system.c main/peripherals/NT7534.c main/peripherals/digin.c main/peripherals/i2c_devices.c main/peripherals/timer.c main/peripherals/ptc.c main/peripherals/pwoff.c main/peripherals/digout.c main/peripherals/keyboard.c main/peripherals/temperature.c main/peripherals/spi.c main/peripherals/pwm.c main/peripherals/gettoniera.c main/peripherals/uart_driver.c main/peripherals/traps.c main/peripherals/led.c main/utils/assert.c main/utils/lightmodbus-impl.c main/view/fonts/hsw8x8.c main/view/fonts/legacy_fonts.c main/view/fonts/hsw8x16.c main/view/fonts/hsw6x8.c main/view/images/legacy_img_insert_coin.c main/view/images/legacy_img_programs.c main/view/images/legacy_img_warning.c main/view/images/legacy_img_stop.c main/view/images/legacy_img_program_caldo.c main/view/images/legacy_img_program_tiepido.c main/view/images/lgacy_img_program_medio.c main/view/images/legacy_img_program_lana.c main/view/images/legacy_img_program_freddo.c main/view/images/legacy_img_logo_hoover.c main/view/images/legacy_img_logo_ciao.c main/view/images/legacy_img_logo_hsw.c main/view/images/legacy_img_logo_msgroup.c main/view/images/legacy_img_logo_rotondi.c main/view/images/legacy_img_logo_schulthess.c main/view/images/legacy_img_chiudere_oblo.c main/view/images/legacy_img_aprire_oblo.c main/view/images/legacy_img_raffreddamento.c main/view/images/legacy_img_antipiega.c main/view/intl/intl.c main/view/intl/AUTOGEN_FILE_strings.c main/view/pages/page_main.c main/view/pages/page_temperature_test.c main/view/pages/page_digout_test.c main/view/pages/page_digin_test.c main/view/pages/page_pwm_test.c main/view/pages/page_led_test.c main/view/pages/page_parmac.c main/view/pages/page_info.c main/view/pages/page_scelta_programma.c main/view/pages/page_parciclo.c main/view/pages/page_splash.c main/view/pages/page_reset_ram.c main/view/pages/page_commissioning.c main/view/pages/page_coin_test.c main/view/pages/page_contrast.c main/view/pages/page_stats.c main/view/pages/page_ram_error.c main/view/widgets/custom_lv_img.c main/view/view.c main/view/common.c main/view/styles.c main/main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ256GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o: components/generic_embedded_libs/gel/collections/circular_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/collections" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/collections/circular_buffer.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o: components/generic_embedded_libs/gel/crc/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/crc" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/crc/crc16-ccitt.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o: components/generic_embedded_libs/gel/data_structures/struct_update.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/data_structures/struct_update.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o: components/generic_embedded_libs/gel/data_structures/watcher.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/data_structures/watcher.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o: components/generic_embedded_libs/gel/debounce/debounce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/debounce/debounce.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o: components/generic_embedded_libs/gel/debounce/pulsecounter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/debounce/pulsecounter.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o: components/generic_embedded_libs/gel/keypad/keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/keypad" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/keypad/keypad.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o: components/generic_embedded_libs/gel/pagemanager/page_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/pagemanager/page_manager.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o: components/generic_embedded_libs/gel/parameter/parameter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/parameter" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/parameter/parameter.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o: components/generic_embedded_libs/gel/timer/stopwatch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/timer" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/timer/stopwatch.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o: components/generic_embedded_libs/gel/wearleveling/wearleveling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/wearleveling/wearleveling.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o: components/I2C/i2c_common/i2c_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_common" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_common/i2c_common.c  -o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o: components/I2C/i2c_devices/eeprom/24LC16/24LC16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_devices/eeprom/24LC16/24LC16.c  -o ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o: components/I2C/i2c_ports/PIC/i2c_bitbang.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_ports/PIC" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_ports/PIC/i2c_bitbang.c  -o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o: components/I2C/i2c_ports/PIC/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_ports/PIC" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_ports/PIC/i2c_driver.c  -o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o: components/lvgl/porting/lv_port_disp_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/porting" 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/porting/lv_port_disp_template.c  -o ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o: components/lvgl/porting/lv_port_fs_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/porting" 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/porting/lv_port_fs_template.c  -o ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o: components/lvgl/porting/lv_port_indev_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/porting" 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/porting/lv_port_indev_template.c  -o ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o: components/lvgl/src/lv_core/lv_debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_debug.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o: components/lvgl/src/lv_core/lv_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_disp.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o: components/lvgl/src/lv_core/lv_group.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_group.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o: components/lvgl/src/lv_core/lv_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_indev.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o: components/lvgl/src/lv_core/lv_obj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_obj.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o: components/lvgl/src/lv_core/lv_refr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_refr.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o: components/lvgl/src/lv_core/lv_style.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_style.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o: components/lvgl/src/lv_draw/lv_draw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o: components/lvgl/src/lv_draw/lv_draw_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_arc.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o: components/lvgl/src/lv_draw/lv_draw_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_basic.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o: components/lvgl/src/lv_draw/lv_draw_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_img.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o: components/lvgl/src/lv_draw/lv_draw_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_label.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o: components/lvgl/src/lv_draw/lv_draw_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_line.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o: components/lvgl/src/lv_draw/lv_draw_rect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_rect.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o: components/lvgl/src/lv_draw/lv_draw_triangle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_triangle.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o: components/lvgl/src/lv_draw/lv_img_cache.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_img_cache.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o: components/lvgl/src/lv_draw/lv_img_decoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_img_decoder.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o: components/lvgl/src/lv_font/lv_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o: components/lvgl/src/lv_font/lv_font_fmt_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_fmt_txt.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o: components/lvgl/src/lv_font/lv_font_roboto_12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_12.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o: components/lvgl/src/lv_font/lv_font_roboto_12_subpx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_12_subpx.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o: components/lvgl/src/lv_font/lv_font_roboto_16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_16.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o: components/lvgl/src/lv_font/lv_font_roboto_22.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_22.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o: components/lvgl/src/lv_font/lv_font_roboto_28.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_28.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o: components/lvgl/src/lv_font/lv_font_roboto_28_compressed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_28_compressed.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o: components/lvgl/src/lv_font/lv_font_unscii_8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_unscii_8.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o: components/lvgl/src/lv_hal/lv_hal_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_hal/lv_hal_disp.c  -o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o: components/lvgl/src/lv_hal/lv_hal_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_hal/lv_hal_indev.c  -o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o: components/lvgl/src/lv_hal/lv_hal_tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_hal/lv_hal_tick.c  -o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o: components/lvgl/src/lv_misc/lv_anim.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_anim.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o: components/lvgl/src/lv_misc/lv_area.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_area.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o: components/lvgl/src/lv_misc/lv_async.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_async.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o: components/lvgl/src/lv_misc/lv_bidi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_bidi.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o: components/lvgl/src/lv_misc/lv_circ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_circ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o: components/lvgl/src/lv_misc/lv_color.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_color.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o: components/lvgl/src/lv_misc/lv_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_fs.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o: components/lvgl/src/lv_misc/lv_gc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_gc.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o: components/lvgl/src/lv_misc/lv_ll.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_ll.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o: components/lvgl/src/lv_misc/lv_log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_log.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o: components/lvgl/src/lv_misc/lv_math.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_math.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o: components/lvgl/src/lv_misc/lv_mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_mem.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o: components/lvgl/src/lv_misc/lv_printf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_printf.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o: components/lvgl/src/lv_misc/lv_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_task.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o: components/lvgl/src/lv_misc/lv_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_templ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o: components/lvgl/src/lv_misc/lv_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_txt.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o: components/lvgl/src/lv_misc/lv_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_utils.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o: components/lvgl/src/lv_objx/lv_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_arc.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o: components/lvgl/src/lv_objx/lv_bar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_bar.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o: components/lvgl/src/lv_objx/lv_btn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_btn.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o: components/lvgl/src/lv_objx/lv_btnm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_btnm.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o: components/lvgl/src/lv_objx/lv_calendar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_calendar.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o: components/lvgl/src/lv_objx/lv_canvas.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_canvas.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o: components/lvgl/src/lv_objx/lv_cb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_cb.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o: components/lvgl/src/lv_objx/lv_chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_chart.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o: components/lvgl/src/lv_objx/lv_cont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_cont.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o: components/lvgl/src/lv_objx/lv_cpicker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_cpicker.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o: components/lvgl/src/lv_objx/lv_ddlist.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_ddlist.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o: components/lvgl/src/lv_objx/lv_gauge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_gauge.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o: components/lvgl/src/lv_objx/lv_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_img.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o: components/lvgl/src/lv_objx/lv_imgbtn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_imgbtn.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o: components/lvgl/src/lv_objx/lv_kb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_kb.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o: components/lvgl/src/lv_objx/lv_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_label.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o: components/lvgl/src/lv_objx/lv_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_led.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o: components/lvgl/src/lv_objx/lv_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_line.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o: components/lvgl/src/lv_objx/lv_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_list.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o: components/lvgl/src/lv_objx/lv_lmeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_lmeter.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o: components/lvgl/src/lv_objx/lv_mbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_mbox.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o: components/lvgl/src/lv_objx/lv_objx_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_objx_templ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o: components/lvgl/src/lv_objx/lv_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_page.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o: components/lvgl/src/lv_objx/lv_preload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_preload.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o: components/lvgl/src/lv_objx/lv_roller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_roller.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o: components/lvgl/src/lv_objx/lv_slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_slider.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o: components/lvgl/src/lv_objx/lv_spinbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_spinbox.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o: components/lvgl/src/lv_objx/lv_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_sw.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o: components/lvgl/src/lv_objx/lv_ta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_ta.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o: components/lvgl/src/lv_objx/lv_table.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_table.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o: components/lvgl/src/lv_objx/lv_tabview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_tabview.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o: components/lvgl/src/lv_objx/lv_tileview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_tileview.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o: components/lvgl/src/lv_objx/lv_win.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_win.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o: components/lvgl/src/lv_themes/lv_theme.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o: components/lvgl/src/lv_themes/lv_theme_alien.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_alien.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o: components/lvgl/src/lv_themes/lv_theme_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_default.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o: components/lvgl/src/lv_themes/lv_theme_material.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_material.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o: components/lvgl/src/lv_themes/lv_theme_mono.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_mono.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o: components/lvgl/src/lv_themes/lv_theme_nemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_nemo.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o: components/lvgl/src/lv_themes/lv_theme_night.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_night.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o: components/lvgl/src/lv_themes/lv_theme_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_templ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o: components/lvgl/src/lv_themes/lv_theme_zen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_zen.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/SPI/spi_common/spi_common.o: components/SPI/spi_common/spi_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/SPI/spi_common" 
	@${RM} ${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d 
	@${RM} ${OBJECTDIR}/components/SPI/spi_common/spi_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/SPI/spi_common/spi_common.c  -o ${OBJECTDIR}/components/SPI/spi_common/spi_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o: components/SPI/spi_devices/io/MCP23S08/mcp23s08.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08" 
	@${RM} ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d 
	@${RM} ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/SPI/spi_devices/io/MCP23S08/mcp23s08.c  -o ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gui.o: main/controller/gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gui.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gui.c  -o ${OBJECTDIR}/main/controller/gui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gui.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gui.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/controller.o: main/controller/controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/controller.o.d 
	@${RM} ${OBJECTDIR}/main/controller/controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/controller.c  -o ${OBJECTDIR}/main/controller/controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/controller.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/controller.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/modbus_server.o: main/controller/modbus_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/modbus_server.o.d 
	@${RM} ${OBJECTDIR}/main/controller/modbus_server.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/modbus_server.c  -o ${OBJECTDIR}/main/controller/modbus_server.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/modbus_server.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/modbus_server.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/ciclo.o: main/controller/ciclo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/ciclo.o.d 
	@${RM} ${OBJECTDIR}/main/controller/ciclo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/ciclo.c  -o ${OBJECTDIR}/main/controller/ciclo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/ciclo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/ciclo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_cesto.o: main/controller/gt_cesto.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_cesto.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_cesto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_cesto.c  -o ${OBJECTDIR}/main/controller/gt_cesto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_cesto.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_cesto.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_riscaldamento.o: main/controller/gt_riscaldamento.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_riscaldamento.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_riscaldamento.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_riscaldamento.c  -o ${OBJECTDIR}/main/controller/gt_riscaldamento.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_riscaldamento.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_riscaldamento.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_ventilazione.o: main/controller/gt_ventilazione.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_ventilazione.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_ventilazione.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_ventilazione.c  -o ${OBJECTDIR}/main/controller/gt_ventilazione.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_ventilazione.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_ventilazione.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_allarmi.o: main/controller/gt_allarmi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_allarmi.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_allarmi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_allarmi.c  -o ${OBJECTDIR}/main/controller/gt_allarmi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_allarmi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_allarmi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_reset_bruciatore.o: main/controller/gt_reset_bruciatore.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_reset_bruciatore.c  -o ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_macchina_occupata.o: main/controller/gt_macchina_occupata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_macchina_occupata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_macchina_occupata.c  -o ${OBJECTDIR}/main/controller/gt_macchina_occupata.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_presenza_aria.o: main/controller/gt_presenza_aria.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_presenza_aria.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_presenza_aria.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_presenza_aria.c  -o ${OBJECTDIR}/main/controller/gt_presenza_aria.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_presenza_aria.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_presenza_aria.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o: main/model/descriptions/AUTOGEN_FILE_parmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model/descriptions" 
	@${RM} ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d 
	@${RM} ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/descriptions/AUTOGEN_FILE_parmac.c  -o ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/model.o: main/model/model.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model" 
	@${RM} ${OBJECTDIR}/main/model/model.o.d 
	@${RM} ${OBJECTDIR}/main/model/model.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/model.c  -o ${OBJECTDIR}/main/model/model.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/model.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/model.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/parmac.o: main/model/parmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model" 
	@${RM} ${OBJECTDIR}/main/model/parmac.o.d 
	@${RM} ${OBJECTDIR}/main/model/parmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/parmac.c  -o ${OBJECTDIR}/main/model/parmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/parmac.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/parmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/parciclo.o: main/model/parciclo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model" 
	@${RM} ${OBJECTDIR}/main/model/parciclo.o.d 
	@${RM} ${OBJECTDIR}/main/model/parciclo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/parciclo.c  -o ${OBJECTDIR}/main/model/parciclo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/parciclo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/parciclo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/system.o: main/peripherals/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/system.c  -o ${OBJECTDIR}/main/peripherals/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/NT7534.o: main/peripherals/NT7534.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/NT7534.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/NT7534.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/NT7534.c  -o ${OBJECTDIR}/main/peripherals/NT7534.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/NT7534.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/NT7534.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/digin.o: main/peripherals/digin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/digin.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/digin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/digin.c  -o ${OBJECTDIR}/main/peripherals/digin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/digin.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/digin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/i2c_devices.o: main/peripherals/i2c_devices.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c_devices.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c_devices.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/i2c_devices.c  -o ${OBJECTDIR}/main/peripherals/i2c_devices.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/i2c_devices.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/i2c_devices.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/timer.o: main/peripherals/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/timer.c  -o ${OBJECTDIR}/main/peripherals/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/ptc.o: main/peripherals/ptc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/ptc.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/ptc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/ptc.c  -o ${OBJECTDIR}/main/peripherals/ptc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/ptc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/ptc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/pwoff.o: main/peripherals/pwoff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/pwoff.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/pwoff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/pwoff.c  -o ${OBJECTDIR}/main/peripherals/pwoff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/pwoff.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/pwoff.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/digout.o: main/peripherals/digout.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/digout.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/digout.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/digout.c  -o ${OBJECTDIR}/main/peripherals/digout.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/digout.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/digout.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/keyboard.o: main/peripherals/keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/keyboard.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/keyboard.c  -o ${OBJECTDIR}/main/peripherals/keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/temperature.o: main/peripherals/temperature.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/temperature.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/temperature.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/temperature.c  -o ${OBJECTDIR}/main/peripherals/temperature.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/temperature.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/temperature.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/spi.o: main/peripherals/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/spi.c  -o ${OBJECTDIR}/main/peripherals/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/pwm.o: main/peripherals/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/pwm.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/pwm.c  -o ${OBJECTDIR}/main/peripherals/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/gettoniera.o: main/peripherals/gettoniera.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/gettoniera.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/gettoniera.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/gettoniera.c  -o ${OBJECTDIR}/main/peripherals/gettoniera.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/gettoniera.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/gettoniera.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/uart_driver.o: main/peripherals/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/uart_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/uart_driver.c  -o ${OBJECTDIR}/main/peripherals/uart_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/uart_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/uart_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/traps.o: main/peripherals/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/traps.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/traps.c  -o ${OBJECTDIR}/main/peripherals/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/led.o: main/peripherals/led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/led.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/led.c  -o ${OBJECTDIR}/main/peripherals/led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/utils/assert.o: main/utils/assert.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/utils" 
	@${RM} ${OBJECTDIR}/main/utils/assert.o.d 
	@${RM} ${OBJECTDIR}/main/utils/assert.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/utils/assert.c  -o ${OBJECTDIR}/main/utils/assert.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/utils/assert.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/utils/assert.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/utils/lightmodbus-impl.o: main/utils/lightmodbus-impl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/utils" 
	@${RM} ${OBJECTDIR}/main/utils/lightmodbus-impl.o.d 
	@${RM} ${OBJECTDIR}/main/utils/lightmodbus-impl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/utils/lightmodbus-impl.c  -o ${OBJECTDIR}/main/utils/lightmodbus-impl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/utils/lightmodbus-impl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/utils/lightmodbus-impl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/hsw8x8.o: main/view/fonts/hsw8x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x8.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/hsw8x8.c  -o ${OBJECTDIR}/main/view/fonts/hsw8x8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/hsw8x8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/hsw8x8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/legacy_fonts.o: main/view/fonts/legacy_fonts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/legacy_fonts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/legacy_fonts.c  -o ${OBJECTDIR}/main/view/fonts/legacy_fonts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/hsw8x16.o: main/view/fonts/hsw8x16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x16.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/hsw8x16.c  -o ${OBJECTDIR}/main/view/fonts/hsw8x16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/hsw8x16.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/hsw8x16.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/hsw6x8.o: main/view/fonts/hsw6x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw6x8.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw6x8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/hsw6x8.c  -o ${OBJECTDIR}/main/view/fonts/hsw6x8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/hsw6x8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/hsw6x8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o: main/view/images/legacy_img_insert_coin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_insert_coin.c  -o ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_programs.o: main/view/images/legacy_img_programs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_programs.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_programs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_programs.c  -o ${OBJECTDIR}/main/view/images/legacy_img_programs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_programs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_programs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_warning.o: main/view/images/legacy_img_warning.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_warning.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_warning.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_warning.c  -o ${OBJECTDIR}/main/view/images/legacy_img_warning.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_warning.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_warning.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_stop.o: main/view/images/legacy_img_stop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_stop.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_stop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_stop.c  -o ${OBJECTDIR}/main/view/images/legacy_img_stop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_stop.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_stop.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o: main/view/images/legacy_img_program_caldo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_caldo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o: main/view/images/legacy_img_program_tiepido.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_tiepido.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o: main/view/images/lgacy_img_program_medio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/lgacy_img_program_medio.c  -o ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_lana.o: main/view/images/legacy_img_program_lana.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_lana.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o: main/view/images/legacy_img_program_freddo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_freddo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o: main/view/images/legacy_img_logo_hoover.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_hoover.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o: main/view/images/legacy_img_logo_ciao.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_ciao.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o: main/view/images/legacy_img_logo_hsw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_hsw.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o: main/view/images/legacy_img_logo_msgroup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_msgroup.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o: main/view/images/legacy_img_logo_rotondi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_rotondi.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o: main/view/images/legacy_img_logo_schulthess.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_schulthess.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o: main/view/images/legacy_img_chiudere_oblo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_chiudere_oblo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o: main/view/images/legacy_img_aprire_oblo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_aprire_oblo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o: main/view/images/legacy_img_raffreddamento.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_raffreddamento.c  -o ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_antipiega.o: main/view/images/legacy_img_antipiega.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_antipiega.c  -o ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/intl/intl.o: main/view/intl/intl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/intl" 
	@${RM} ${OBJECTDIR}/main/view/intl/intl.o.d 
	@${RM} ${OBJECTDIR}/main/view/intl/intl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/intl/intl.c  -o ${OBJECTDIR}/main/view/intl/intl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/intl/intl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/intl/intl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o: main/view/intl/AUTOGEN_FILE_strings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/intl" 
	@${RM} ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d 
	@${RM} ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/intl/AUTOGEN_FILE_strings.c  -o ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_main.o: main/view/pages/page_main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_main.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_main.c  -o ${OBJECTDIR}/main/view/pages/page_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_temperature_test.o: main/view/pages/page_temperature_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_temperature_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_temperature_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_temperature_test.c  -o ${OBJECTDIR}/main/view/pages/page_temperature_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_temperature_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_temperature_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_digout_test.o: main/view/pages/page_digout_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digout_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digout_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_digout_test.c  -o ${OBJECTDIR}/main/view/pages/page_digout_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_digout_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_digout_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_digin_test.o: main/view/pages/page_digin_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digin_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digin_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_digin_test.c  -o ${OBJECTDIR}/main/view/pages/page_digin_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_digin_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_digin_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_pwm_test.o: main/view/pages/page_pwm_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_pwm_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_pwm_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_pwm_test.c  -o ${OBJECTDIR}/main/view/pages/page_pwm_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_pwm_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_pwm_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_led_test.o: main/view/pages/page_led_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_led_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_led_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_led_test.c  -o ${OBJECTDIR}/main/view/pages/page_led_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_led_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_led_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_parmac.o: main/view/pages/page_parmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parmac.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_parmac.c  -o ${OBJECTDIR}/main/view/pages/page_parmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_parmac.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_parmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_info.o: main/view/pages/page_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_info.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_info.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_info.c  -o ${OBJECTDIR}/main/view/pages/page_info.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_info.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_info.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_scelta_programma.o: main/view/pages/page_scelta_programma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_scelta_programma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_scelta_programma.c  -o ${OBJECTDIR}/main/view/pages/page_scelta_programma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_parciclo.o: main/view/pages/page_parciclo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parciclo.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parciclo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_parciclo.c  -o ${OBJECTDIR}/main/view/pages/page_parciclo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_parciclo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_parciclo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_splash.o: main/view/pages/page_splash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_splash.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_splash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_splash.c  -o ${OBJECTDIR}/main/view/pages/page_splash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_splash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_splash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_reset_ram.o: main/view/pages/page_reset_ram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_reset_ram.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_reset_ram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_reset_ram.c  -o ${OBJECTDIR}/main/view/pages/page_reset_ram.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_reset_ram.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_reset_ram.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_commissioning.o: main/view/pages/page_commissioning.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_commissioning.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_commissioning.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_commissioning.c  -o ${OBJECTDIR}/main/view/pages/page_commissioning.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_commissioning.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_commissioning.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_coin_test.o: main/view/pages/page_coin_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_coin_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_coin_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_coin_test.c  -o ${OBJECTDIR}/main/view/pages/page_coin_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_coin_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_coin_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_contrast.o: main/view/pages/page_contrast.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_contrast.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_contrast.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_contrast.c  -o ${OBJECTDIR}/main/view/pages/page_contrast.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_contrast.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_contrast.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_stats.o: main/view/pages/page_stats.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_stats.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_stats.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_stats.c  -o ${OBJECTDIR}/main/view/pages/page_stats.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_stats.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_stats.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_ram_error.o: main/view/pages/page_ram_error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_ram_error.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_ram_error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_ram_error.c  -o ${OBJECTDIR}/main/view/pages/page_ram_error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_ram_error.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_ram_error.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/widgets/custom_lv_img.o: main/view/widgets/custom_lv_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/widgets" 
	@${RM} ${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d 
	@${RM} ${OBJECTDIR}/main/view/widgets/custom_lv_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/widgets/custom_lv_img.c  -o ${OBJECTDIR}/main/view/widgets/custom_lv_img.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/view.o: main/view/view.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view" 
	@${RM} ${OBJECTDIR}/main/view/view.o.d 
	@${RM} ${OBJECTDIR}/main/view/view.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/view.c  -o ${OBJECTDIR}/main/view/view.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/view.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/view.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/common.o: main/view/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view" 
	@${RM} ${OBJECTDIR}/main/view/common.o.d 
	@${RM} ${OBJECTDIR}/main/view/common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/common.c  -o ${OBJECTDIR}/main/view/common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/common.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/styles.o: main/view/styles.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view" 
	@${RM} ${OBJECTDIR}/main/view/styles.o.d 
	@${RM} ${OBJECTDIR}/main/view/styles.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/styles.c  -o ${OBJECTDIR}/main/view/styles.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/styles.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/styles.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/main.o: main/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main" 
	@${RM} ${OBJECTDIR}/main/main.o.d 
	@${RM} ${OBJECTDIR}/main/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/main.c  -o ${OBJECTDIR}/main/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o: components/generic_embedded_libs/gel/collections/circular_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/collections" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/collections/circular_buffer.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/collections/circular_buffer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o: components/generic_embedded_libs/gel/crc/crc16-ccitt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/crc" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/crc/crc16-ccitt.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/crc/crc16-ccitt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o: components/generic_embedded_libs/gel/data_structures/struct_update.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/data_structures/struct_update.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/struct_update.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o: components/generic_embedded_libs/gel/data_structures/watcher.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/data_structures/watcher.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/data_structures/watcher.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o: components/generic_embedded_libs/gel/debounce/debounce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/debounce/debounce.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/debounce.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o: components/generic_embedded_libs/gel/debounce/pulsecounter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/debounce/pulsecounter.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/debounce/pulsecounter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o: components/generic_embedded_libs/gel/keypad/keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/keypad" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/keypad/keypad.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/keypad/keypad.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o: components/generic_embedded_libs/gel/pagemanager/page_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/pagemanager/page_manager.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/pagemanager/page_manager.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o: components/generic_embedded_libs/gel/parameter/parameter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/parameter" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/parameter/parameter.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/parameter/parameter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o: components/generic_embedded_libs/gel/timer/stopwatch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/timer" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/timer/stopwatch.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/timer/stopwatch.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o: components/generic_embedded_libs/gel/wearleveling/wearleveling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling" 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d 
	@${RM} ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/generic_embedded_libs/gel/wearleveling/wearleveling.c  -o ${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/generic_embedded_libs/gel/wearleveling/wearleveling.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o: components/I2C/i2c_common/i2c_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_common" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_common/i2c_common.c  -o ${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_common/i2c_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o: components/I2C/i2c_devices/eeprom/24LC16/24LC16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_devices/eeprom/24LC16/24LC16.c  -o ${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_devices/eeprom/24LC16/24LC16.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o: components/I2C/i2c_ports/PIC/i2c_bitbang.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_ports/PIC" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_ports/PIC/i2c_bitbang.c  -o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_bitbang.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o: components/I2C/i2c_ports/PIC/i2c_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/I2C/i2c_ports/PIC" 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d 
	@${RM} ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/I2C/i2c_ports/PIC/i2c_driver.c  -o ${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/I2C/i2c_ports/PIC/i2c_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o: components/lvgl/porting/lv_port_disp_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/porting" 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/porting/lv_port_disp_template.c  -o ${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/porting/lv_port_disp_template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o: components/lvgl/porting/lv_port_fs_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/porting" 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/porting/lv_port_fs_template.c  -o ${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/porting/lv_port_fs_template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o: components/lvgl/porting/lv_port_indev_template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/porting" 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/porting/lv_port_indev_template.c  -o ${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/porting/lv_port_indev_template.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o: components/lvgl/src/lv_core/lv_debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_debug.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_debug.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o: components/lvgl/src/lv_core/lv_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_disp.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_disp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o: components/lvgl/src/lv_core/lv_group.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_group.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_group.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o: components/lvgl/src/lv_core/lv_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_indev.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_indev.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o: components/lvgl/src/lv_core/lv_obj.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_obj.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_obj.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o: components/lvgl/src/lv_core/lv_refr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_refr.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_refr.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o: components/lvgl/src/lv_core/lv_style.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_core" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_core/lv_style.c  -o ${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_core/lv_style.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o: components/lvgl/src/lv_draw/lv_draw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o: components/lvgl/src/lv_draw/lv_draw_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_arc.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_arc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o: components/lvgl/src/lv_draw/lv_draw_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_basic.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_basic.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o: components/lvgl/src/lv_draw/lv_draw_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_img.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_img.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o: components/lvgl/src/lv_draw/lv_draw_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_label.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_label.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o: components/lvgl/src/lv_draw/lv_draw_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_line.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_line.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o: components/lvgl/src/lv_draw/lv_draw_rect.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_rect.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_rect.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o: components/lvgl/src/lv_draw/lv_draw_triangle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_draw_triangle.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_draw_triangle.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o: components/lvgl/src/lv_draw/lv_img_cache.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_img_cache.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_cache.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o: components/lvgl/src/lv_draw/lv_img_decoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_draw" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_draw/lv_img_decoder.c  -o ${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_draw/lv_img_decoder.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o: components/lvgl/src/lv_font/lv_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o: components/lvgl/src/lv_font/lv_font_fmt_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_fmt_txt.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_fmt_txt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o: components/lvgl/src/lv_font/lv_font_roboto_12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_12.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o: components/lvgl/src/lv_font/lv_font_roboto_12_subpx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_12_subpx.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_12_subpx.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o: components/lvgl/src/lv_font/lv_font_roboto_16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_16.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_16.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o: components/lvgl/src/lv_font/lv_font_roboto_22.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_22.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_22.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o: components/lvgl/src/lv_font/lv_font_roboto_28.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_28.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o: components/lvgl/src/lv_font/lv_font_roboto_28_compressed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_roboto_28_compressed.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_roboto_28_compressed.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o: components/lvgl/src/lv_font/lv_font_unscii_8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_font" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_font/lv_font_unscii_8.c  -o ${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_font/lv_font_unscii_8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o: components/lvgl/src/lv_hal/lv_hal_disp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_hal/lv_hal_disp.c  -o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_disp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o: components/lvgl/src/lv_hal/lv_hal_indev.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_hal/lv_hal_indev.c  -o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_indev.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o: components/lvgl/src/lv_hal/lv_hal_tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_hal" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_hal/lv_hal_tick.c  -o ${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_hal/lv_hal_tick.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o: components/lvgl/src/lv_misc/lv_anim.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_anim.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_anim.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o: components/lvgl/src/lv_misc/lv_area.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_area.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_area.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o: components/lvgl/src/lv_misc/lv_async.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_async.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_async.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o: components/lvgl/src/lv_misc/lv_bidi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_bidi.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_bidi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o: components/lvgl/src/lv_misc/lv_circ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_circ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_circ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o: components/lvgl/src/lv_misc/lv_color.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_color.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_color.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o: components/lvgl/src/lv_misc/lv_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_fs.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_fs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o: components/lvgl/src/lv_misc/lv_gc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_gc.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_gc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o: components/lvgl/src/lv_misc/lv_ll.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_ll.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_ll.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o: components/lvgl/src/lv_misc/lv_log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_log.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_log.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o: components/lvgl/src/lv_misc/lv_math.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_math.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_math.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o: components/lvgl/src/lv_misc/lv_mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_mem.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_mem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o: components/lvgl/src/lv_misc/lv_printf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_printf.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_printf.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o: components/lvgl/src/lv_misc/lv_task.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_task.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_task.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o: components/lvgl/src/lv_misc/lv_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_templ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_templ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o: components/lvgl/src/lv_misc/lv_txt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_txt.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_txt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o: components/lvgl/src/lv_misc/lv_utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_misc" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_misc/lv_utils.c  -o ${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_misc/lv_utils.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o: components/lvgl/src/lv_objx/lv_arc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_arc.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_arc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o: components/lvgl/src/lv_objx/lv_bar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_bar.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_bar.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o: components/lvgl/src/lv_objx/lv_btn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_btn.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btn.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o: components/lvgl/src/lv_objx/lv_btnm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_btnm.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_btnm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o: components/lvgl/src/lv_objx/lv_calendar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_calendar.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_calendar.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o: components/lvgl/src/lv_objx/lv_canvas.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_canvas.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_canvas.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o: components/lvgl/src/lv_objx/lv_cb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_cb.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o: components/lvgl/src/lv_objx/lv_chart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_chart.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_chart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o: components/lvgl/src/lv_objx/lv_cont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_cont.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cont.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o: components/lvgl/src/lv_objx/lv_cpicker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_cpicker.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_cpicker.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o: components/lvgl/src/lv_objx/lv_ddlist.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_ddlist.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ddlist.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o: components/lvgl/src/lv_objx/lv_gauge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_gauge.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_gauge.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o: components/lvgl/src/lv_objx/lv_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_img.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_img.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o: components/lvgl/src/lv_objx/lv_imgbtn.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_imgbtn.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_imgbtn.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o: components/lvgl/src/lv_objx/lv_kb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_kb.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_kb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o: components/lvgl/src/lv_objx/lv_label.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_label.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_label.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o: components/lvgl/src/lv_objx/lv_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_led.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o: components/lvgl/src/lv_objx/lv_line.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_line.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_line.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o: components/lvgl/src/lv_objx/lv_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_list.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_list.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o: components/lvgl/src/lv_objx/lv_lmeter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_lmeter.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_lmeter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o: components/lvgl/src/lv_objx/lv_mbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_mbox.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_mbox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o: components/lvgl/src/lv_objx/lv_objx_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_objx_templ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_objx_templ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o: components/lvgl/src/lv_objx/lv_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_page.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_page.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o: components/lvgl/src/lv_objx/lv_preload.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_preload.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_preload.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o: components/lvgl/src/lv_objx/lv_roller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_roller.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_roller.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o: components/lvgl/src/lv_objx/lv_slider.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_slider.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_slider.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o: components/lvgl/src/lv_objx/lv_spinbox.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_spinbox.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_spinbox.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o: components/lvgl/src/lv_objx/lv_sw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_sw.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_sw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o: components/lvgl/src/lv_objx/lv_ta.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_ta.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_ta.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o: components/lvgl/src/lv_objx/lv_table.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_table.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_table.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o: components/lvgl/src/lv_objx/lv_tabview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_tabview.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tabview.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o: components/lvgl/src/lv_objx/lv_tileview.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_tileview.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_tileview.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o: components/lvgl/src/lv_objx/lv_win.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_objx" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_objx/lv_win.c  -o ${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_objx/lv_win.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o: components/lvgl/src/lv_themes/lv_theme.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o: components/lvgl/src/lv_themes/lv_theme_alien.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_alien.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_alien.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o: components/lvgl/src/lv_themes/lv_theme_default.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_default.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_default.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o: components/lvgl/src/lv_themes/lv_theme_material.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_material.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_material.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o: components/lvgl/src/lv_themes/lv_theme_mono.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_mono.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_mono.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o: components/lvgl/src/lv_themes/lv_theme_nemo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_nemo.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_nemo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o: components/lvgl/src/lv_themes/lv_theme_night.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_night.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_night.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o: components/lvgl/src/lv_themes/lv_theme_templ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_templ.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_templ.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o: components/lvgl/src/lv_themes/lv_theme_zen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/lvgl/src/lv_themes" 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d 
	@${RM} ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/lvgl/src/lv_themes/lv_theme_zen.c  -o ${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/lvgl/src/lv_themes/lv_theme_zen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/SPI/spi_common/spi_common.o: components/SPI/spi_common/spi_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/SPI/spi_common" 
	@${RM} ${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d 
	@${RM} ${OBJECTDIR}/components/SPI/spi_common/spi_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/SPI/spi_common/spi_common.c  -o ${OBJECTDIR}/components/SPI/spi_common/spi_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/SPI/spi_common/spi_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o: components/SPI/spi_devices/io/MCP23S08/mcp23s08.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08" 
	@${RM} ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d 
	@${RM} ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  components/SPI/spi_devices/io/MCP23S08/mcp23s08.c  -o ${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/components/SPI/spi_devices/io/MCP23S08/mcp23s08.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gui.o: main/controller/gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gui.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gui.c  -o ${OBJECTDIR}/main/controller/gui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gui.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gui.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/controller.o: main/controller/controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/controller.o.d 
	@${RM} ${OBJECTDIR}/main/controller/controller.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/controller.c  -o ${OBJECTDIR}/main/controller/controller.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/controller.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/controller.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/modbus_server.o: main/controller/modbus_server.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/modbus_server.o.d 
	@${RM} ${OBJECTDIR}/main/controller/modbus_server.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/modbus_server.c  -o ${OBJECTDIR}/main/controller/modbus_server.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/modbus_server.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/modbus_server.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/ciclo.o: main/controller/ciclo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/ciclo.o.d 
	@${RM} ${OBJECTDIR}/main/controller/ciclo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/ciclo.c  -o ${OBJECTDIR}/main/controller/ciclo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/ciclo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/ciclo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_cesto.o: main/controller/gt_cesto.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_cesto.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_cesto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_cesto.c  -o ${OBJECTDIR}/main/controller/gt_cesto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_cesto.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_cesto.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_riscaldamento.o: main/controller/gt_riscaldamento.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_riscaldamento.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_riscaldamento.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_riscaldamento.c  -o ${OBJECTDIR}/main/controller/gt_riscaldamento.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_riscaldamento.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_riscaldamento.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_ventilazione.o: main/controller/gt_ventilazione.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_ventilazione.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_ventilazione.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_ventilazione.c  -o ${OBJECTDIR}/main/controller/gt_ventilazione.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_ventilazione.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_ventilazione.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_allarmi.o: main/controller/gt_allarmi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_allarmi.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_allarmi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_allarmi.c  -o ${OBJECTDIR}/main/controller/gt_allarmi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_allarmi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_allarmi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_reset_bruciatore.o: main/controller/gt_reset_bruciatore.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_reset_bruciatore.c  -o ${OBJECTDIR}/main/controller/gt_reset_bruciatore.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_reset_bruciatore.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_macchina_occupata.o: main/controller/gt_macchina_occupata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_macchina_occupata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_macchina_occupata.c  -o ${OBJECTDIR}/main/controller/gt_macchina_occupata.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_macchina_occupata.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/controller/gt_presenza_aria.o: main/controller/gt_presenza_aria.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/controller" 
	@${RM} ${OBJECTDIR}/main/controller/gt_presenza_aria.o.d 
	@${RM} ${OBJECTDIR}/main/controller/gt_presenza_aria.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/controller/gt_presenza_aria.c  -o ${OBJECTDIR}/main/controller/gt_presenza_aria.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/controller/gt_presenza_aria.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/controller/gt_presenza_aria.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o: main/model/descriptions/AUTOGEN_FILE_parmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model/descriptions" 
	@${RM} ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d 
	@${RM} ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/descriptions/AUTOGEN_FILE_parmac.c  -o ${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/descriptions/AUTOGEN_FILE_parmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/model.o: main/model/model.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model" 
	@${RM} ${OBJECTDIR}/main/model/model.o.d 
	@${RM} ${OBJECTDIR}/main/model/model.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/model.c  -o ${OBJECTDIR}/main/model/model.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/model.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/model.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/parmac.o: main/model/parmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model" 
	@${RM} ${OBJECTDIR}/main/model/parmac.o.d 
	@${RM} ${OBJECTDIR}/main/model/parmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/parmac.c  -o ${OBJECTDIR}/main/model/parmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/parmac.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/parmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/model/parciclo.o: main/model/parciclo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/model" 
	@${RM} ${OBJECTDIR}/main/model/parciclo.o.d 
	@${RM} ${OBJECTDIR}/main/model/parciclo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/model/parciclo.c  -o ${OBJECTDIR}/main/model/parciclo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/model/parciclo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/model/parciclo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/system.o: main/peripherals/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/system.c  -o ${OBJECTDIR}/main/peripherals/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/NT7534.o: main/peripherals/NT7534.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/NT7534.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/NT7534.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/NT7534.c  -o ${OBJECTDIR}/main/peripherals/NT7534.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/NT7534.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/NT7534.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/digin.o: main/peripherals/digin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/digin.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/digin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/digin.c  -o ${OBJECTDIR}/main/peripherals/digin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/digin.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/digin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/i2c_devices.o: main/peripherals/i2c_devices.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c_devices.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/i2c_devices.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/i2c_devices.c  -o ${OBJECTDIR}/main/peripherals/i2c_devices.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/i2c_devices.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/i2c_devices.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/timer.o: main/peripherals/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/timer.c  -o ${OBJECTDIR}/main/peripherals/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/timer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/ptc.o: main/peripherals/ptc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/ptc.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/ptc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/ptc.c  -o ${OBJECTDIR}/main/peripherals/ptc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/ptc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/ptc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/pwoff.o: main/peripherals/pwoff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/pwoff.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/pwoff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/pwoff.c  -o ${OBJECTDIR}/main/peripherals/pwoff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/pwoff.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/pwoff.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/digout.o: main/peripherals/digout.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/digout.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/digout.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/digout.c  -o ${OBJECTDIR}/main/peripherals/digout.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/digout.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/digout.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/keyboard.o: main/peripherals/keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/keyboard.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/keyboard.c  -o ${OBJECTDIR}/main/peripherals/keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/keyboard.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/temperature.o: main/peripherals/temperature.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/temperature.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/temperature.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/temperature.c  -o ${OBJECTDIR}/main/peripherals/temperature.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/temperature.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/temperature.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/spi.o: main/peripherals/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/spi.c  -o ${OBJECTDIR}/main/peripherals/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/pwm.o: main/peripherals/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/pwm.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/pwm.c  -o ${OBJECTDIR}/main/peripherals/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/pwm.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/gettoniera.o: main/peripherals/gettoniera.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/gettoniera.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/gettoniera.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/gettoniera.c  -o ${OBJECTDIR}/main/peripherals/gettoniera.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/gettoniera.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/gettoniera.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/uart_driver.o: main/peripherals/uart_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/uart_driver.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/uart_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/uart_driver.c  -o ${OBJECTDIR}/main/peripherals/uart_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/uart_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/uart_driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/traps.o: main/peripherals/traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/traps.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/traps.c  -o ${OBJECTDIR}/main/peripherals/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/peripherals/led.o: main/peripherals/led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/peripherals" 
	@${RM} ${OBJECTDIR}/main/peripherals/led.o.d 
	@${RM} ${OBJECTDIR}/main/peripherals/led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/peripherals/led.c  -o ${OBJECTDIR}/main/peripherals/led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/peripherals/led.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/peripherals/led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/utils/assert.o: main/utils/assert.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/utils" 
	@${RM} ${OBJECTDIR}/main/utils/assert.o.d 
	@${RM} ${OBJECTDIR}/main/utils/assert.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/utils/assert.c  -o ${OBJECTDIR}/main/utils/assert.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/utils/assert.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/utils/assert.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/utils/lightmodbus-impl.o: main/utils/lightmodbus-impl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/utils" 
	@${RM} ${OBJECTDIR}/main/utils/lightmodbus-impl.o.d 
	@${RM} ${OBJECTDIR}/main/utils/lightmodbus-impl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/utils/lightmodbus-impl.c  -o ${OBJECTDIR}/main/utils/lightmodbus-impl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/utils/lightmodbus-impl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/utils/lightmodbus-impl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/hsw8x8.o: main/view/fonts/hsw8x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x8.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/hsw8x8.c  -o ${OBJECTDIR}/main/view/fonts/hsw8x8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/hsw8x8.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/hsw8x8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/legacy_fonts.o: main/view/fonts/legacy_fonts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/legacy_fonts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/legacy_fonts.c  -o ${OBJECTDIR}/main/view/fonts/legacy_fonts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/legacy_fonts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/hsw8x16.o: main/view/fonts/hsw8x16.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x16.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw8x16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/hsw8x16.c  -o ${OBJECTDIR}/main/view/fonts/hsw8x16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/hsw8x16.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/hsw8x16.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/fonts/hsw6x8.o: main/view/fonts/hsw6x8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/fonts" 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw6x8.o.d 
	@${RM} ${OBJECTDIR}/main/view/fonts/hsw6x8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/fonts/hsw6x8.c  -o ${OBJECTDIR}/main/view/fonts/hsw6x8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/fonts/hsw6x8.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/fonts/hsw6x8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o: main/view/images/legacy_img_insert_coin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_insert_coin.c  -o ${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_insert_coin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_programs.o: main/view/images/legacy_img_programs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_programs.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_programs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_programs.c  -o ${OBJECTDIR}/main/view/images/legacy_img_programs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_programs.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_programs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_warning.o: main/view/images/legacy_img_warning.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_warning.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_warning.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_warning.c  -o ${OBJECTDIR}/main/view/images/legacy_img_warning.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_warning.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_warning.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_stop.o: main/view/images/legacy_img_stop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_stop.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_stop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_stop.c  -o ${OBJECTDIR}/main/view/images/legacy_img_stop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_stop.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_stop.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o: main/view/images/legacy_img_program_caldo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_caldo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_caldo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o: main/view/images/legacy_img_program_tiepido.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_tiepido.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_tiepido.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o: main/view/images/lgacy_img_program_medio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/lgacy_img_program_medio.c  -o ${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/lgacy_img_program_medio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_lana.o: main/view/images/legacy_img_program_lana.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_lana.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_lana.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_lana.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o: main/view/images/legacy_img_program_freddo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_program_freddo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_program_freddo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o: main/view/images/legacy_img_logo_hoover.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_hoover.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_hoover.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o: main/view/images/legacy_img_logo_ciao.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_ciao.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_ciao.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o: main/view/images/legacy_img_logo_hsw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_hsw.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_hsw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o: main/view/images/legacy_img_logo_msgroup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_msgroup.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_msgroup.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o: main/view/images/legacy_img_logo_rotondi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_rotondi.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_rotondi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o: main/view/images/legacy_img_logo_schulthess.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_logo_schulthess.c  -o ${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_logo_schulthess.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o: main/view/images/legacy_img_chiudere_oblo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_chiudere_oblo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_chiudere_oblo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o: main/view/images/legacy_img_aprire_oblo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_aprire_oblo.c  -o ${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_aprire_oblo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o: main/view/images/legacy_img_raffreddamento.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_raffreddamento.c  -o ${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_raffreddamento.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/images/legacy_img_antipiega.o: main/view/images/legacy_img_antipiega.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/images" 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d 
	@${RM} ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/images/legacy_img_antipiega.c  -o ${OBJECTDIR}/main/view/images/legacy_img_antipiega.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/images/legacy_img_antipiega.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/intl/intl.o: main/view/intl/intl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/intl" 
	@${RM} ${OBJECTDIR}/main/view/intl/intl.o.d 
	@${RM} ${OBJECTDIR}/main/view/intl/intl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/intl/intl.c  -o ${OBJECTDIR}/main/view/intl/intl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/intl/intl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/intl/intl.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o: main/view/intl/AUTOGEN_FILE_strings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/intl" 
	@${RM} ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d 
	@${RM} ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/intl/AUTOGEN_FILE_strings.c  -o ${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/intl/AUTOGEN_FILE_strings.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_main.o: main/view/pages/page_main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_main.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_main.c  -o ${OBJECTDIR}/main/view/pages/page_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_temperature_test.o: main/view/pages/page_temperature_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_temperature_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_temperature_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_temperature_test.c  -o ${OBJECTDIR}/main/view/pages/page_temperature_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_temperature_test.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_temperature_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_digout_test.o: main/view/pages/page_digout_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digout_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digout_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_digout_test.c  -o ${OBJECTDIR}/main/view/pages/page_digout_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_digout_test.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_digout_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_digin_test.o: main/view/pages/page_digin_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digin_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_digin_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_digin_test.c  -o ${OBJECTDIR}/main/view/pages/page_digin_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_digin_test.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_digin_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_pwm_test.o: main/view/pages/page_pwm_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_pwm_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_pwm_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_pwm_test.c  -o ${OBJECTDIR}/main/view/pages/page_pwm_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_pwm_test.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_pwm_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_led_test.o: main/view/pages/page_led_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_led_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_led_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_led_test.c  -o ${OBJECTDIR}/main/view/pages/page_led_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_led_test.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_led_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_parmac.o: main/view/pages/page_parmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parmac.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parmac.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_parmac.c  -o ${OBJECTDIR}/main/view/pages/page_parmac.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_parmac.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_parmac.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_info.o: main/view/pages/page_info.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_info.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_info.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_info.c  -o ${OBJECTDIR}/main/view/pages/page_info.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_info.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_info.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_scelta_programma.o: main/view/pages/page_scelta_programma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_scelta_programma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_scelta_programma.c  -o ${OBJECTDIR}/main/view/pages/page_scelta_programma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_scelta_programma.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_parciclo.o: main/view/pages/page_parciclo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parciclo.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_parciclo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_parciclo.c  -o ${OBJECTDIR}/main/view/pages/page_parciclo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_parciclo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_parciclo.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_splash.o: main/view/pages/page_splash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_splash.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_splash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_splash.c  -o ${OBJECTDIR}/main/view/pages/page_splash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_splash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_splash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_reset_ram.o: main/view/pages/page_reset_ram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_reset_ram.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_reset_ram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_reset_ram.c  -o ${OBJECTDIR}/main/view/pages/page_reset_ram.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_reset_ram.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_reset_ram.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_commissioning.o: main/view/pages/page_commissioning.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_commissioning.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_commissioning.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_commissioning.c  -o ${OBJECTDIR}/main/view/pages/page_commissioning.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_commissioning.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_commissioning.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_coin_test.o: main/view/pages/page_coin_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_coin_test.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_coin_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_coin_test.c  -o ${OBJECTDIR}/main/view/pages/page_coin_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_coin_test.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_coin_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_contrast.o: main/view/pages/page_contrast.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_contrast.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_contrast.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_contrast.c  -o ${OBJECTDIR}/main/view/pages/page_contrast.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_contrast.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_contrast.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_stats.o: main/view/pages/page_stats.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_stats.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_stats.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_stats.c  -o ${OBJECTDIR}/main/view/pages/page_stats.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_stats.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_stats.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/pages/page_ram_error.o: main/view/pages/page_ram_error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/pages" 
	@${RM} ${OBJECTDIR}/main/view/pages/page_ram_error.o.d 
	@${RM} ${OBJECTDIR}/main/view/pages/page_ram_error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/pages/page_ram_error.c  -o ${OBJECTDIR}/main/view/pages/page_ram_error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/pages/page_ram_error.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/pages/page_ram_error.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/widgets/custom_lv_img.o: main/view/widgets/custom_lv_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view/widgets" 
	@${RM} ${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d 
	@${RM} ${OBJECTDIR}/main/view/widgets/custom_lv_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/widgets/custom_lv_img.c  -o ${OBJECTDIR}/main/view/widgets/custom_lv_img.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/widgets/custom_lv_img.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/view.o: main/view/view.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view" 
	@${RM} ${OBJECTDIR}/main/view/view.o.d 
	@${RM} ${OBJECTDIR}/main/view/view.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/view.c  -o ${OBJECTDIR}/main/view/view.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/view.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/view.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/common.o: main/view/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view" 
	@${RM} ${OBJECTDIR}/main/view/common.o.d 
	@${RM} ${OBJECTDIR}/main/view/common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/common.c  -o ${OBJECTDIR}/main/view/common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/common.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/view/styles.o: main/view/styles.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main/view" 
	@${RM} ${OBJECTDIR}/main/view/styles.o.d 
	@${RM} ${OBJECTDIR}/main/view/styles.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/view/styles.c  -o ${OBJECTDIR}/main/view/styles.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/view/styles.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/view/styles.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main/main.o: main/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/main" 
	@${RM} ${OBJECTDIR}/main/main.o.d 
	@${RM} ${OBJECTDIR}/main/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main/main.c  -o ${OBJECTDIR}/main/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mlarge-code -O0 -I"main" -I"components/I2C" -I"main/config" -I"components/generic_embedded_libs" -I"main/peripherals" -I"components" -I"main/config/mbconf" -I"components/liblightmodbus/include" -DLV_CONF_INCLUDE_SIMPLE -DGEL_IGNORE_TIME_TYPECHECK -msmart-io=1 -Wall -msfr-warn=off   -std=c99  -mdfp=${DFP_DIR}/xc16
	@${FIXDEPS} "${OBJECTDIR}/main/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp=${DFP_DIR}/xc16 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp=${DFP_DIR}/xc16 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/paperoga.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp=${DFP_DIR}/xc16 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
