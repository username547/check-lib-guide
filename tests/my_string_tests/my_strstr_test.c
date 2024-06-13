#include "../../include/my_string.h"
#include "../my_string_test.h"

START_TEST(my_strstr_normal_test) {
    char str[SIZE] = "hello world";
    char *expected = strstr(str, "world");
    char *func_result = my_strstr(str, "world");
    ck_assert_ptr_eq(expected, func_result);
}
END_TEST

START_TEST(my_strstr_not_found_test) {
    char str[SIZE] = "hello world";
    char *expected = strstr(str, "test");
    char *func_result = my_strstr(str, "test");
    ck_assert_ptr_eq(expected, func_result);
}
END_TEST

Suite *my_strstr_suite(void) {
    Suite *s;
    TCase *tc_core;

    s = suite_create("my_strstr");

    tc_core = tcase_create("core");

    tcase_add_test(tc_core, my_strstr_normal_test);
    tcase_add_test(tc_core, my_strstr_not_found_test);
    suite_add_tcase(s, tc_core);

    return s;
}