//
//  NSUserDefaults+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

+ (BOOL)synchronizeObject:(id)value forKey:(NSString *)key; 

@end
