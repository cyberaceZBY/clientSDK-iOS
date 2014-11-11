//
//  HttpMethod.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "HttpMethod.h"

@implementation HttpMethod
@synthesize name, hasRequestBody;

-(id)init:(NSString *)n hasRequestBody:(BOOL)has{
    self = [super init];
    if (self){
        name = n;
        hasRequestBody = has;
    }
    return self;
}

+(id)GET{
    return [[HttpMethod alloc]init:@"GET" hasRequestBody:false];
}

+(id)POST{
    return [[HttpMethod alloc]init:@"POST" hasRequestBody:true];
}

+(id)PUT{
    return [[HttpMethod alloc]init:@"PUT" hasRequestBody:true];
}

+(id)DELETE{
    return [[HttpMethod alloc]init:@"DELETE" hasRequestBody:false];
}

+(id)OPTIONS{
    return [[HttpMethod alloc]init:@"OPTIONS" hasRequestBody:false];
}

+ (BOOL) checkNetWork{
    Reachability *reachable = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch (reachable.currentReachabilityStatus) {
        case NotReachable:
            return NO;
        case ReachableViaWiFi:
        case ReachableViaWWAN:
            return YES;
    }
    return NO;
}



@end
