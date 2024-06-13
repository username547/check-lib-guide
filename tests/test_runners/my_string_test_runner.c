#include <stdio.h>
#include "../my_string_test.h"

int main() {
    int number_failed;
    SRunner *sr;

    sr = srunner_create(my_strlen_suite());
    srunner_add_suite(sr, my_strchr_suite());
    srunner_add_suite(sr, my_strstr_suite());

    srunner_set_fork_status(sr, CK_NOFORK);
    srunner_run_all(sr, CK_VERBOSE);

    number_failed = srunner_ntests_failed(sr);

    srunner_free(sr);

    return (number_failed == 0) ? 0 : 1;
}
