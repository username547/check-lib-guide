#ifndef MY_STRING_TEST_H
#define MY_STRING_TEST_H

#define SIZE 256

#include <check.h>
#include <string.h>

Suite *my_strlen_suite(void);
Suite *my_strchr_suite(void);
Suite *my_strstr_suite(void);

#endif