//
//  UIScreen+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface UIScreen (Extension)


@end

@interface UIScreen (Size)

+ (BOOL)is3_5inch;
+ (BOOL)is4_0inch;
+ (BOOL)is4_7inch;
+ (BOOL)is5_5inch;

@end
