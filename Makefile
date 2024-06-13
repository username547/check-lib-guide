CC = gcc
FLAGS = -Wall -Wextra -Werror -std=c11 -g --coverage
LDFLAGS = -lcheck -lm -lsubunit
AR = ar
ARFLAGS = rcs

SRC_DIR = src
TEST_DIR = tests
BUILD_DIR = build
COV_DIR = coverage

# исходные файлы .c
SRC_MY_STRING = $(SRC_DIR)/my_string/my_strlen.c\
				$(SRC_DIR)/my_string/my_strchr.c\
				$(SRC_DIR)/my_string/my_strstr.c
SRC_MY_MATH = $(SRC_DIR)/my_math/my_pow.c

SRC_MY_STRING_TEST = $(TEST_DIR)/my_string_tests/my_strlen_test.c \
                      $(TEST_DIR)/my_string_tests/my_strchr_test.c \
                      $(TEST_DIR)/my_string_tests/my_strstr_test.c
SRC_MY_MATH_TEST = $(TEST_DIR)/my_math_tests/my_pow_test.c

SRC_MY_STRING_TEST_RUNNER = $(TEST_DIR)/test_runners/test_main_string.c
SRC_MY_MATH_TEST_RUNNER = $(TEST_DIR)/test_runners/test_main_math.c

SRC_MAIN = $(SRC_DIR)/main.c

# объектные файлы .o
OBJ_MY_STRING = $(BUILD_DIR)/my_string/my_strlen.o \
                $(BUILD_DIR)/my_string/my_strchr.o \
                $(BUILD_DIR)/my_string/my_strstr.o
OBJ_MY_MATH = $(BUILD_DIR)/my_math/my_pow.o

OBJ_MY_STRING_TEST = $(BUILD_DIR)/tests/my_string_tests/my_strlen_test.o \
                      $(BUILD_DIR)/tests/my_string_tests/my_strchr_test.o \
                      $(BUILD_DIR)/tests/my_string_tests/my_strstr_test.o
OBJ_MY_MATH_TEST = $(BUILD_DIR)/tests/my_math_tests/my_pow_test.o

OBJ_MY_STRING_TEST_RUNNER = $(BUILD_DIR)/tests/test_runners/my_string_test_runner.o
OBJ_MY_MATH_TEST_RUNNER = $(BUILD_DIR)/tests/test_runners/my_math_test_runner.o

OBJ_MAIN = $(BUILD_DIR)/main/main.o

# основные цели
TARGET_MY_STRING_LIB = $(BUILD_DIR)/libmy_string.a
TARGET_MY_MATH_LIB = $(BUILD_DIR)/libmy_math.a
TARGET_MY_STRING_TEST = $(BUILD_DIR)/my_string_test_exe
TARGET_MY_MATH_TEST = $(BUILD_DIR)/my_math_test_exe
TARGET_MAIN = $(BUILD_DIR)/main_exe

# $< - автоматически подставляет зависимости
# $@ - автоматически подставляет цель
# -c - создание объектных файлов
# -o - имя выходного объектного файла
# -L - указывает директорию, где искать библиотеку
# -l - подключает библитеку (имя библиотеки указывается без префикса lib)

# компиляция исходных файлов my_string .c в объектные файлы .o
$(BUILD_DIR)/my_string/%.o: $(SRC_DIR)/my_string/%.c | $(BUILD_DIR)/my_string
	$(CC) $(FLAGS) -c $< -o $@

# компиляция исходных файлов my_math .c в объектные файлы .o
$(BUILD_DIR)/my_math/%.o: $(SRC_DIR)/my_math/%.c | $(BUILD_DIR)/my_math
	$(CC) $(FLAGS) -c $< -o $@

# компиляция исходных файлов тестов my_string .c в объектные файлы .o
$(BUILD_DIR)/tests/my_string_tests/%.o: $(TEST_DIR)/my_string_tests/%.c | $(BUILD_DIR)/tests/my_string_tests
	$(CC) $(FLAGS) -c $< -o $@

