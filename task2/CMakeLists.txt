cmake_minimum_required(VERSION 3.14)

project(FinalProject)

add_custom_command(
    OUTPUT ${PROJECT_SOURCE_DIR}/A/index.h
    COMMAND python3 ${PROJECT_SOURCE_DIR}/A/preparing.py ${PROJECT_SOURCE_DIR}/A/index.h
)

set(MAIN_SOURCE C/main.cpp)
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_executable(${PROJECT_NAME} ${MAIN_SOURCE})

include_directories(${PROJECT_SOURCE_DIR})
add_subdirectory(B)
target_link_libraries(${PROJECT_NAME} lib)

add_custom_target(Generator DEPENDS A/index.h)
add_dependencies(${PROJECT_NAME} Generator)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_BINARY_DIR})

add_executable(CTest C/main_test.cpp)

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
target_link_libraries(CTest gtest gtest_main lib pthread)

add_dependencies(CTest Generator)
target_include_directories(CTest PRIVATE ${CMAKE_BINARY_DIR})
