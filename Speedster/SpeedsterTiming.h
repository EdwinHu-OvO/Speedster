#pragma once

#include <math.h>

extern double SpeedsterSlowdownMultiplier;

static inline double SpeedsterClampSlowdown(double multiplier) {
    if (!isfinite(multiplier)) {
        return 1.0;
    }
    return fmax(0.1, fmin(1.0, multiplier));
}
