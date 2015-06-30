//
//  SearchViewController.h
//  JumaFinder
//
//  Created by Wang AnJun on 15/5/11.
//  Copyright (c) 2015年 Jumacc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JumaDeviceManager;

@interface SearchViewController : UIViewController

@property (nonatomic, weak) JumaDeviceManager *deviceManager;

- (void)receiveRSSI:(NSNumber *)RSSI;

@end
