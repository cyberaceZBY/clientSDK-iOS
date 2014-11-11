//
//  JsonMarshaller.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "JsonMarshaller.h"

@implementation JsonMarshaller


+ (NSString *)marshall:(NSObject *)object{
    NSError *writeError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&writeError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",jsonString);
    return jsonString;
}

+ (id)unmarshall:(NSData*)data {
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
}

//RORHttpResponse *httpResponse =[RORMissionClientHandler getMissions:lastUpdateTime];
//
//if ([httpResponse responseStatus]  == 200){
//    NSArray *missionList = [NSJSONSerialization JSONObjectWithData:[httpResponse responseData] options:NSJSONReadingMutableLeaves error:&error];

@end
