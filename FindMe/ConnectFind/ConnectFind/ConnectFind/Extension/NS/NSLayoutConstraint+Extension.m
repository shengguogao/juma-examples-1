//
//  NSLayoutConstraint+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "NSLayoutConstraint+Extension.h"

@implementation NSLayoutConstraint (Extension)


+ (instancetype)constraintWithItem:(id)view1
                         attribute:(NSLayoutAttribute)attr1
                         relatedBy:(NSLayoutRelation)relation
                            toItem:(id)view2
                         attribute:(NSLayoutAttribute)attr2
                        multiplier:(CGFloat)multiplier
                          constant:(CGFloat)c
                          priority:(UILayoutPriority)priority {
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view1
                                                                  attribute:attr1
                                                                  relatedBy:relation
                                                                     toItem:view2
                                                                  attribute:attr2
                                                                 multiplier:multiplier
                                                                   constant:c];
    
    constraint.priority = priority;
    
    return constraint;
}

@end
