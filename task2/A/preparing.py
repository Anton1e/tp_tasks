#Make index.h file with string_add function, 
#which returns the sum of 2 strings

import sys

indexh_file = open(sys.argv[1], "w")

indexh_file.write("""#pragma once
#include <string>

std::string string_add(std::string str1, std::string str2);
""")

indexcpp_file = open(sys.argv[2], "w")

indexcpp_file.write("""#include "index.h"

std::string string_add(std::string str1, std::string str2) {
    return str1 + str2;
}
""")
