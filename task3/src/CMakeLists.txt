add_library(buffer SHARED buffer.cpp)

if (${ARM_BUILD})
    install(TARGETS buffer  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
    install (FILES ${PROJECT_SOURCE_DIR}/include/buffer.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
endif()
