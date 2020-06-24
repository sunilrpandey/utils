cmake_minimum_required(VERSION 3.10)

#set project name
project(hello_static_lib, VERSION 1.0.0)

# header include
include_directories(include)

#include sources using set
#set(SOURCES src/test.cpp)

# include sources
file(GLOB SOURCES "src/*.cpp")

#create static lib
add_library(test_static_lib STATIC ${SOURCES})
#target_include_directories(test_static_lib PUBLIC ${CMAKE_CURRENT_LIST_DIR}/include)

#set the location for library installation -- /usr/lib
install(TARGETS test_static_lib DESTINATION /usr/lib)