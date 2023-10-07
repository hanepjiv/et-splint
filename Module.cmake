# -*- mode:cmake; coding:utf-8-unix; -*-

##  @file Module.cmake
##  @brief Module.cmake
##
##  Module.cmake
##
##  Copyright 2014 hanepjiv
##
##  @author hanepjiv <hanepjiv@gmail.com>
##  @copyright The MIT License (MIT)
##  @since 2014/06/24
##  @date 2023/10/07

find_program(SPLINT splint)
if(NOT SPLINT)
  message(FATAL_ERROR "Test feature requires splint.")
endif()

set(src "${CMAKE_SOURCE_DIR}/../et-splint/splint.sh.in")
set(target "${CMAKE_BINARY_DIR}/dependencies/et-splint/splint.sh")

message(STATUS "${SPLINT}")
configure_file(${src} ${target} @ONLY)
set(SPLINT_FLAGS "")
foreach(loop_var IN LISTS ET_SPLINT_INCLUDE_DIRS)
  set(SPLINT_FLAGS "${SPLINT_FLAGS} -I ${loop_var}")
endforeach()
set(SPLINT_SH /bin/env sh ${target})
