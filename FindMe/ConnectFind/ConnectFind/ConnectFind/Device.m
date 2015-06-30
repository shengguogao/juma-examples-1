//
//  Device.m
//  JumaFinder
//
//  Created by Wang AnJun on 15/5/8.
//  Copyright (c) 2015年 Jumacc. All rights reserved.
//
//**************Device Modal****************/

#import "Device.h"

@implementation Device

- (instancetype)initWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI {
    if (self = [super init]) {
        self.name = name;
        self.UUID = UUID;
        self.RSSI = RSSI;
    }
    return self;
}

+ (instancetype)deviceWithName:(NSString *)name UUID:(NSString *)UUID RSSI:(NSNumber *)RSSI {
    return [[self alloc] initWithName:name UUID:UUID RSSI:RSSI];
}

@end
