#include <stdio.h>
#include "../my_math_test.h"

int main() {
    int number_failed;
    SRunner *sr;

    sr = srunner_create(my_pow_suite());

    srunner_set_fork_status(sr, CK_NOFORK);
    srunner_run_all(sr, CK_VERBOSE);

    number_failed = srunner_ntests_failed(sr);

    srunner_free(sr);
    
    return (number_failed == 0) ? 0 : 1;
}
