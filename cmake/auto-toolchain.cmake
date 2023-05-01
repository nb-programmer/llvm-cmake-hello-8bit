
if (NOT CMAKE_TOOLCHAIN_FILE)
    if (LLVM_MOS)
        # Manually find LLVM-MOS toolchain using CMake at the path given in LLVM_MOS
        list(APPEND CMAKE_PREFIX_PATH ${LLVM_MOS})
        find_package(llvm-mos-sdk REQUIRED)
    endif()
endif()
