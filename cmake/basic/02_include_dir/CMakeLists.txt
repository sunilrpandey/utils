cmake_minimum_required(VERSION 3.10)

#set project name
project(hello_include, VERSION 1.0.0)

# header include
include_directories(${PROJECT_SOURCE_DIR}/include)

#include sources using set
#set(SOURCES hello_include.cpp src/test.cpp)

# include sources
file(GLOB SOURCES hello_include.cpp "src/*.cpp")

#add executable
add_executable(hello_include ${SOURCES})
