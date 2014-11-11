//
//  TongBu.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/6.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "TongBuProvider.h"

@implementation TongBuProvider

#pragma mark Override

-(id)initChannel:(UIInterfaceOrientation)orient CallBack:(InitCallBack)initCallBack{
    self = [super initChannel:orient CallBack:initCallBack];
    if (self) {
        [[TBPlatform defaultPlatform]
         TBInitPlatformWithAppID:CHANNEL_APPID_TONGBU
         screenOrientation:orient
         isContinueWhenCheckUpdateFailed:YES];
        
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(initChannelFinished)
         name:kTBInitDidFinishNotification
         object:Nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(leavedSDKPlatform:)
                                                     name:kTBLeavePlatformNotification
                                                   object:nil];
    }
    return self;
}

- (void)leavedSDKPlatform:(NSNotification *)notification{
    NSDictionary *notifyUserInfo = notification.userInfo;
    TBPlatformLeavedType leavedFromType =
    (TBPlatformLeavedType)[[notifyUserInfo objectForKey:
                            TBLeavedPlatformTypeKey] intValue];
    switch (leavedFromType) {
            //从登录⻚页离开
        case TBPlatformLeavedFromLogin:{
            mLoginCallBack(SDK_LOGIN_CANCEL);
            break;
        }
            //从个⼈人中⼼心离开
        case TBPlatformLeavedFromUserCenter:{ }
            break;
            //从充值⻚页⾯面离开
        case TBPlatformLeavedFromUserPay:{
            NSString *orderString = [notifyUserInfo
                                     objectForKey:TBLeavedPlatformOrderKey];
            [[TBPlatform defaultPlatform]
             TBCheckPaySuccess:orderString
             delegate:self];
        
        }
            break;
        default:
            break;
    }
}

-(void)loginChannel:(LoginCallBack)loginCallBack{
    [super loginChannel:loginCallBack];
    [[TBPlatform defaultPlatform] TBLogin:0];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginChannelFinished)
                                                 name:kTBLoginNotification
                                               object:nil];
}

-(void)loginChannelFinished{
    [super loginChannelFinished];
    
    if ([[TBPlatform defaultPlatform] TBIsLogined]){
        isLoggedIn = YES;
       
        TBPlatformUserInfo *userInfo =
        [[TBPlatform defaultPlatform] TBGetMyInfo];
        userId = [userInfo userID];
        sessionId = [userInfo sessionID];
        
        LoginAttempt *loginAttempt = [[LoginAttempt alloc]init];
        loginAttempt.authenticatorId = [NSNumber numberWithInt:ChannelTypeTongbu];
        loginAttempt.authenticatorToken = sessionId;
        loginAttempt.authenticatorUserId = userId;
        loginAttempt.channelAppId = [NSString stringWithFormat:@"%d", [GSDKCommon getChannelAppId]];
        
        RestClient *restClient = [[RestClient alloc]init];
        loginAttempt = [restClient postLoginAttempt:loginAttempt];
        if ([loginAttempt isLogin].boolValue){
            [self loginFinished:SDK_LOGIN_SUCCESS];
        } else {
//            [self logoutChannel:^(ResultCode result){
//            }];
            [self loginFinished:SDK_LOGIN_FAILED];
        }
        
    } else {
        isLoggedIn = NO;
    }
//    [self loginFinished];
}


-(void)logoutChannel:(LogoutCallBack)logoutCallBack{
    [super logoutChannel:logoutCallBack];
}

@end
