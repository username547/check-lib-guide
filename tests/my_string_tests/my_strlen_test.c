#include "../../include/my_string.h"
#include "../my_string_test.h"

START_TEST(my_strlen_empty_string_test) {
    char str[SIZE] = "";
    int expected = strlen(str);
    int func_result = my_strlen(str);
    ck_assert_uint_eq(expected, func_result);
}
END_TEST

START_TEST(my_strlen_normal_string_test) {
    char str[SIZE] = "hello world";
    int expected = strlen(str);
    int func_result = my_strlen(str);
    ck_assert_uint_eq(expected, func_result);
}
END_TEST

Suite *my_strlen_suite(void) {
    Suite *s;
    TCase *tc_core;

    s = suite_create("my_strlen");

    tc_core = tcase_create("core");

    tcase_add_test(tc_core, my_strlen_empty_string_test);
    tcase_add_test(tc_core, my_strlen_normal_string_test);
    suite_add_tcase(s, tc_core);

    return s;
}
