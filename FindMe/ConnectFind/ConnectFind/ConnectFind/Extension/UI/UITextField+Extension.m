//
//  UITextField+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 2/12/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)


- (UIColor *)placeholderColor {
    
    return [self valueForKeyPath:@"_placeholderLabel.textColor"];
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end
