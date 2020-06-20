cmake_minimum_required(VERSION 3.10)

message(STATUS "Project name : ${PROJECT_NAME}")
message(STATUS "Project version : ${PROJECT_VERSION}")
message(STATUS "CMAKE_SOURCE_DIR : ${CMAKE_SOURCE_DIR}")
message(STATUS "CMAKE_BINARY_DIR : ${CMAKE_BINARY_DIR}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR : ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_CURRENT_BINARY_DIR : ${CMAKE_CURRENT_BINARY_DIR}")

message(STATUS "CMAKE_CURRENT_SCRIPT_FILE : ${CMAKE_CURRENT_SCRIPT_FILE}")
message(STATUS "CMAKE_CURRENT_SCRIPT_DIR : ${CMAKE_CURRENT_SCRIPT_DIR}")

macro(print_all_variables)
    message(STATUS "print_all_variables------------------------------------------{")
    get_cmake_property(_variableNames VARIABLES)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
    message(STATUS "print_all_variables------------------------------------------}")
endmacro()

#property
set_property(GLOBAL PROPERTY FOO 1 2 3 4)
get_cmake_property(foo_value FOO)
message(STATUS "foo values are : ${foo_value}")
