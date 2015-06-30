//
//  UIDevice+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <UIKit/UIKit.h>


#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define IS_IPAD  ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] &&[[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

//#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)

@interface UIDevice (Extension)

+ (BOOL)isSimulator;

@end
