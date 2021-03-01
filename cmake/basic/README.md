# **CMake Notes**

- [ ] [1. Hello CMake!](#hello)
- [ ] [2. Use files from another directory include/src!](#include)
- [ ] [3. Create Static library!](#static)
- [ ] [4. Create Shared library](#shared)
- [ ] [5. Use static library](#usestatic)
- [ ] [6. Use shared library](#useshared)

# Misc 
- [ ] [Add C++ Preprocessor Macro](#macro)
- [ ] [Build cmake project](#build)

## <a name='hello'>1. Hello CMake!</a>
1. create a folder for your program
2. create CMakeLists.txt and write 
    
    ```
    cmake_minimum_required(VERSION, 3.10) 
    project(hello_cmake VERSION 1.0.0)
    
    here `hello_cmake` is program name
    ```

    add compiler options if required  e.g. for C++ 17 code 
    > set(CMAKE_CXX_FLAGS "--std=c++17")

    append thread options if requiered
    > set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAG} -pthread")

    One can also use find_package to load thread library and link it to output lib/exe
    ```
    find_package (Threads REQUIRED)
    add_executable( ${exe_name} ${src_files} )
    target_link_libraries(${exe_name}
        ${CMAKE_THREAD_LIBS_INIT}
    )
    
    ```
 
3. create 'build' directory
4. Build target

    go to build directory and run

    ```
    cmake .. 

    # you can configure build type
    cmake -DCMAKE_BUILD_TYPE=Debug .. 
    ```
    You can also to in source build, not recommended though, creates mess of build files/directories. For this you need to run below command from source file(where CMakeLists.txt exits)
    ```
    cmake .
    ```
    
    this will create following file/directory
    * CMakeCache.txt  
    * CMakeFiles  
    * Makefile  
    * cmake_install.cmake
5. make necessary build/make call  
    > cmake --build .  
    
    Now, On Linux system check Makefile file (which is make file )  and run	
    > make hello_world
6. run executable 

    `./hello_world`
## <a name='include'>2. Use files from another directory include/src</a>
Say we want to use a class and its implementation saved in include/src. We need to add headers in **include**  using "include_directories", cpp in **src** using ~~**set**~~ or ~~**file(GLOB..)**~~ and update add_executable 

> include_directories(${PROJECT_SOURCE_DIR/include)

Now, include source files using saving it in a variable say SOURCES
> set ( SOURCES hello_include.cpp src/test.cpp)

OR
also can use file/GLOB to add all files
> file(GLOB SOURCES hello_include.cpp "src/*.cpp")

Lets provide add_executable the sources
> add_executable(hello_include ${SOURCES})

## <a name = 'static'>3. Create Static library</a>
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

## <a name = 'shared'>4. Create Shared library</a>
```
add_library(test_shared_lib SHARED
            ${SOURCES})
```

now install the library at location e.g. /usr/lib 
```
install(TARGETS test_shared_lib DESTINATION /usr/lib)`
```

once you run **cmake ..** and **make** , **.so** file would be created inside build folder

## <a name = 'usestatic'>5. Use static library </a>
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

## <a name = 'useshared'>6. Use shared library</a>
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

# <a name = 'mis'>Misc Use Cases</a>
## <a name = 'macro'>Add C++ Preprocessor Macro</a>
Add below line to CMakeLists.txt
```
add_definitions(-DLOG_ENABLED)
```

## <a name = 'build'>Build cmake project</a>
Write copy below commands to cmake_install.sh and run it from your cmake project root (Where CMakelists.txt is present)
```
#!/bin/bash
rm CMakeCache.txt
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local 
make
make install
make clean
```
You can specify if you want to build it on specific directory..BTW CMAKE_BUILD_TYPE and CMAKE_INSTALL_PREFIX is optional, cmake .. will also do
## References
* [Modern CMake](https://gitlab.com/CLIUtils/modern-cmake)
* [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
* [CMake Examples](https://github.com/ttroy50/cmake-examples) 