# Google Test Cheat
## TestSuites
Similar kind of test cases should be grouped
```cpp
TEST(TestSuiteName, TestName) {
  ... test body ...
}
```
If we have classic Factorial function, Test cases should be 
```cpp
// Tests factorial of 0.
TEST(FactorialTest, HandlesZeroInput) {
  EXPECT_EQ(Factorial(0), 1);
}

// Tests factorial of positive numbers.
TEST(FactorialTest, HandlesPositiveInput) {
  EXPECT_EQ(Factorial(1), 1);
  EXPECT_EQ(Factorial(2), 2);
  EXPECT_EQ(Factorial(3), 6);
  EXPECT_EQ(Factorial(8), 40320);
}
```
## Test Fixtures
Using the Same Data Configuration for Multiple Tests
- Derive a class from ::testing::Test . Start its body with protected:, as we'll want to access fixture members from sub-classes.
- Inside the class, declare any objects you plan to use.
- Write a default constructor or SetUp() function if necessary
- Write a destructor or TearDown() function if necessary
- If needed, define subroutines for your tests to share.

When using a fixture, use TEST_F() instead of TEST()
```cpp
TEST_F(TestFixtureName, TestName) {
  ... test body ...
}
```
For each test defined with TEST_F(), googletest will create a fresh test fixture at runtime, immediately initialize it via SetUp(), run the test, clean up by calling TearDown(), and then delete the test fixture. Note that different tests in the same test suite have different test fixture objects, and googletest always deletes a test fixture before it creates the next one. googletest does not reuse the same test fixture for multiple tests. Any changes one test makes to the fixture do not affect other tests.

### Create Fixture class
Suppose we have Queue class to test
```cpp
template <typename E>  // E is the element type.
class Queue {
 public:
  Queue();
  void Enqueue(const E& element);
  E* Dequeue();  // Returns NULL if the queue is empty.
  size_t size() const;
  ...
}
```
Now define a Fixture class
```cpp
class QueueTest : public ::testing::Test {
 protected:
  void SetUp() override {
     q1_.Enqueue(1);
     q2_.Enqueue(2);
     q2_.Enqueue(3);
  }

  // void TearDown() override {}

  Queue<int> q0_;
  Queue<int> q1_;
  Queue<int> q2_;
};
```
Now let's write tests using TEST_F() and above fixture.
```cpp
    TEST_F(QueueTest, IsEmptyInitially) {
    EXPECT_EQ(q0_.size(), 0);
    }

    TEST_F(QueueTest, DequeueWorks) {
    int* n = q0_.Dequeue();
    EXPECT_EQ(n, nullptr);

    n = q1_.Dequeue();
    ASSERT_NE(n, nullptr);
    EXPECT_EQ(*n, 1);
    EXPECT_EQ(q1_.size(), 0);
    delete n;

    n = q2_.Dequeue();
    ASSERT_NE(n, nullptr);
    EXPECT_EQ(*n, 2);
    EXPECT_EQ(q2_.size(), 1);
    delete n;
    }
```
### ASSERT vs EXPECT
 The rule of thumb is to use EXPECT_* when you want the test to continue to reveal more errors after the assertion failure, and use ASSERT_* when continuing after failure doesn't make sense. For example, the second assertion in the Dequeue test is ASSERT_NE(nullptr, n), as we need to dereference the pointer n later, which would lead to a segfault when n is NULL.
 
 ### How it works
