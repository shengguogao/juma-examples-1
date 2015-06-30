//
//  NSDictionary+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)stringForKey:(id)key {
    
    id value = [self objectForKey:key];
    
    if (value) {
        
        if ([value isKindOfClass:[NSString class]])
            return value;
        
        if ([value isKindOfClass:[NSNumber class]])
            return [value stringValue];
        
        //        return [value description];
//        NSAssert(1, @"NSDictioniary can not get value(NSString) from \"%s\"", [[value description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    return nil;
}

- (NSNumber *)numberForKey:(id)key {
    
    id value = [self objectForKey:key];
    
    if (value) {
        
        if ([value isKindOfClass:[NSNumber class]])
            return value;
        
        if ([value isKindOfClass:[NSString class]])
            return [[[NSNumberFormatter alloc] init] numberFromString:value]; // value returned might be nil
        
//        NSAssert(1, @"NSDictioniary can not get value(NSNumber) from \"%s\"", [[value description] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    
    return nil;
}

- (NSInteger)integerForKey:(id)key {
    
    return [[self numberForKey:key] integerValue];
}

- (NSUInteger)unsignedIntegerForKey:(id)key {
    
    return [[self numberForKey:key] unsignedIntegerValue];
}


- (BOOL)boolForKey:(id)key {
    
    return [[self numberForKey:key] boolValue];
}

- (float)floatForKey:(id)key {
    
    return [[self numberForKey:key] floatValue];
}

- (float)doubleForKey:(id)key {
    
    return [[self numberForKey:key] doubleValue];
}


@end
