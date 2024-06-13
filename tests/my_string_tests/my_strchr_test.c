#include "../../include/my_string.h"
#include "../my_string_test.h"

START_TEST(my_strchr_normal_test) {
    char str[SIZE] = "hello";
    char *expected = strchr(str, 'l');
    char *func_result = my_strchr(str, 'l');
    ck_assert_ptr_eq(expected, func_result);
}
END_TEST

START_TEST(my_strchr_not_found_test) {
    char str[SIZE] = "hello";
    char *expected = strchr(str, 'q');
    char *func_result = my_strchr(str, 'q');
    ck_assert_ptr_eq(expected, func_result);
}
END_TEST

Suite *my_strchr_suite(void) {
    Suite *s;
    TCase *tc_core;

    s = suite_create("my_strchr");

    tc_core = tcase_create("core");

    tcase_add_test(tc_core, my_strchr_normal_test);
    tcase_add_test(tc_core, my_strchr_not_found_test);
    suite_add_tcase(s, tc_core);

    return s;
}