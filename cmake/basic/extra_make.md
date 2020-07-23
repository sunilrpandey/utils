# Extra Notes

## Use cases
### Config debug and release build
```
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.11)
SET(PROJ_NAME "myproject")
PROJECT(${PROJ_NAME})

SET(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configs" FORCE)

IF(DEFINED CMAKE_BUILD_TYPE AND CMAKE_VERSION VERSION_GREATER "2.8")
  SET_PROPERTY(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS  ${CMAKE_CONFIGURATION_TYPES})
ENDIF()

SET(${PROJ_NAME}_PATH_INSTALL "/opt/project"      CACHE PATH "This directory contains installation Path")
SET(CMAKE_DEBUG_POSTFIX "d")

INSTALL(TARGETS ${PROJ_NAME}
    DESTINATION  "${${PROJ_NAME}_PATH_INSTALL}/lib/${CMAKE_BUILD_TYPE}/"
    )
```
And this is how you will execute and find libraries in debug/release folder
```
$ cd /myproject/build
$ cmake -DCMAKE_BUILD_TYPE=Debug ..
$ make
$ sudo make install
$ cmake _DCMAKE_BUILD_TYPE=Release ..
$ make
$ sudo make install
```
### Create shared/static lib from command line
Set BUILD_SHARED_LIBS to False/True for static shared library,
```
 cmake .. -DBUILD_SHARED_LIBS=ON
 ```
 offcourse you always have an option to include STATIC/SHARED in add_library() function

 ### Set C++ standard globally 
 ```
 	set(CMAKE_C_STANDARD 99)
	set(CMAKE_CXX_STANDARD 11)
```
this will add compile option for g++ (-std=c++11)

### Make particular c++ standard as prerequisite

Set the variable CMAKE_CXX_STANDARD_REQUIRED on
	```
	set_target_properties(lib_name PROPERTIES 
			CXX_STANDARD 11
			CXX_STANDARD_REQUIRED ON
	)
	```
## Please note !!
1. Below section shows anyone consuming library has access to directory it was built into
```
add_library(lib_name ${SOURCES})
target_include_directories(demo_test_static_lib PUBLIC filedir)
```

2. Can run build from build folder
```
cmake --build . // (<location of the cach file>) from root
cmake --build ly-build\
```

### How to link executable to library
> target_link_libraries(demo_test_static_lib PRIVATE lib_name)	


### Set compilation conditons
> target_compile_definitions(lib_name PUBLIC LIB_VERSION=10)

private means it is visible to this lib_name only
INTERFACE oppostite to private i.e. not available to this library but visible to outside


### Configure cmake 
Go to command pallete ( Press ctrl + shift + p  )and type Cmake Configure

## Few Variables
* PROJECT_NAME
* PROJECT_VERSION
* CMAKE_CURRENT_SOURCE_DIR - current directory where CMakeLists.txt is

## CMake Scripting 

### Log messages
> message(STATUS "My message my progress so far..")

### Set to be used as variable assignment  
> set(my_variable_name, "variable_value")	
> message(STATUS "variable = ${my_variable_name}")

### If statement
```
if("TRUE")
	message(STATUS "msg")
endif
```
..more
```
set(my_bool "TRUE")
if(not "my_bool") // or if("${my_bool})
	message(STATUS "condition passed")
else() #elseif
	message(STATUS "condition passed failed")
endif
```

### few operators
> STREQUAL, EQUAL, STRGREATER, STRLESS, NOTEQUAL, NOT, LESS, GREATER, MATCHES

```
set(my_str "this")
set(my_other_str "Its that")
my_other_str MATCHES that$ //  matches "that" at the end
```

### while loop
```
set(my_value 0)
while (LESS 50) #LESS <
	math(EXPR my_value "${my_value} + 1")
	message(STATUS "${my_value}")
endwhile
```
### for each
```
foreach(item IN ITEMS foo bar baz)
...
endforeach

foreach (idx RANGE 100)
....
endforeach

foreach (idx RANGE 0 99 5) /// 0 to 9 with increment 5
...
endforeach
```

> Also allowed are break(), continue() 
### macro 
similar to function executed in current context
```
macro(setVariable VAR_VALUE)
	set(${VAR_VALUE} "newValue")
endmacro(setVariable)
```
This is how above macros can be used 
```
setVariable(my_var)
message(STATUS "Set Value : ${my_var})
```
## Todo

* We can add version number using config file (TutorialConfig.h.in TutorialConfig.h) 
* Makefile for Test Suite
