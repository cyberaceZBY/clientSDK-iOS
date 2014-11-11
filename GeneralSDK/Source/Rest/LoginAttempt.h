//
//  LoginAttempt.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "BaseModel.h"

@interface LoginAttempt : BaseModel

@property (strong, nonatomic) NSString *sessionId;
@property (strong, nonatomic) NSString *authenticatorToken;
@property (nonatomic) NSNumber *authenticatorId;
@property (strong, nonatomic) NSString *authenticatorUserId;
@property (strong, nonatomic) NSString *authenticatorAccessToken;
@property (strong, nonatomic) NSString *channelAppId;
@property (nonatomic) NSNumber *isLogin;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSDate *loginTime;

@end
