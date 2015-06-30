//
//  UIView+Extension.h
//  ExtensionAndSubClassForOC
//
//  Created by anjun on 1/28/15.
//  Copyright (c) 2015 汪安军. All rights reserved.
//

// 修改 bounds 的 size 不会改变 view 的 center, 改变 frame 的 size 会改变

// 从属于 UIViewController 的 UIView 实例的产生方式和优先级
// 1 重写 -loadView 方法
// 2 storyboard 中有和这个 Controller 关联的视图控制器
// 3 以这个 Controller 的类名去掉文字 "Controller" 后为名称的 xib 文件中的 UIView 实例. 例如类名为 ABCViewController 的类和名为 ABCView.xib 的 xib 文件
// 4 和这个 Controller 同名的 xib 文件中的 UIView 实例.

#import <UIKit/UIKit.h>

@interface UIView (Center_Frame_Bounds)

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat frameX;
@property (nonatomic, assign) CGFloat frameY;

@property (nonatomic, assign) CGFloat boundsX;
@property (nonatomic, assign) CGFloat boundsY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@end
