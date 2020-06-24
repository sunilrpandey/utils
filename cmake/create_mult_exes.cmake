cmake_minimum_required(VERSION 3.10)

# this cmake script iterate through source files and create exes for sources.
# exe's names are name of the .cpp file minus .cpp extension
message(STATUS ${CMAKE_CURRENT_SOURCE_DIR})
file( GLOB ALL_SOURCE_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp )

foreach( src_file ${ALL_SOURCE_FILES} )
    #create exename by replacing .cpp with .out
    string( REPLACE ".cpp" ".out" exe_name ${src_file} )
    add_executable( ${exe_name} ${src_file} )

    set_target_properties(${exe_name} PROPERTIES LINKER_LANGUAGE CXX)
    
endforeach()