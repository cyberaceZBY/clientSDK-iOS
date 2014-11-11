//
//  ChannelProvider.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "GSDKCommon.h"
#import "LoginAttempt.h"
#import "OrderAttempt.h"
#import "RestClient.h"

@interface ChannelProvider : NSObject{
    InitCallBack mInitCallBack;
    LoginCallBack mLoginCallBack;
    OrderCallBack mOrderCallBack;
    LogoutCallBack mLogoutCallBack;
    
    BOOL isLoggedIn;
    NSString *userId;
    NSString *sessionId;
    NSString *token;
    
    UIAlertView *alert;
}

//@property (nonatomic) BOOL isLoggedIn;
//@property (strong, nonatomic) NSString *userId;
//@property (strong, nonatomic) NSString *sessionId;
//@property (strong, nonatomic) NSString *token;

-(id)initChannel:(UIInterfaceOrientation)orient CallBack:(InitCallBack)initCallBack;
-(void)initChannelFinished;
-(void)initFinished;

-(void)loginChannel:(LoginCallBack)loginCallBack;
-(void)loginChannelFinished;
-(void)loginFinished:(ResultCode)resultCode;

-(void)logoutChannel:(LogoutCallBack)logoutCallBack;
-(void)logoutChannelFinished;
-(void)logoutFinished;

-(void)orderChannel:(OrderCallBack)orderCallBack;
-(void)orderChannelFinished;
-(void)orderFinished:(ResultCode)resultCode;

@end
