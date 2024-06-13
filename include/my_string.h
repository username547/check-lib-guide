#ifndef MY_STRING_H
#define MY_STRING_H

#include <stdio.h>

size_t my_strlen(const char *s);
char* my_strchr(const char *s, int c);
char* my_strstr(const char *haystack, const char *needle);

#endif