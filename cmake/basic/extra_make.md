# Extra Notes

### Please note !!
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

## Todo

We can add version number using config file
configure_file(TutorialConfig.h.in TutorialConfig.h) 


