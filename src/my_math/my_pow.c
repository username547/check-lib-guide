#include "../../include/my_math.h"

double my_pow(double base, double exponent) {
    double result;

    if (exponent == 0) {
        result = 1;
    } else if (exponent < 0) {
        result = 1 / my_pow(base, -exponent);
    } else if ((int)exponent % 2 == 0) {
        result = my_pow(base * base, exponent / 2);
    } else {
        result = base * my_pow(base, exponent - 1);
    }

    return result;
}
