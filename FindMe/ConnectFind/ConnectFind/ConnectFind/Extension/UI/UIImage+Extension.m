//
//  UIImage+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (instancetype)fullSizeScreenshotOfView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    return UIGraphicsGetImageFromCurrentImageContext();
}

+ (instancetype)stretchImageNamed:(NSString *)name {
    
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
