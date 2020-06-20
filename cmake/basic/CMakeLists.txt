cmake_minimum_required(VERSION 3.10)
project(basic_cmake VERSION 1.1)
#include .cmake file for its content
include(in_build_variable_list.cmake)

# print_all_variables()


add_subdirectory(01_hello_make)
add_subdirectory(02_include_dir)
add_subdirectory(03_shared_lib)
add_subdirectory(04_static_lib)
add_subdirectory(05_use_static_lib)
add_subdirectory(06_use_shared_lib)

#set(MY_VAR "Sunil")
#message(STATUS "my variable name is : ${MY_VAR}")