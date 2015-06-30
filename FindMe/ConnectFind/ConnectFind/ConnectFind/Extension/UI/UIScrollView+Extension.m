//
//  UIScrollView+Extension.m
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

#import "UIScrollView+Extension.h"
#import "UIView+Extension.h"

@implementation UIScrollView (Content)

- (CGFloat)contentOffsetX {
    
    return self.contentOffset.x;
}
- (void)setContentOffsetX:(CGFloat)contentOffsetX {
    
    self.contentOffset = CGPointMake(contentOffsetX, self.contentOffset.y);
}

- (CGFloat)contentOffsetY {
    
    return self.contentOffset.y;
}
- (void)setContentOffsetY:(CGFloat)contentOffsetY {
    
    self.contentOffset = CGPointMake(self.contentOffset.x, contentOffsetY);
}



- (CGFloat)contentSizeWidth {
    
    return self.contentSize.width;
}
- (void)setContentSizeWidth:(CGFloat)contentSizeWidth {
    
    self.contentSize = CGSizeMake(contentSizeWidth, self.contentSize.height);
}

- (CGFloat)contentSizeHeight {
    
    return self.contentSize.height;
}
- (void)setContentSizeHeight:(CGFloat)contentSizeHeight {
    
    self.contentSize = CGSizeMake(self.contentSize.width, contentSizeHeight);
}


- (CGFloat)contentInsetTop {
    
    return self.contentInset.top;
}
- (void)setContentInsetTop:(CGFloat)contentInsetTop {
    
    UIEdgeInsets edge = self.contentInset;
    edge.top = contentInsetTop;
    self.contentInset = edge;
}

- (CGFloat)contentInsetBottom {
    
    return self.contentInset.bottom;
}
- (void)setContentInsetBottom:(CGFloat)contentInsetBottom {
    
    UIEdgeInsets edge = self.contentInset;
    edge.bottom = contentInsetBottom;
    self.contentInset = edge;
}

- (CGFloat)contentInsetLeft {
    
    return self.contentInset.left;
}
- (void)setContentInsetLeft:(CGFloat)contentInsetLeft {
    
    UIEdgeInsets edge = self.contentInset;
    edge.left = contentInsetLeft;
    self.contentInset = edge;
}

- (CGFloat)contentInsetRight {
    
    return self.contentInset.right;
}
- (void)setContentInsetRight:(CGFloat)contentInsetRight {
    
    UIEdgeInsets edge = self.contentInset;
    edge.right = contentInsetRight;
    self.contentInset = edge;
}

@end


@implementation UIScrollView (ScrollTo)

- (void)scrollToTopAnimated:(BOOL)animated {
    
    [self setContentOffset:CGPointMake(self.contentOffsetX, 0) animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    
    CGFloat temp = self.contentSizeHeight - self.height;
    [self setContentOffset:CGPointMake(self.contentOffsetX, temp) animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated {
    
    [self setContentOffset:CGPointMake(0, self.contentOffsetY) animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated {
    
    CGFloat temp = self.contentSizeWidth - self.width;
    [self setContentOffset:CGPointMake(temp, self.contentOffsetY) animated:animated];
}

@end

