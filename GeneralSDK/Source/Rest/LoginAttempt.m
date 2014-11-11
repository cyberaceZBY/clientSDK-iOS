//
//  LoginAttempt.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "LoginAttempt.h"

@implementation LoginAttempt
@synthesize sessionId, authenticatorAccessToken, authenticatorId, authenticatorToken, authenticatorUserId, channelAppId, isLogin, userId, loginTime;

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super initWithDictionary:dict];
    if (self){
        sessionId = [ModelUtil getStringFromId:[dict objectForKey:@"sessionId"]];
        authenticatorAccessToken = [ModelUtil getStringFromId:[dict objectForKey:@"authenticatorAccessToken"]];
        authenticatorId = [ModelUtil getNumberFromId:[dict objectForKey:@"authenticatorId"]];
        authenticatorToken = [ModelUtil getStringFromId:[dict objectForKey:@"authenticatorToken"]];
        authenticatorUserId = [ModelUtil getStringFromId:[dict objectForKey:@"authenticatorUserId"]];
        channelAppId = [ModelUtil getStringFromId:[dict objectForKey:@"channelAppId"]];
        userId = [ModelUtil getStringFromId:[dict objectForKey:@"userId"]];
        loginTime = [ModelUtil getDateFromId:[dict objectForKey:@"loginTime"]];
        isLogin = [ModelUtil getNumberFromId:[dict objectForKey:@"isLogin"]];
    }
    return self;
}

-(NSMutableDictionary *)toDictionary{
    NSMutableDictionary *result = [super toDictionary];
    if (sessionId)
        [result setObject:[ModelUtil getStringFromId:sessionId] forKey:@"sessionId"];
    if (authenticatorAccessToken)
        [result setObject:[ModelUtil getStringFromId:authenticatorAccessToken] forKey:@"authenticatorAccessToken"];
    if (authenticatorId)
        [result setObject:[ModelUtil getNumberFromId:authenticatorId] forKey:@"authenticatorId"];
    if (authenticatorToken)
        [result setObject:[ModelUtil getStringFromId:authenticatorToken] forKey:@"authenticatorToken"];
    if (authenticatorUserId)
        [result setObject:[ModelUtil getStringFromId:authenticatorUserId] forKey:@"authenticatorUserId"];
    if (channelAppId)
        [result setObject:[ModelUtil getStringFromId:channelAppId] forKey:@"channelAppId"];
    if (userId)
        [result setObject:[ModelUtil getStringFromId:userId] forKey:@"userId"];
    if (loginTime)
        [result setObject:[ModelUtil getStringFromId:loginTime] forKey:@"loginTime"];
    if (isLogin)
        [result setObject:[ModelUtil getNumberFromId:isLogin] forKey:@"isLogin"];
    return result;
}

@end
