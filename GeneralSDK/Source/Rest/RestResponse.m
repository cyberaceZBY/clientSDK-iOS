//
//  RestResponse.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "RestResponse.h"

@implementation RestResponse
@synthesize entity, statusCode, headers;

-(id)init{
    self = [super init];
    if (self) {
        headers = [[NSMutableDictionary alloc]init];
    }
    return self;
}

-(void)putHeader:(NSString *)name withValue:(NSString *)value{
    NSMutableArray *hs = [headers objectForKey:name];
    if (!hs)
        hs = [[NSMutableArray alloc]init];
    [hs addObject:value];
    [headers setObject:hs forKey:name];
}

@end
