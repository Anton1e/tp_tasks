cmake_minimum_required(VERSION 3.14)

project(FinalProject)

add_custom_command(
    OUTPUT ${PROJECT_SOURCE_DIR}/A/index.h
    COMMAND python3 ${PROJECT_SOURCE_DIR}/A/preparing.py ${PROJECT_SOURCE_DIR}/A/index.h
)

set(MAIN_SOURCE ${PROJECT_SOURCE_DIR}/C/main.cpp)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_executable(${PROJECT_NAME} ${MAIN_SOURCE})

include_directories(.)
add_subdirectory(${PROJECT_SOURCE_DIR}/B)
target_link_libraries(${PROJECT_NAME} lib)

add_custom_target(Generator DEPENDS ${PROJECT_SOURCE_DIR}/A/index.h)
add_dependencies(${PROJECT_NAME} Generator)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR})

enable_testing()

add_executable(CTest ${PROJECT_SOURCE_DIR}/C/main_test.cpp)

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
target_link_libraries(CTest gtest gtest_main lib pthread)

add_dependencies(CTest Generator)
target_include_directories(CTest PRIVATE ${CMAKE_BINARY_DIR})
