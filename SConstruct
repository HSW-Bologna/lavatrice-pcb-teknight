import os
import multiprocessing
from pathlib import Path

#
# FUNCTIONS
#


def PhonyTargets(
    target,
    action,
    depends,
    env=None,
):
    # Creates a Phony target
    if not env:
        env = DefaultEnvironment()
    t = env.Alias(target, depends, action)
    env.AlwaysBuild(t)


#
# BUILD CONFIGURATION
#

MINGW = 'mingw' in COMMAND_LINE_TARGETS
PROGRAM = "simulated.exe"
MAIN = "main"
COMPONENTS = "components"
LVGL = "{}/lvgl".format(COMPONENTS)

CFLAGS = [
    "-Wall",
    "-Wextra",
    "-Wno-unused-function",
    "-g",
    "-O0",
    "-DPC_SIMULATOR",
    "-DLV_CONF_INCLUDE_SIMPLE",
    "-DLV_LVGL_H_INCLUDE_SIMPLE",
    "-Wno-unused-parameter",
    "-static-libgcc",
    "-static-libstdc++",
]
LDLIBS = ["-lmingw32", "-lSDL2main", "-lSDL2"] if MINGW else ["-lSDL2"]
SDLPATH = ARGUMENTS.get('sdl', None)
LIBPATH = [os.path.join(SDLPATH, 'lib')] if SDLPATH else []

CPPPATH = [
    COMPONENTS, f"#{LVGL}/src", f"#{LVGL}", f"#{MAIN}",
    f"#{MAIN}/config", f"#{MAIN}/simulator", f"#{COMPONENTS}/gel/generic_embedded_libs",
    "simulator",
]

if SDLPATH:
    CPPPATH.append(os.path.join(SDLPATH, 'include'))

#
# MAIN
#


def main():
    num_cpu = multiprocessing.cpu_count()
    SetOption('num_jobs', num_cpu)
    print("Running with -j {}".format(GetOption('num_jobs')))

    env_options = {
        "ENV": os.environ,
        "CC": ARGUMENTS.get('cc', 'gcc'),
        "ENV": os.environ,
        "CPPPATH": CPPPATH,
        'CPPDEFINES': [],
        "CCFLAGS": CFLAGS,
        "LIBS": LDLIBS,
    }

    env = Environment(**env_options, tools=['mingw'] if MINGW else None)
    env.Tool('compilation_db')

    gel_env = env
    gel_selected = ['pagemanager', 'collections',
                    'data_structures', 'keypad', 'debounce']
    (gel_objects, include) = SConscript(
        f'{COMPONENTS}/generic_embedded_libs/SConscript', exports=['gel_env', 'gel_selected'])
    env['CPPPATH'] += [include]

    i2c_env = env
    i2c_selected = ['temperature/SHT3',
                    'temperature/SHT21', 'LTR559ALS', 'dummy']
    (i2c_objects, include) = SConscript(
        f'{COMPONENTS}/I2C/SConscript', exports=['i2c_env', 'i2c_selected'])
    env['CPPPATH'] += [include]

    sources = [str(filename) for filename in Path('simulator').rglob('*.c')]
    sources += [str(filename) for filename in Path('main/view').rglob('*.c')]
    sources += [str(filename) for filename in Path('main/model').rglob('*.c')]
    sources += [str(filename)
                for filename in Path('main/controller').rglob('*.c')]
    sources += [str(filename)
                for filename in Path(f'{LVGL}/src').rglob('*.c')]
    sources += [Glob(f'{LVGL}/*.c')]

    prog = env.Program(PROGRAM, sources + i2c_objects +
                       gel_objects, LIBPATH=LIBPATH)
    PhonyTargets('run', f"./{PROGRAM}", prog, env)
    env.Alias('mingw', prog)
    env.CompilationDatabase('compile_commands.json')


main()
