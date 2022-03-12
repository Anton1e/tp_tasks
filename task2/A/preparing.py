#Make index.h file with hello_world() function, 
#which prints Hello, World!

index_file = open("index.h", "w")

index_file.write("""#include <iostream>

void hello_world() {
    std::cout << "Hello, World!\n";
}
""")
