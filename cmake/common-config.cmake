
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Taken from https://github.com/SFML/SFML
macro(set_option var default type docstring)
    if(NOT DEFINED ${var})
        set(${var} ${default})
    endif()
    set(${var} ${${var}} CACHE ${type} ${docstring} FORCE)
endmacro()

# Project name based on the given platform name
set_option(PROJECT_TARGET_NAME "generic" STRING "The postfix added to the project name")
