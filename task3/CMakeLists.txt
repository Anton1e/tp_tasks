cmake_minimum_required(VERSION 3.0)

if (${ARM_BUILD}) 
    set(CMAKE_SYSTEM_NAME Linux)
    set(CMAKE_SYSTEM_PROCESSOR arm)

    set(CMAKE_C_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-gcc)
    set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/aarch64-linux-gnu-g++)

    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()

project(SimpleLibrary)

include_directories(include)


set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)

target_link_libraries(MainLib buffer)

if (${ARM_BUILD})
    install(EXPORT bufferTarget FILE bufferTarget.cmake DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake/buffer)

    set_target_properties(Main MainLib PROPERTIES CMAKE_BUILD_WITH_INSTALL_RPATH TRUE CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/lib)
    install(TARGETS Main MainLib DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
endif()
