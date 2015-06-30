//
//  NSUserDefaults+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "NSUserDefaults+Extension.h"

@implementation NSUserDefaults (Extension)

+ (BOOL)synchronizeObject:(id)value forKey:(NSString *)key {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:value forKey:key];
    
    return [userDefaults synchronize] || [userDefaults synchronize];
} 

@end
