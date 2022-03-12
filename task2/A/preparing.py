#Make index.h file with string_add function, 
#which returns the sum of 2 strings

import sys

index_file = open(sys.argv[1], "w")

index_file.write("""#include <iostream>

std::string string_add(std::string str1, std::string str2) {
    return str1 + str2;
}
""")
