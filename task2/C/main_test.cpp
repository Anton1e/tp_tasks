#include "gtest/gtest.h"
#include "B/lib.h"

TEST(Adder, SumOfTwoInts1) {
    int first_num = 100;
    int second_num = 59;
    EXPECT_EQ(sum(first_num, second_num), 159);
}

TEST(Adder, SumOfTwoInts2) {
    int first_num = 99;
    int second_num = 1;
    EXPECT_EQ(sum(first_num, second_num), 100);
}

int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
