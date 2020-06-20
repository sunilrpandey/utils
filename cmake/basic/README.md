# **CMake Notes**

## 1. Hello CMake!
1. create a folder for your program
2. create CMakeLists.txt and write 
    
    ` cmake_minimum_required(VERSION, 3.10) `
    ` project(hello_cmake VERSION 1.0.0)`
    
    > hello_cmake is program name
3. create 'build' directory
4. go to build directory and run

    ` cmake ..`

    this will create following file/directory
    * CMakeCache.txt  
    * CMakeFiles  
    * Makefile  
    * cmake_install.cmake
5. now check Makefile file (which is make file for linux)  and run	

    ` make hello_world` 

6. run executable 

    `./hello_world`

## 2. Use files from another directory include/src
Say we want to use a class and its implementation saved in include/src. We need to add headers in **include**  using "include_directories", cpp in **src** using ~~**set**~~ or ~~**file(GLOB..)**~~ and update add_executable 

> include_directories(include)

Now, include source files using saving it in a variable say SOURCES
> set ( SOURCES hello_include.cpp src/test.cpp)

OR
also can use file/GLOB to add all files
> file(GLOB SOURCES hello_include.cpp "src/*.cpp")

Lets provide add_executable the sources
> add_executable(hello_include ${SOURCES})

## 3. Create Static library
use add_library instead of add_executable to create static library

```
add_library(test_static_lib STATIC
            ${SOURCES})
```
( BTW default for add_library is static library only )

now install the library at location e.g. /usr/lib 
```
install(TARGETS test_static_lib DESTINATION /usr/lib)`
```

once you run **cmake ..** and **make** , **.a** file would be created inside build folder
install this .a for system wide use by executing 

> sudo make install

Also you can find a file install_manifest.txt which keeps installation path
, and you can determine the constituents of a static library using the GNU ar (archive) command
> ar -t libtest_static_lib.a

## 3. Create Shared library
```
add_library(test_shared_lib SHARED
            ${SOURCES})
```

now install the library at location e.g. /usr/lib 
```
install(TARGETS test_shared_lib DESTINATION /usr/lib)`
```

once you run **cmake ..** and **make** , **.so** file would be created inside build folder

## 4. Use static library
1. Identify library to be used, and link directory 
```
set(PROJECT_LINK_LIBS libtest_static_lib.a)
link_directories(~/cmake_tut/04_static_lib/ly-build)
```

2. findout where are headers for the library to be linked. Include the path 

```
include_directories(~/cmake_tut/04_static_lib/include)
```

3. write client app , and link this app to libraries

```
add_executable(demo_test_static_lib demo_static_lib.cpp)
target_link_libraries(demo_test_static_lib ${PROJECT_LINK_LIBS})
```

### Use shared library
1. Identify library to be used, and link directory 
```
set(PROJECT_LINK_LIBS libtest_static_lib.a)
link_directories(~/cmake_tut/04_static_lib/ly-build)
```

2. findout where are headers for the library to be linked. Include the path 
```
include_directories(~/cmake_tut/04_static_lib/include)
```

3. write client app , and link this app to libraries
```
add_executable(demo_test_static_lib demo_static_lib.cpp)
target_link_libraries(demo_test_static_lib ${PROJECT_LINK_LIBS})
```
