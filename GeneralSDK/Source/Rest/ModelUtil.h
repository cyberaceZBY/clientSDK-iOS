//
//  ModelUtil.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/10.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelUtil : NSObject

+ (BOOL) isEmpty:(id)obj;
+ (NSDate *)getDateFromId:(id)obj;
+ (NSString *)getStringFromId:(id)obj;
+ (NSString *)getStringFromInt:(int)intValue;
+ (NSNumber *)getNumberFromId:(id)obj;

@end
