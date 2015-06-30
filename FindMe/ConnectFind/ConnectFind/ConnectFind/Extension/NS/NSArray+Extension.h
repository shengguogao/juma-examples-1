//
//  NSArray+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension) 

/** 参数为负表示逆向取值, -1 表示最后一个, -2 表示倒数第二个, 依次类推 */
- (id)objectAtIndexThatCanBeNegative:(NSInteger)index;

- (id)filteredObjectUsingPredicateWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end
