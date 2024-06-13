#include "../../include/my_math.h"
#include "../my_math_test.h"

START_TEST(my_pow_normal_test) {
    double base = 2.0;
    double exponent = 3.0;
    double expected = pow(base, exponent);
    double func_result = my_pow(base, exponent);
    ck_assert_double_eq_tol(expected, func_result, 1e-9);
}
END_TEST

START_TEST(my_pow_zero_exponent_test) {
    double base = 3.0;
    double exponent = 0.0;
    double expected = pow(base, exponent);
    double func_result = my_pow(base, exponent);
    ck_assert_double_eq_tol(expected, func_result, 1e-9);
}
END_TEST

START_TEST(my_pow_negative_base_test) {
    double base = -2.0;
    double exponent = 3.0;
    double expected = pow(base, exponent);
    double func_result = my_pow(base, exponent);
    ck_assert_double_eq_tol(expected, func_result, 1e-9);
}
END_TEST

START_TEST(my_pow_negative_exponent_test) {
    double base = 2.0;
    double exponent = -3.0;
    double expected = pow(base, exponent);
    double func_result = my_pow(base, exponent);
    ck_assert_double_eq_tol(expected, func_result, 1e-9);
}
END_TEST

Suite *my_pow_suite(void) {
    Suite *s;
    TCase *tc_core;

    s = suite_create("my_pow");

    tc_core = tcase_create("core");

    tcase_add_test(tc_core, my_pow_normal_test);
    tcase_add_test(tc_core, my_pow_zero_exponent_test);
    tcase_add_test(tc_core, my_pow_negative_base_test);
    tcase_add_test(tc_core, my_pow_negative_exponent_test);
    suite_add_tcase(s, tc_core);

    return s;
}
