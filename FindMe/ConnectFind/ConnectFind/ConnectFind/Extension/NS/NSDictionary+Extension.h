//
//  NSDictionary+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

- (NSString *)stringForKey:(id)key;
- (NSNumber *)numberForKey:(id)key;
- (NSInteger)integerForKey:(id)key;
- (NSUInteger)unsignedIntegerForKey:(id)key;

- (BOOL)boolForKey:(id)key;

- (float)floatForKey:(id)key;
- (float)doubleForKey:(id)key;

@end
