//
//  HttpMethod.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestResponse.h"
#import "Reachability.h"

@interface HttpMethod : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) BOOL hasRequestBody;

-(id)init:(NSString *)n hasRequestBody:(BOOL)has;

+(id)GET;
+(id)POST;
+(id)PUT;
+(id)DELETE;
+(id)OPTIONS;

+ (BOOL) checkNetWork;

@end
