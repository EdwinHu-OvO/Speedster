#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "SpeedsterTiming.h"

%group InAppSlowdown

%hook CALayer

- (void)addAnimation:(CAAnimation *)animation forKey:(NSString *)key {
    double multiplier = SpeedsterSlowdownMultiplier;
    if (multiplier == 1.0 || animation == nil) {
        %orig;
        return;
    }

    // Scale the animation clock, including spring and group animations, once.
    // Copy first so reusing an animation does not compound the slowdown.
    CAAnimation *slowedAnimation = [animation copy];
    slowedAnimation.speed *= multiplier;
    %orig(slowedAnimation, key);
}

%end

%end

%ctor {
    if (![[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
        %init(InAppSlowdown);
    }
}