# компиляция исходных файлов тестов my_math .c в объектные файлы .o
$(BUILD_DIR)/tests/my_math_tests/%.o: $(TEST_DIR)/my_math_tests/%.c | $(BUILD_DIR)/tests/my_math_tests
	$(CC) $(FLAGS) -c $< -o $@

# компиляция исходных файлов тестов my_string_runner .c в объектные файлы .o
$(BUILD_DIR)/tests/test_runners/%.o: $(TEST_DIR)/test_runners/%.c | $(BUILD_DIR)/tests/test_runners
	$(CC) $(FLAGS) -c $< -o $@

# компиляция main.c в объектный файл main.o
$(BUILD_DIR)/main/%.o: $(SRC_MAIN) | $(BUILD_DIR)/main
	$(CC) $(FLAGS) -c $< -o $@

# создание директории для объектных файлов my_string
$(BUILD_DIR)/my_string:
	mkdir -p $@

# создание директории для объектных файлов my_math
$(BUILD_DIR)/my_math:
	mkdir -p $@

# создание директории для объектных файлов тестов my_string
$(BUILD_DIR)/tests/my_string_tests:
	mkdir -p $@

# создание директории для объектных файлов тестов my_math
$(BUILD_DIR)/tests/my_math_tests:
	mkdir -p $@

# создание директории для объектных файлов тестов test_runners
$(BUILD_DIR)/tests/test_runners:
	mkdir -p $@

# создание директории для объектных файлов main
$(BUILD_DIR)/main:
	mkdir -p $@

# формирование статической библиотеки libmy_string.a
$(TARGET_MY_STRING_LIB): $(OBJ_MY_STRING)
	$(AR) $(ARFLAGS) $@ $^

# формирование статической библиотеки libmy_math.a
$(TARGET_MY_MATH_LIB): $(OBJ_MY_MATH)
	$(AR) $(ARFLAGS) $@ $^

# компиляция тестов для my_string с подключением статической библиотеки libmy_string.a
$(TARGET_MY_STRING_TEST): $(OBJ_MY_STRING_TEST) $(OBJ_MY_STRING_TEST_RUNNER)
	$(CC) $(FLAGS) -L$(BUILD_DIR) $^ -o $@ -lmy_string $(LDFLAGS)

# компиляция тестов для my_math с подключением статической библиотеки libmy_math.a
$(TARGET_MY_MATH_TEST): $(OBJ_MY_MATH_TEST) $(OBJ_MY_MATH_TEST_RUNNER)
	$(CC) $(FLAGS) -L$(BUILD_DIR) $^ -o $@ -lmy_math $(LDFLAGS)

# компиляция main с подключением статических библиотек libmy_string.a и libmy_math.a
$(TARGET_MAIN): $(OBJ_MAIN) $(TARGET_MY_STRING_LIB) $(TARGET_MY_MATH_LIB)
	$(CC) $(FLAGS) -L$(BUILD_DIR) $< -o $@ -lmy_string -lmy_math $(LDFLAGS)

my_string.a: $(TARGET_MY_STRING_LIB)

my_math.a: $(TARGET_MY_MATH_LIB)

my_string_test: $(TARGET_MY_STRING_LIB) $(TARGET_MY_STRING_TEST)
	$(TARGET_MY_STRING_TEST)

my_math_test: $(TARGET_MY_MATH_LIB) $(TARGET_MY_MATH_TEST)
	$(TARGET_MY_MATH_TEST)

main: $(TARGET_MAIN)
	$(TARGET_MAIN)

libs: $(TARGET_MY_STRING_LIB) $(TARGET_MY_MATH_LIB)

tests: $(TARGET_MY_STRING_LIB) $(TARGET_MY_MATH_LIB) $(TARGET_MY_STRING_TEST) $(TARGET_MY_MATH_TEST)
	$(TARGET_MY_STRING_TEST)
	$(TARGET_MY_MATH_TEST)

all: libs tests main

rebuild: clean all

gcov_report: tests
	mkdir -p $(COV_DIR)
	lcov --capture --directory $(BUILD_DIR) --output-file $(COV_DIR)/coverage.info
	genhtml $(COV_DIR)/coverage.info --output-directory $(COV_DIR)

clean:
	rm -rf $(BUILD_DIR) $(COV_DIR)
