#include "cur_time.h"
#include "hello-lib/util.h"

int main()
{
    CppTime timeobj;
    timeobj.PrintTime();

    LibUtil util;
    util.Serve();
    return 0;
}