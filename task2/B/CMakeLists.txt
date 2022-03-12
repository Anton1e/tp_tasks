cmake_minimum_required(VERSION 2.8)

project(lib)

add_library(${PROJECT_NAME} SHARED lib.cpp lib.h)
