//
//  NSArray+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (id)objectAtIndexThatCanBeNegative:(NSInteger)index {
    
    index = (index >= 0 ? index : self.count + index);
    
    return [self objectAtIndex:index];
}

- (id)filteredObjectUsingPredicateWithFormat:(NSString *)format, ... {
    
    va_list arglist;
    va_start(arglist, format);
    va_end(arglist);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format arguments:arglist];
    return [self filteredArrayUsingPredicate:predicate].firstObject;
}

@end
