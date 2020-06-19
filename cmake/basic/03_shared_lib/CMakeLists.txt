cmake_minimum_required(VERSION 3.10)

#set project name
project(hello_shared_lib, VERSION 1.0.0)
set(CMAKE_BUILD_TYPE Release)

# header include
include_directories(include)

#include sources using set
#set(SOURCES src/test.cpp)

# include sources
file(GLOB SOURCES "src/*.cpp")

#add executable
add_library(test_shared_lib SHARED ${SOURCES})

#set the location for library installation -- /usr/lib
install(TARGETS test_shared_lib DESTINATION /usr/lib)