//
//  RestClient.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "RestClient.h"

@implementation RestClient

-(id)init{
    return [self init:SILKCLOUD_SERVER_URL];
}

-(id)init:(NSString *)url {
    self = [super init];
    if (self){
        baseUrl = url;
        if (![[baseUrl substringFromIndex:(baseUrl.length-1)] isEqualToString:SEPARATOR]) {
            baseUrl = [NSString stringWithFormat:@"%@%@", baseUrl, SEPARATOR];
        }
    }
    return self;
}

-(NSString*)buildUrl:(NSString*)url QueryParams:(NSDictionary*)queryParams {
    while ([[url substringToIndex:0] isEqualToString:SEPARATOR]) {
        url = [url substringFromIndex:1];
    }
    
    NSString *resultUrl = [NSString stringWithFormat:@"%@%@",baseUrl,url];
    NSString *queryString = [self encodeParameters:queryParams];
    if (queryString && queryString.length>0) {
        resultUrl = [NSString stringWithFormat:@"%@%@",resultUrl, queryString];
    }
    return resultUrl;
}

-(NSString*)encodeParameters:(NSDictionary *)params {
    if (params == nil) {
        return nil;
    }
    NSString* result = @"";
    
    for (NSString *key in [params allKeys]){
        if (result.length>0){
            result = [NSString stringWithFormat:@"%@&", result];
        }
        
        result = [NSString stringWithFormat:@"%@%@=%@",result, key, [params objectForKey:key]];
    }
    return result;
}

-(int)checkErrorAndThrow:(RestResponse*)restResponse {
    if (restResponse.statusCode / 100 != 2) {
        return HTTPError_ServerError;
    }
    return 0;
}

-(LoginAttempt *)postLoginAttempt:(LoginAttempt *) loginAttempt{
    RestResponse *httpResponse = [HttpHandler postRequest:[self buildUrl:URL_LOGIN QueryParams:nil] withRequstBody:[JsonMarshaller marshall:[loginAttempt toDictionary]]];
    if (httpResponse.statusCode!=404){
        
        LoginAttempt *result = [[LoginAttempt alloc]initWithDictionary:httpResponse.entity];
        return result;
    }
    return nil;
}

-(OrderAttempt *)postOrderAttempt:(OrderAttempt *) orderAttempt{
    RestResponse *httpResponse = [HttpHandler postRequest:[self buildUrl:URL_ORDER QueryParams:nil] withRequstBody:[JsonMarshaller marshall:orderAttempt]];
    OrderAttempt *result = [[OrderAttempt alloc]initWithDictionary:httpResponse.entity];
    return result;
}

-(BOOL)isHealth{
    NSString *url = [self buildUrl:URL_HEALTH QueryParams:nil];
    RestResponse *httpResponse = [HttpHandler getRequest:url];
    if (httpResponse.statusCode/100==2)
        return YES;
    return NO;
}

-(RestResponse *)getMockWalletBalance:(NSString *) userId{
    NSString *url = [self buildUrl:URL_WALLET QueryParams:nil];
    RestResponse *httpResponse = [HttpHandler getRequest:url];
    return httpResponse;
}

//+(RestResponse *)updateUserBaseInfo:(NSNumber *)userId withUserInfo:(NSDictionary *) userInfo{
//    NSString *url = [NSString stringWithFormat:USER_ADDITIONAL_UPDATE ,userId];
//    RestResponse *httpResponse = [HttpHandler putRequest:url withRequstBody:[RORUtils toJsonFormObject:userInfo]];
//    return httpResponse;
//}

@end
