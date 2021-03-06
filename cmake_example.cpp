#include <iostream>
#include "version_def.h"
#ifdef USE_LIB1
#include <lib1.h>
#endif

using namespace std;

int main(int argc, char *argv[])
{
    if (argc < 2) {
        // report version
        std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "." << Tutorial_VERSION_MINOR << std::endl;
        std::cout << "Usage: " << argv[0] << " number" << std::endl;
        return 1;
    }

#ifdef USE_LIB1
    lib1_func1();
#endif
}


