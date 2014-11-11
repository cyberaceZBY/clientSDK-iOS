//
//  OrderAttempt.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "OrderAttempt.h"

@implementation OrderAttempt
@synthesize Id, userId, channelAppId, sessionId, productId, quantity, amount, appOrderId;

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super initWithDictionary:dict];
    if (self){
        Id = [ModelUtil getStringFromId:[dict objectForKey:@"Id"]];
        userId = [ModelUtil getStringFromId:[dict objectForKey:@"userId"]];
        channelAppId = [ModelUtil getStringFromId:[dict objectForKey:@"channelAppId"]];
        sessionId = [ModelUtil getStringFromId:[dict objectForKey:@"sessionId"]];
        productId = [ModelUtil getStringFromId:[dict objectForKey:@"productId"]];
        quantity = [ModelUtil getNumberFromId:[dict objectForKey:@"quantity"]];
        amount = [ModelUtil getNumberFromId:[dict objectForKey:@"amount"]];
        appOrderId = [ModelUtil getStringFromId:[dict objectForKey:@"appOrderId"]];
    }
    return self;
}

-(NSMutableDictionary *)toDictionary{
    NSMutableDictionary *result = [super toDictionary];
    [result setObject:[ModelUtil getStringFromId:Id] forKey:@"Id"];
    [result setObject:[ModelUtil getStringFromId:userId] forKey:@"userId"];
    [result setObject:[ModelUtil getStringFromId:channelAppId] forKey:@"channelAppId"];
    [result setObject:[ModelUtil getStringFromId:sessionId] forKey:@"sessionId"];
    [result setObject:[ModelUtil getStringFromId:productId] forKey:@"productId"];
    [result setObject:[ModelUtil getNumberFromId:quantity] forKey:@"quantity"];
    [result setObject:[ModelUtil getNumberFromId:amount] forKey:@"amount"];
    [result setObject:[ModelUtil getStringFromId:appOrderId] forKey:@"appOrderId"];
    return result;
}

@end
