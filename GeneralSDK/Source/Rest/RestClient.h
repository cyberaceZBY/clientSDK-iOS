//
//  RestClient.h
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginAttempt.h"
#import "OrderAttempt.h"
#import "HttpHandler.h"
#import "GSDKCommon.h"

#define SEPARATOR @"/"
#define CONTENT_TYPE_HEADER @"Content-Type"

typedef enum {
    HTTPError_ServerError = -1
} HTTPErrorEnum;

@interface RestClient : NSObject{
    NSString *baseUrl;
}

-(id)init;
-(id)init:(NSString *)url;

-(LoginAttempt *)postLoginAttempt:(LoginAttempt *) loginAttempt;
-(OrderAttempt *)postOrderAttempt:(OrderAttempt *) orderAttempt;
-(BOOL)isHealth;
-(RestResponse *)getMockWalletBalance:(NSString *) userId;


@end
