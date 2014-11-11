//
//  GeneralSDK.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/11.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "GeneralSDK.h"
#import "ChannelProvider.h"
#import "TongBuProvider.h"

@implementation GeneralSDK

static ChannelProvider* channel;
static UIInterfaceOrientation orientation;

+(void)initSDK:(ChannelType)channelType ChannelAppId:(int)appId ScreenOrientation:(UIInterfaceOrientation)orient callback:(InitCallBack)initCallBack{
    orientation = orient;
    [GSDKCommon setChannelAppId:appId];
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    if (window!=nil){
        [window makeKeyAndVisible];
    }
    switch (channelType) {
        case ChannelTypeTongbu:{
            channel = [[TongBuProvider alloc] initChannel:orient CallBack:initCallBack];
            break;
        }
        case ChannelType91:{
        }
        case ChannelTypePP:{
        }
        default:
            break;
    }
}


+(void)login:(LoginCallBack)loginCallBack{
    if (channel){
        [channel loginChannel:loginCallBack];
    }
}


@end