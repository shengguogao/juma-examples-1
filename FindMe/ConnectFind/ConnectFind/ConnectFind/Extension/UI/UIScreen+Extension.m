//
//  UIScreen+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

@end


@implementation UIScreen (Size)

+ (BOOL)is3_5inch {
    return SCREEN_HEIGHT == 480.0;
}
+ (BOOL)is4_0inch {
    return SCREEN_HEIGHT == 568.0;
}
+ (BOOL)is4_7inch {
    return SCREEN_HEIGHT == 667.0;
}
+ (BOOL)is5_5inch {
    return SCREEN_HEIGHT == 736.0;
}

@end
