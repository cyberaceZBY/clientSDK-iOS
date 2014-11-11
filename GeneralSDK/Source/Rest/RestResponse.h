//
//  RestResponse.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestResponse : NSObject

@property (strong, nonatomic) id entity;
@property (nonatomic) int statusCode;
@property (strong, nonatomic) NSMutableDictionary *headers;

-(id)init;
-(void)putHeader:(NSString *)name withValue:(NSString *)value;

@end
