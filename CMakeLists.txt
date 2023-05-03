cmake_minimum_required(VERSION 3.20)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include("common-config")
include("auto-toolchain")

# Configure project
project(
    Hello8Bit-${PROJECT_TARGET_NAME}
    DESCRIPTION "Hello World template for 8-bit platforms using CMake, targetting LLVM-MOS"
    LANGUAGES ASM C CXX
    VERSION 1.0
)

# Try to determine which toolchain was used to specify additional options

if(LLVM_MOS)
    # Using the LLVM-MOS-SDK toolchain. We need to set some options for it
    message(STATUS "Using LLVM-MOS toolchain")
    include_directories(${LLVM_INCLUDE_DIRS})
    separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
    add_definitions(${LLVM_DEFINITIONS_LIST})
endif()

# Build the main project executable
add_executable(${CMAKE_PROJECT_NAME} "src/main.c")

# Add the project source code
add_subdirectory("src/")

# You can add custom commands to build resources and other things

# add_custom_command(
#     OUTPUT resource.bin
#     COMMAND make-resource -o resource.bin res-source1 res-source2
#     VERBATIM
# )


# Add some preprocessor defines
target_compile_definitions(${CMAKE_PROJECT_NAME} PUBLIC "$<$<CONFIG:DEBUG>:DEBUG>")
target_compile_definitions(${CMAKE_PROJECT_NAME}
    PUBLIC PROJECT_TARGET_NAME="${PROJECT_TARGET_NAME}"
)
