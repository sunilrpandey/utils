

## CMake - Fetchcontent to link libraries (gtest for example)

```
include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        703bd9caab50b139428cea1aaff9974ebee5742e # release-1.10.0
)
FetchContent_MakeAvailable(googletest)#endif 
```

## Set preprocessor macro from CMakeLists.txt for CPP Code

Add below line to CMakeLists.txt

```
target_compile_definitions(${PROJECT_NAME} PRIVATE GTEST_MAIN_INIT_IN_CMAKE)
```

Here is how to use this preprocessor macro in CPP file
```
#ifndef GTEST_MAIN_INIT_IN_CMAKE
int main(int argc, char* argv[])
{
	testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}
#endif 
```
