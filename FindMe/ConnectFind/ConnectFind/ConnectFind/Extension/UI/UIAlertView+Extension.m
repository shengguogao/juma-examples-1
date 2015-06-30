//
//  UIAlertView+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIAlertView+Extension.h"

@implementation UIAlertView (Extension)

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message, ... {
    
    va_list arglist;
    va_start(arglist, message);
    NSString *outStr = [[NSString alloc] initWithFormat:message arguments:arglist];
    va_end(arglist);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:outStr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

@end
