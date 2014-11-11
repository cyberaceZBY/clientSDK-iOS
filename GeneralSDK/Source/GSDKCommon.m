//
//  GSDKCommon.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/10.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSDKCommon.h"

@implementation GSDKCommon

static int ChannelAppId;

NSString * const getChannelName[] = {
    @"TONGBU",
    @"91",
    @"PP",
};

+(void)setChannelAppId:(int)appId{
    ChannelAppId = appId;
}

+(int)getChannelAppId{
    return ChannelAppId;
}

@end
