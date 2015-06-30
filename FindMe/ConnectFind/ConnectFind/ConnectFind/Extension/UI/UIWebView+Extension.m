//
//  UIWebView+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/29/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIWebView+Extension.h"

@implementation UIWebView (Extension)

- (void)loadRequestWithURLString:(NSString *)URLString {
    
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];
}

@end
