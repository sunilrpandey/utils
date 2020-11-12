# Hello-Bazel

1. Create a WORKSPACE file (similar to solution file)
2. Setup environment
    * Create folder for the project
    * write main.cpp file
        ```cpp
        #include <iostream>

        int main()
        {
            std::cout << "Hello Bazel!!" << std::endl;
        return 0;
        }
        ```
    * write BUILD file in projec folder
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

4. Run the executation 
    > ./bazel-bin/hello


