//
//  ModelUtil.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/10.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "ModelUtil.h"

@implementation ModelUtil


+ (BOOL) isEmpty:(id)obj {
    if (obj == nil || [obj isKindOfClass:[NSNull class]])
        return YES;
    return NO;
}

+ (NSDate *)getDateFromId:(id)obj{
    if ([self isEmpty:obj])
        return nil;
    if ([obj isKindOfClass:[NSString class]]){
        NSString *str = (NSString *)obj;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *date = [formatter dateFromString:str];
        return date;
    } else if([obj isKindOfClass:[NSDate class]]){
        return (NSDate *)obj;
    }
    return nil;
}

+ (NSString *)getStringFromId:(id)obj{
    if ([self isEmpty:obj])
        return nil;
    if ([obj isKindOfClass:[NSString class]])
        return (NSString *)obj;
    if ([obj isKindOfClass:[NSDate class]]){
        NSDateFormatter *formate = [[NSDateFormatter alloc] init];
        [formate setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        return [formate stringFromDate:obj];
    }
    return [NSString stringWithFormat:@"%@", obj];
}

+ (NSString *)getStringFromInt:(int)intValue{
    return [NSString stringWithFormat:@"%d", intValue];
}

+ (NSNumber *)getNumberFromId:(id)obj{
    if ([self isEmpty:obj])
        return nil;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    if ([obj isKindOfClass:[NSString class]]){
        NSString *str = (NSString *) obj;
        NSNumber *result = [f numberFromString:str];
        if(!(result))
            return nil;
        return result;
    } else if ([obj isKindOfClass:[NSNumber class]]){
        return (NSNumber *)obj;
    }
    return nil;
}

@end
