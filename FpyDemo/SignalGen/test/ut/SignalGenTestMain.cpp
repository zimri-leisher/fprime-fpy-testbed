// ----------------------------------------------------------------------
// TestMain.cpp
// ----------------------------------------------------------------------

#include "SignalGenTester.hpp"

TEST(Nominal, TestStart) {
    FpyDemo::SignalGenTester tester;
    tester.test_start();
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
