
# CMake Step by Step
## Tips

## When you have just one impl file 
```bash
cmake_minimum_required(VERSION 3.16)
project(CppCMakeLearning VERSION 1.0.0 LANGUAGES C CXX)

add_executable(Executable learning.cpp)
```
## Add impl to separate file .h/.cpp
add implementation to my_lib.h/.cpp

```bash
add_library(Library STATIC my_lib.cpp)
add_executable(Executable learning.cpp)
target_link_libraries(Executable PUBLIC Library)
```



