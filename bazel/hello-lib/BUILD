cc_library(
    name="util-lib",
    srcs=["util.cpp"],
    hdrs=["util.h"],
    visibility = ["//hello-dep:__pkg__"],
)

cc_binary(
    name="hello_lib",
    srcs=["main.cpp"],
    deps=[":util-lib"],    
)