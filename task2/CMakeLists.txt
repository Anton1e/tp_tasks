cmake_minimum_required(VERSION 2.8)

project(FinalProject)

add_custom_command(
    OUTPUT ${PROJECT_SOURCE_DIR}/A/index.h
    COMMAND python3 ${PROJECT_SOURCE_DIR}/A/preparing.py ${PROJECT_SOURCE_DIR}/A/index.h
)

set(MAIN_SOURCE ${PROJECT_SOURCE_DIR}/C/main.cpp ${PROJECT_SOURCE_DIR}/C/main.h)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

include_directories(${PROJECT_SOURCE_DIR}/B ${PROJECT_SOURCE_DIR}/A)

add_subdirectory(${PROJECT_SOURCE_DIR}/B)

add_custom_target(Generator DEPENDS ${PROJECT_SOURCE_DIR}/A/index.h)

add_executable(${PROJECT_NAME} ${MAIN_SOURCE})

add_dependencies(${PROJECT_NAME} Generator)

target_link_libraries(${PROJECT_NAME} lib)

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR})
