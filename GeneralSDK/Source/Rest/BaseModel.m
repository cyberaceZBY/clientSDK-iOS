//
//  BaseModel.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
@synthesize others;

-(void)addOthers:(NSString *)name Object:(id)value{
    [others setObject:value forKey:name];
}

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        others = [dict objectForKey:@"other"];
    }
    return self;
}

-(NSMutableDictionary *)toDictionary{
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init];
    if (others)
        [result setObject:others forKey:@"others"];
    return  result;
}

@end
