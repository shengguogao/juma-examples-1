//
//  UIDevice+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)

+ (BOOL)isSimulator {
    
    return [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location != NSNotFound;
}

@end
