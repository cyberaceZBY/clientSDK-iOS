//
//  JsonMarshaller.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonMarshaller : NSObject

+ (NSString *)marshall:(NSObject *)object;
+ (id)unmarshall:(NSData*)data;

@end
