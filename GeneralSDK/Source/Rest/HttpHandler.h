//
//  HttpHandler.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestResponse.h"
#import "HttpMethod.h"
#import "JsonMarshaller.h"

@interface HttpHandler : NSObject

+(RestResponse *) postRequest:(NSString *)url withRequstBody:(NSString *)reqBody;
+(RestResponse *) putRequest:(NSString *)url withRequstBody:(NSString *)reqBody;
+(RestResponse *) getRequest: (NSString *)url;
+ (RestResponse *) excuteRequest: (NSMutableURLRequest *)request;

@end
