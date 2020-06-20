cmake_minimum_required(VERSION 3.10)
project(test_shared_lib VERSION 1.0)

#link shared libs
set(PROJECT_LINK_LIBS libtest_shared_lib.so)
link_directories(~/git_repos/utils/cmake/basic/03_shared_lib/ly-build)

#include path for headers
include_directories(~/git_repos/utils/cmake/basic/03_shared_lib/include)

add_executable(demo_test_shared_lib demo_shared_lib.cpp)
target_link_libraries(demo_test_shared_lib ${PROJECT_LINK_LIBS})