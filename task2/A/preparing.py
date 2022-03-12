#Make index.h file with hello_world() function, 
#which prints Hello, World!

import sys

index_file = open(sys.argv[1], "w")

index_file.write("""#include <iostream>

void hello_world() {
    std::cout << "Hello, World!\n";
}
""")
