cmake_minimum_required(VERSION 3.10)
project(test_static_lib)

#link static libs
set(PROJECT_LINK_LIBS libtest_static_lib.a)
link_directories(~/git_repos/utils/cmake/basic/04_static_lib/build)

#include path for headers
include_directories(~/git_repos/utils/cmake/basic/04_static_lib/include)

add_executable(demo_test_static_lib demo_static_lib.cpp)
target_link_libraries(demo_test_static_lib ${PROJECT_LINK_LIBS})