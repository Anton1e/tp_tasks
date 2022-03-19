cmake_minimum_required(VERSION 3.14)

project(lib)

add_library(${PROJECT_NAME} SHARED lib.cpp lib.h)
