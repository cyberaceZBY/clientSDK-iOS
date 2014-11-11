//
//  GSDKCommon.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/6.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef GeneralSDKDemo_GSDKCommon_h
#define GeneralSDKDemo_GSDKCommon_h

#define CHANNEL_APPID_TONGBU 100000

#define URL_LOGIN @"login-attempts"
#define URL_ORDER @"order-attempts"
#define URL_HEALTH @"currencies/USD"
#define URL_WALLET @"octopus-mock/wallets/"

#define SILKCLOUD_SERVER_URL @"http://54.223.141.151:8080/v1"
#define SILKCLOUD_CHANNEL_APPID @"\036159488"
//
//typedef enum {
//    CHANNEL_TONGBU,
//    CHANNEL_91,
//    CHANNEL_PP
//} ChannelProviderEnum;

typedef enum {
    SDK_INIT_SUCCESS,
    SDK_INIT_ERROR,
    SDK_INIT_SERVER_INVALID,
    
    SDK_LOGIN_SUCCESS,
    SDK_LOGIN_CANCEL,
    SDK_LOGIN_FAILED,
    SDK_LOGIN_SERVER_INVALID,
    
    SDK_PURCHASE_SUCCESS,
    SDK_PURCHASE_PROCESSING,
    SDK_PURCHASE_FAILED,
    SDK_PURCHASE_CANCEL,
    SDK_PURCHASE_SERVER_INVALID,
    
    SDK_EXIT_SUCCESS,
    SDK_EXIT_CANCEL,
    SDK_EXIT_ERROR,
} ResultCode;

typedef enum {
    ChannelTypeTongbu = 1000,
    ChannelType91 = 1001,
    ChannelTypePP = 1002,
} ChannelType;


typedef void (^InitCallBack)();
typedef void (^LoginCallBack)(ResultCode resultCode);
typedef void (^OrderCallBack)(ResultCode resultCode);
typedef void (^LogoutCallBack)(ResultCode resultCode);

@interface GSDKCommon : NSObject

+(void)setChannelAppId:(int)appId;

+(int)getChannelAppId;

@end

#endif
