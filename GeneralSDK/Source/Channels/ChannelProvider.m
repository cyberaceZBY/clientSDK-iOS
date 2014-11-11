//
//  ChannelProvider.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "ChannelProvider.h"

@implementation ChannelProvider
//@synthesize isLoggedIn, userId, sessionId, token;

-(id)initChannel:(UIInterfaceOrientation)orient CallBack:(InitCallBack)initCallBack{
    self = [super init];
    if (self){
        mInitCallBack = initCallBack;
    }
    return self;
}

-(void)initChannelFinished{
    [self initFinished];
}

-(void)initFinished{
    mInitCallBack();
}


-(void)loginChannel:(LoginCallBack)loginCallBack{
    mLoginCallBack = loginCallBack;
}

-(void)loginChannelFinished{
    alert = [[UIAlertView alloc] initWithTitle:@"登录" message:@"验证中..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert setBackgroundColor:[UIColor blueColor]];
    [alert setContentMode:UIViewContentModeScaleAspectFit];
    [alert show];
}

-(void)loginFinished:(ResultCode)resultCode{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    mLoginCallBack(resultCode);
}

-(void)orderChannel:(OrderCallBack)orderCallBack{
    mOrderCallBack = orderCallBack;
}

-(void)orderChannelFinished{
}

-(void)orderFinished:(ResultCode)resultCode{
    mOrderCallBack(resultCode);
}

-(void)logoutChannel:(LogoutCallBack)logoutCallBack{
    mLogoutCallBack = logoutCallBack;
}

-(void)logoutChannelFinished{
    
}

-(void)logoutFinished{
    
}


@end
