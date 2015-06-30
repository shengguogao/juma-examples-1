//
//  UIAlertView+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Extension)

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message, ... NS_FORMAT_FUNCTION(2,3);

@end
