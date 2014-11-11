//
//  OrderAttempt.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "BaseModel.h"

@interface OrderAttempt : BaseModel

@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *channelAppId;
@property (strong, nonatomic) NSString *sessionId;
@property (strong, nonatomic) NSString *productId;
@property (strong, nonatomic) NSNumber *quantity;
@property (strong, nonatomic) NSNumber *amount;
@property (strong, nonatomic) NSString *appOrderId;

@end
