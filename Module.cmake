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
##  @date 2018/01/30

find_program(SPLINT splint)
if(NOT SPLINT)
  message(FATAL_ERROR "Test feature requires splint.")
endif()
message(STATUS "${SPLINT}")
configure_file(${abs_top_srcdir}/tools/et-splint/splint.sh.in
  tools/et-splint/splint.sh @ONLY)
set(SPLINT_FLAGS "")
foreach(loop_var IN LISTS SNAPKIT_INCLUDE_DIRS)
  set(SPLINT_FLAGS "${SPLINT_FLAGS} -I ${loop_var}")
endforeach()
set(SPLINT_SH /bin/env sh ${CMAKE_CURRENT_BINARY_DIR}/tools/et-splint/splint.sh)
