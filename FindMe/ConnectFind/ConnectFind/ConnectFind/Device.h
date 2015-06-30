//
//  Device.h
//  JumaFinder
//
//  Created by Wang AnJun on 15/5/8.
//  Copyright (c) 2015年 Jumacc. All rights reserved.
//
//**************Device Modal****************/

@import Foundation; 

@interface Device : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *UUID;
@property (nonatomic, strong) NSNumber *RSSI;

- (instancetype)initWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI;
+ (instancetype)deviceWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI;

@end
