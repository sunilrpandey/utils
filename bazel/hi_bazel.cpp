#include <iostream>
#include "hi_lib.h"

int main()
{
    std::cout << "Hi from  Bazel root!!" << std::endl;
    std::cout << "Num from lib : " << give_me_one() << std::endl;
    return 0;
}
