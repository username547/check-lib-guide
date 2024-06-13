#include "../../include/my_string.h"

char* my_strstr(const char *string, const char *pattern) {
    if (!*pattern) return (char*)string;
    char *p1 = (char*)string;
    while (*p1) {
        char *p1_begin = p1, *p2 = (char*)pattern;
        while (*p1 && *p2 && *p1 == *p2) {
            p1++;
            p2++;
        }
        if (!*p2) return p1_begin;
        p1 = p1_begin + 1;
    }
    return NULL;
}
