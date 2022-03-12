#include <string>
#include "gtest/gtest.h"
#include "B/lib.h"
#include "A/index.h"

TEST(Adder, SumOfTwoInts) {
    int first_num = 100;
    int second_num = 59;
    EXPECT_EQ(sum(first_num, second_num), 159);
}

TEST(Adder, SumOfTwoStrings) {
    std::string first_str = "100";
    std::string second_str = "59";
    EXPECT_EQ(string_add(first_str, second_str), "10059");
}

int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
