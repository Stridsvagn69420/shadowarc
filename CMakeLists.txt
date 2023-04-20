cmake_minimum_required(VERSION 3.18)
project(shadowarc C)

add_executable(pi-shadowarc main.c)
target_sources(pi-shadowarc PRIVATE )

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_C_FLAGS "-Wall -Wextra")
set(CMAKE_C_FLAGS_DEBUG "-g")
set(CMAKE_C_FLAGS_RELEASE "-O3 -s -w")