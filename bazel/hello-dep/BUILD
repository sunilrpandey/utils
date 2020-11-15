cc_library(
    name = "cur_time_lib",
    srcs = ["cur_time.cpp"],
    hdrs = ["cur_time.h"],
)

cc_binary ( 
    name = "hello_dep",
    srcs = ["main.cpp"],
    deps = [
            ":cur_time_lib",
            "//hello-lib:util_lib",
            ],
)