->ref above example
- googletest constructs a QueueTest object (let's call it t1).
- t1.SetUp() initializes t1.
- The first test (IsEmptyInitially) runs on t1.
- t1.TearDown() cleans up after the test finishes.
- t1 is destructed.
- The above steps are repeated on another QueueTest object, this time running the DequeueWorks test
## Invoking the tests
TEST() and TEST_F() implicitly register their tests with googletest. So, unlike with many other C++ testing frameworks, you don't have to re-list all your defined tests in order to run them.

After defining your tests, you can run them with RUN_ALL_TESTS(), which returns 0 if all the tests are successful, or 1 otherwise. Note that RUN_ALL_TESTS() runs all tests in your link unit--they can be from different test suites, or even different source files.

When invoked, the RUN_ALL_TESTS() macro:

- Saves the state of all googletest flags.
- Creates a test fixture object for the first test.
- Initializes it via SetUp().
- Runs the test on the fixture object.
- Cleans up the fixture via TearDown().
- Deletes the fixture.
- Restores the state of all googletest flags.
- Repeats the above steps for the next test, until all tests have run.
- If a fatal failure happens the subsequent steps will be skipped.

IMPORTANT: You **must not ignore the return value of RUN_ALL_TESTS(),** or you will get a compiler error. The rationale for this design is that the automated testing service determines whether a test has passed based on its exit code, not on its stdout/stderr output; thus your main() function must return the value of RUN_ALL_TESTS().

Also, you should **call RUN_ALL_TESTS() only once.** Calling it more than once conflicts with some advanced googletest features (e.g., thread-safe death tests) and thus is not supported.

## Writing the main() Function
Most users should not need to write their own main function and instead link with gtest_main (as opposed to with gtest), which defines a suitable entry point.
If you write your own main function, it should return the value of RUN_ALL_TESTS().
```cpp
#include "this/package/foo.h"

#include "gtest/gtest.h"

namespace my {
namespace project {
namespace {

// The fixture for testing class Foo.
class FooTest : public ::testing::Test {
 protected:
  // You can remove any or all of the following functions if their bodies would be empty.

  FooTest() {
     // You can do set-up work for each test here.
  }

  ~FooTest() override {
     // You can do clean-up work that doesn't throw exceptions here.
  }

  // If the constructor and destructor are not enough for setting up
  // and cleaning up each test, you can define the following methods:

  void SetUp() override {
     // Code here will be called immediately after the constructor (right before each test).
  }

  void TearDown() override {
     // Code here will be called immediately after each test (right
     // before the destructor).
  }

  // Class members declared here can be used by all tests in the test suite for Foo.
};

// Tests that the Foo::Bar() method does Abc.
TEST_F(FooTest, MethodBarDoesAbc) {
  const std::string input_filepath = "this/package/testdata/myinputfile.dat";
  const std::string output_filepath = "this/package/testdata/myoutputfile.dat";
  Foo f;
  EXPECT_EQ(f.Bar(input_filepath, output_filepath), 0);
}

// Tests that Foo does Xyz.
TEST_F(FooTest, DoesXyz) {
  // Exercises the Xyz feature of Foo.
}

}  // namespace
}  // namespace project
}  // namespace my

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
```
The ::testing::InitGoogleTest() function parses the command line for googletest flags, and removes all recognized flags. This allows the user to control a test program's behavior via various flags, which we'll cover in the AdvancedGuide. You must call this function before calling RUN_ALL_TESTS(), or the flags won't be properly initialized.

## Parameterized Tests
Write a Parameterized Fixture class derived from ::testing::TestWithParam<T>
```cpp
class ParameterizedTestFixture :public ::testing::TestWithParam<int> {
protected:
    Foo foo;
};
```
Now, let us test a test case with an assertion in it.
```cpp
TEST_P(ParameterizedTestFixture, DoesXYZ) {
    int p = GetParam();
    ASSERT_FALSE(foo.doesXYZ(p));
}
```
Call our use-case with multiple inputs.
```cpp
INSTANTIATE_TEST_CASE_P(
        FooTests,
        ParameterizedTestFixture,
        ::testing::Values(
                1, 711, 1989, 2013
        ));
```
### Write Parameterized tests based on existing fixture
Assume we have above TestFixture written and we may want to reuse its underlying Foo class.
```cpp
class TestFixtureToBeParameterized : public ::testing::Test
{
protected:
  Foo foo;
};

class ParametrizedTestFixtureBasedOnFixture :
  public TestFixtureToBeParameterized,
  public ::testing::WithParamInterface<int> {
};
```
### Pass multiple parameters to the same test case?
You can not pass more than one argument but definitely std::pair or std::tuple
```cpp
class MultipleParametersTests :public       ::testing::TestWithParam<std::tuple<int, bool>> {
protected:
    Foo foo;
};
TEST_P(MultipleParametersTests, DoesXYZ) {
    bool expected = std::get<1>(GetParam());
    int p = std::get<0>(GetParam());
    ASSERT_EQ(expected, foo.DoesXYZ(p));
}

INSTANTIATE_TEST_CASE_P(
        LeapYearTests,
        LeapYearMultipleParametersTests,
        ::testing::Values(
                std::make_tuple(7, false),
                std::make_tuple(2001, false),
                std::make_tuple(1996, true),
                std::make_tuple(1700, false),
                std::make_tuple(1600, true)));
```

## Points
We should not call tests with different param in loop because if one fails it will not allow following tests to run.

A good unittest should have only one logical assertion - some exceptions as always apply
## Reference
https://github.com/google/googletest/blob/master/googletest/docs/primer.md

For Parameterized Tests

https://www.sandordargo.com/blog/2019/04/24/parameterized-testing-with-gtest

