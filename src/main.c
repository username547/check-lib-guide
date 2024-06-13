#include <stdio.h>
#include "../include/my_string.h"
#include "../include/my_math.h"

int main() {
    char *str = "Hello, World!";
    printf("string: %s\n", str);
    printf("string length: %lu\n", my_strlen(str));
    printf("3 ^ 3 = %.0f\n", my_pow(3, 3));
    return 0;
}
