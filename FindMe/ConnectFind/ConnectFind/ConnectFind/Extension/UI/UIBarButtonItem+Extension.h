//
//  UIBarButtonItem+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/** 去掉了文字的系统样式的返回按钮 */
+ (UIBarButtonItem *)systemBackButtonWithNullTitle;


- (instancetype)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName target:(id)target action:(SEL)action;
+ (instancetype)itemWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

@end
