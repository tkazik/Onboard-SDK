# - Try to find ffmpeg libraries (libavcodec, libavformat and libavutil)
# Once done this will define
#
# FFMPEG_FOUND - system has ffmpeg or libav
# FFMPEG_INCLUDE_DIR - the ffmpeg include directory
# FFMPEG_LIBRARIES - Link these to use ffmpeg
# FFMPEG_LIBAVCODEC
# FFMPEG_LIBAVFORMAT
# FFMPEG_LIBAVUTIL
#
# Copyright (c) 2019 Alejandro Rodriguez Ramos <alejandro.rramos@upm.es>
# Modified version of Andreas Schneider <mail@cynapses.org>
# Modified for other libraries by Lasse Kärkkäinen <tronic>
# Modified for Hedgewars by Stepik777
# Modified for FFmpeg-example Tuukka Pasanen 2018
#
# Redistribution and use is allowed according to the terms of the New
# BSD license.
#

#include(FindPackageHandleStandardArgs)

    #find_package_handle_standard_args(FFMPEG
        #FOUND_VAR FFMPEG_FOUND
        #REQUIRED_VARS
            #FFMPEG_LIBRARY
            #FFMPEG_INCLUDE_DIR
        #VERSION_VAR FFMPEG_VERSION
    #)

MESSAGE(STATUS "INFO: Custom installation of FFMPEG selected")
MESSAGE(STATUS "DIR: " ${CMAKE_SOURCE_DIR})

#if(FFMPEG_LIBRARIES AND FFMPEG_INCLUDE_DIR)
  # in cache already
#  set(FFMPEG_FOUND TRUE)
#else()
  # use pkg-config to get the directories and then use these values
  # in the FIND_PATH() and FIND_LIBRARY() calls
  #find_package(PkgConfig)
  #if(PKG_CONFIG_FOUND)
  #  pkg_check_modules(_FFMPEG_AVCODEC libavcodec)
  #  pkg_check_modules(_FFMPEG_AVFORMAT libavformat)
  #  pkg_check_modules(_FFMPEG_AVUTIL libavutil)
  #endif()

