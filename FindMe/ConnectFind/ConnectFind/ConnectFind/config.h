//
//  config.h
//  JumaFinder
//
//  Created by Wang AnJun on 15/4/18.
//  Copyright (c) 2015年 Jumacc. All rights reserved.
//

#ifndef ____config_h
#define ____config_h

#ifdef __OBJC__

    #if DEBUG
    #define JMLog(...) NSLog(__VA_ARGS__)
    #else
    #define JMLog(...)
    #endif
#endif

#endif
