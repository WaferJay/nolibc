cmake_minimum_required(VERSION 3.22.1)

project("nolibc")

add_library(nolibc_headers INTERFACE)

target_include_directories(nolibc_headers INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        ${CMAKE_CURRENT_SOURCE_DIR}/include/uapi
        ${CMAKE_CURRENT_SOURCE_DIR}/include/nolibc)
