# Hello-Bazel
## Build an executable
1. Create a WORKSPACE file (similar to solution file)
2. Setup environment
    * Create folder for the project
    * Write main.cpp file
        ```cpp
        #include <iostream>

        int main()
        {
            std::cout << "Hello Bazel!!" << std::endl;
        return 0;
        }
        ```
    * Write BUILD file in projec folder
        ```
            cc_binary(
            name = "hello",
            srcs = ["main.cpp"],
            )
        ```
3. Build the project.

    - Build all the targets
        > bazel build ...

    - Go to workspace directory(where  WORKSPACE file is created) and run
        > bazel build //hello-bazel:hello
    
    Here hellow-bazel is directory where WORKSPACE file is present 

4. Run the executive 
    > ./bazel-bin/hello

## More...
### Dependencies
#### If target is binary/libarary
If BUILD file is adding a lib, use cc_library fun and reference it using deps attribute
    ```
        cc_library(
        name="util-lib",
        srcs=["util.cpp"],
        hdrs=["util.h"],
    )

    cc_binary(
        name="hello_lib",
        srcs=[main.cpp],
        deps=[:util-lib],
    )
    ```

Give full path to `Target` from `WORKSPACE` directory. Here `hello-time` target is inside lib directory. Also you can see that multile dependencies can be grouped under []
```
deps = [
        ":hello-bazel",
        "//lib:util_lib",
    ],
```
#### If dependency is for files
Give dependencies to directories to include file using give just path to package in deps.

```
    deps = [
        ":hello-bazel",
        "//lib",
    ],
```
if target is in the same repository use
```
    deps = [
        ":hello-bazel",
        //:dep_lib
    ],
```
if target is in same BUILD file, skip //
```
    deps = [
        ":hello-bazel",
        :dep_lib
    ],
```

### Visibility 
If library or referenced binary is in separte directory, set its visibility to folder it is being referenced, say in our example `util_lib` created in `hello-lib` is being used is `hello-dep`. So make `util_lib` visible in hello-dep, for this add below code to cc_library of util_lib 

    visibility = ["//main:__pkg__"]

You can include headers relative to WORKSPACE