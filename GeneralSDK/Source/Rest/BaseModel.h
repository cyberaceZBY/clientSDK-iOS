//
//  BaseModel.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelUtil.h"

@interface BaseModel : NSObject

@property (strong, nonatomic) NSMutableDictionary* others;

-(id)initWithDictionary:(NSDictionary *)dict;

-(void)addOthers:(NSString *)name Object:(id)value;

-(NSMutableDictionary *)toDictionary;

@end
