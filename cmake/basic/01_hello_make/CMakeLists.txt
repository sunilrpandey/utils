cmake_minimum_required(VERSION 3.10)

#set project name
project(hello_cmake, VERSION 1.0.0)


# Set the output folder where your program will be created
# specifiy bin directories 
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

message(STATUS "CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message(STATUS "EXECUTABLE_OUTPUT_PATH = ${EXECUTABLE_OUTPUT_PATH}")
message(STATUS "LIBRARY_OUTPUT_PATH = ${LIBRARY_OUTPUT_PATH}")
message(STATUS "PROJECT_SOURCE_DIR = ${PROJECT_SOURCE_DIR}")
#add executable
add_executable(hello_cmake ${PROJECT_SOURCE_DIR}/hello_cmake.cpp)
