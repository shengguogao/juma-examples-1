//
//  NSLayoutConstraint+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

//    Does the constraint reference something from outside the subtree of the view?  That's illegal
//    上面的错误可能是因为把应该添加到父控件上的约束添加到当前控件身上

//    如果两个 NSLayoutConstraint 有冲突, 优先级更高的会覆盖优先级更低

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Extension)

/** attach parameter "priority" can be setted behind parameter "constant" */
+ (instancetype)constraintWithItem:(id)view1
                         attribute:(NSLayoutAttribute)attr1
                         relatedBy:(NSLayoutRelation)relation
                            toItem:(id)view2
                         attribute:(NSLayoutAttribute)attr2
                        multiplier:(CGFloat)multiplier
                          constant:(CGFloat)c
                          priority:(UILayoutPriority)priority;

@end
