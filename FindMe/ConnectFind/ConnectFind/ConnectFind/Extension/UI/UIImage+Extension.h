//
//  UIImage+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/** 获取某个 view 的全尺寸截图 */
+ (instancetype)fullSizeScreenshotOfView:(UIView *)view;

/** 根据图片名返回一张能够自由拉伸的图片 */
+ (instancetype)stretchImageNamed:(NSString *)name;

@end
