//
//  UIBarButtonItem+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"

@implementation UIBarButtonItem (Extension)

- (UIBarButtonItem *)flexibleBarButtonItem {
    
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

+ (UIBarButtonItem *)systemBackButtonWithNullTitle {
    
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (instancetype)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName target:(id)target action:(SEL)action {
    
    UIButton *button = [[UIButton alloc] init];
    
    // 设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+ (instancetype)itemWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName target:(id)target action:(SEL)action {
    
    return [[self alloc] initWithImage:imageName highlightedImage:highlightedImageName target:target action:action];
}

@end
