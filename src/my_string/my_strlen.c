#include "../../include/my_string.h"

size_t my_strlen(const char *s) {
    size_t len = 0;
    while (*s++) len++;
    return len;
}
