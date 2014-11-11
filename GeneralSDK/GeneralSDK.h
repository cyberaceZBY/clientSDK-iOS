//
//  GeneralSDK.h
//  GeneralSDK
//
//  Created by Bjorn on 14/11/6.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "GSDKCommon.h"

//! Project version number for GeneralSDK.
FOUNDATION_EXPORT double GeneralSDKVersionNumber;

//! Project version string for GeneralSDK.
FOUNDATION_EXPORT const unsigned char GeneralSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <GeneralSDK/PublicHeader.h>


@interface GeneralSDK : NSObject{
}

+(void)initSDK:(ChannelType)channelType ChannelAppId:(int)appId ScreenOrientation:(UIInterfaceOrientation)orient callback:(InitCallBack)initCallBack;

+(void)login:(LoginCallBack)loginCallBack;


@end