set(FFMPEG_INCLUDE_DIRS "${CMAKE_SOURCE_DIR}/FFmpeg")


  find_path(FFMPEG_AVCODEC_INCLUDE_DIR
    NAMES libavcodec/avcodec.h
    PATHS #${_FFMPEG_AVCODEC_INCLUDE_DIRS}
      #/usr/include
      #/usr/local/include
      #/opt/local/include
      #/sw/include
      ${CMAKE_SOURCE_DIR}/FFmpeg
    PATH_SUFFIXES ffmpeg libav)

  find_library(FFMPEG_LIBAVCODEC
    NAMES avcodec
    HINTS #${_FFMPEG_AVCODEC_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libavcodec
)

  find_library(FFMPEG_LIBAVFORMAT
    NAMES avformat
    HINTS #${_FFMPEG_AVFORMAT_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libavformat)

  find_library(FFMPEG_LIBAVUTIL
    NAMES avutil
    HINTS #${_FFMPEG_AVUTIL_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libavutil)

  find_library(FFMPEG_LIBAVDEVICE
    NAMES avdevice
    HINTS #${_FFMPEG_AVDEVICE_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libavdevice)

  find_library(FFMPEG_LIBAVFILTER
    NAMES avfilter
    HINTS #${_FFMPEG_AVFILTER_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libavfilter)

  find_library(FFMPEG_LIBAVRESAMPLE
    NAMES avresample
    HINTS #${_FFMPEG_AVRESAMPLE_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libavresample)

  find_library(FFMPEG_LIBPOSTPROC
    NAMES postproc
    HINTS #${_FFMPEG_POSTPROC_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libpostproc)

  find_library(FFMPEG_LIBSWRESAMPLE
    NAMES swresample
    HINTS #${_FFMPEG_SWRESAMPLE_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libswresample
)

  find_library(FFMPEG_LIBSWSCALE
    NAMES swscale
    HINTS #${_FFMPEG_SWSCALE_LIBRARY_DIRS}
      #/usr/lib
      #/usr/local/lib
      #/opt/local/lib
      #/sw/lib
      ${CMAKE_SOURCE_DIR}/FFmpeg/libswscale)

  find_library(FFMPEG_LIBZ
    NAMES z)

  find_library(FFMPEG_LIBTHEORA
    NAMES theora)

  find_library(FFMPEG_LIBLZMA
    NAMES lzma)

  MESSAGE(STATUS "FFMPEG_LIBAVCODEC : " ${FFMPEG_LIBAVCODEC})
  MESSAGE(STATUS "FFMPEG_LIBAVFORMAT : " ${FFMPEG_LIBAVFORMAT})
  MESSAGE(STATUS "FFMPEG_LIBAVUTIL : " ${FFMPEG_LIBAVUTIL})
  MESSAGE(STATUS "FFMPEG_LIBAVDEVICE : " ${FFMPEG_LIBAVDEVICE})
  MESSAGE(STATUS "FFMPEG_LIBAVFILTER : " ${FFMPEG_LIBAVFILTER})
  MESSAGE(STATUS "FFMPEG_LIBAVRESAMPLE : " ${FFMPEG_LIBAVRESAMPLE})
  MESSAGE(STATUS "FFMPEG_LIBPOSTPROC : " ${FFMPEG_LIBPOSTPROC})
  MESSAGE(STATUS "FFMPEG_LIBSWRESAMPLE : " ${FFMPEG_LIBSWRESAMPLE})
  MESSAGE(STATUS "FFMPEG_LIBSWSCALE : " ${FFMPEG_LIBSWSCALE})
  MESSAGE(STATUS "FFMPEG_LIBZ : " ${FFMPEG_LIBPOSTPROC})
  MESSAGE(STATUS "FFMPEG_LIBTHEORA : " ${FFMPEG_LIBSWRESAMPLE})
  MESSAGE(STATUS "FFMPEG_LIBLZMA : " ${FFMPEG_LIBSWSCALE})

  if(FFMPEG_LIBAVCODEC AND FFMPEG_LIBAVFORMAT AND FFMPEG_LIBAVUTIL AND FFMPEG_LIBAVDEVICE AND FFMPEG_LIBAVFILTER AND FFMPEG_LIBAVRESAMPLE AND FFMPEG_LIBPOSTPROC AND FFMPEG_LIBSWRESAMPLE AND FFMPEG_LIBSWSCALE
	AND FFMPEG_LIBZ AND FFMPEG_LIBTHEORA AND FFMPEG_LIBLZMA)
    set(FFMPEG_FOUND TRUE)
  endif()

  if(FFMPEG_FOUND)
    set(FFMPEG_INCLUDE_DIR ${FFMPEG_AVCODEC_INCLUDE_DIR})
    set(FFMPEG_LIBRARIES
      ${FFMPEG_LIBAVCODEC}
      ${FFMPEG_LIBAVFORMAT}
      ${FFMPEG_LIBAVUTIL}
      ${FFMPEG_LIBAVDEVICE}
      ${FFMPEG_LIBAVFILTER}
      ${FFMPEG_LIBAVRESAMPLE}
      ${FFMPEG_LIBPOSTPROC}
      ${FFMPEG_LIBSWRESAMPLE}
      ${FFMPEG_LIBSWSCALE}
      ${FFMPEG_LIBSWSCALE}
      ${FFMPEG_LIBZ}
      ${FFMPEG_LIBTHEORA}
      ${FFMPEG_LIBLZMA})
  endif()

  if(FFMPEG_FOUND)
    #if(NOT FFMPEG_FIND_QUIETLY)
    #  message(STATUS
    #  "Found FFMPEG or Libav: ${FFMPEG_LIBRARIES}, ${FFMPEG_INCLUDE_DIR}")
    #endif()
  else()
    if(FFMPEG_FIND_REQUIRED)
      message(FATAL_ERROR
      "Could not find some ffmpeg library")
    endif()
  endif()
#endif()
