//
//  UIView+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Keyboard)

- (void)keyboardChangeFrame:(NSNotification *)note {
    
    NSLog(@"%@", note.userInfo);
    
    // 1 动画 curve
    UIViewAnimationCurve curve = [note.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    // 2 动画 duration
    NSTimeInterval dutation = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 3 键盘完全弹出后的位置
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationDuration:dutation];
    
//    self.view.frameY = keyboardFrame.origin.y - SCREEN_HEIGHT;
    
    [UIView commitAnimations];
    
}

@end

@implementation UIView (Center_Frame_Bounds)

- (CGFloat)centerX {
    
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    
    self.center = CGPointMake(centerX, self.center.y);
}
- (CGFloat)centerY {
    
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    
    self.center = CGPointMake(self.center.x, centerY);
}



- (CGFloat)frameX {
    
    return self.frame.origin.x;
}
- (void)setFrameX:(CGFloat)frameX {
    
    CGRect frame = self.frame;
    frame.origin.x = frameX;
    self.frame = frame;
}
- (CGFloat)frameY {
    
    return self.frame.origin.y;
}
- (void)setFrameY:(CGFloat)frameY {
    
    CGRect frame = self.frame;
    frame.origin.y = frameY;
    self.frame = frame;
}



- (CGFloat)boundsX {
    
    return self.bounds.origin.x;
}
- (void)setBoundsX:(CGFloat)boundsX {
    
    CGRect bounds = self.bounds;
    bounds.origin.x = boundsX;
    self.bounds = bounds;
}
- (CGFloat)boundsY {
    
    return self.bounds.origin.y;
}
- (void)setBoundsY:(CGFloat)boundsY {
    
    CGRect bounds = self.bounds;
    bounds.origin.y = boundsY;
    self.bounds = bounds;
}



- (CGFloat)width {
    
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)height{
    
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGSize)size {
    
    return self.frame.size;
}
- (void)setSize:(CGSize)size {
    
    self.frame = (CGRect){self.frame.origin, size};
}

@end
