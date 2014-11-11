//
//  HttpHandler.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/7.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "HttpHandler.h"

@implementation HttpHandler

+(RestResponse *) postRequest:(NSString *)url withRequstBody:(NSString *)reqBody {
    NSLog(@"post request: %@ \r\n %@",url,reqBody);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    //set http Method
    [request setHTTPMethod:@"POST"];
    //set http headers
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding" ];
    [request setTimeoutInterval:10];
    //    NSString *key = [NSString stringWithFormat:@"%@#%@",[RORUserUtils getUserUuid],[RORUserUtils getUserId]];
    //    [request addValue:key forHTTPHeaderField:@"X-CLIENT-KEY"];
    
    //set http request data
    NSData *regData = [reqBody dataUsingEncoding: NSUTF8StringEncoding];
    //    NSData *gzipRegData = [RORUtils gzipCompressData:regData];
    [request setHTTPBody:regData];
    
    RestResponse *httpResponse = [self excuteRequest:request];
    return httpResponse;
}

+(RestResponse *) putRequest:(NSString *)url withRequstBody:(NSString *)reqBody {
    NSLog(@"put request: %@ \r\n %@",url,reqBody);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    //set http Method
    [request setHTTPMethod:@"PUT"];
    //set http headers
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding" ];
    [request setTimeoutInterval:10];
    //    NSString *key = [NSString stringWithFormat:@"%@#%@",[RORUserUtils getUserUuid],[RORUserUtils getUserId]];
    //    [request addValue:key forHTTPHeaderField:@"X-CLIENT-KEY"];
    
    //set http request data
    NSData *regData = [reqBody dataUsingEncoding: NSUTF8StringEncoding];
    //    NSData *gzipRegData = [RORUtils gzipCompressData:regData];
    [request setHTTPBody:regData];
    
    RestResponse *httpResponse = [self excuteRequest:request];
    return httpResponse;
}

+(RestResponse *) getRequest: (NSString *)url{
    NSLog(@"get request: %@",url);
    //[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    //set http Method
    [request setHTTPMethod:@"GET"];
    //set http headers
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:10];
    //    NSString *key = [NSString stringWithFormat:@"%@#%@",[RORUserUtils getUserUuid],[RORUserUtils getUserId]];
    //    [request addValue:key forHTTPHeaderField:@"X-CLIENT-KEY"];
    
    RestResponse *httpResponse = [self excuteRequest:request];
    return httpResponse;
}

+(RestResponse *) getRequest: (NSString *)url withHeaders:(NSMutableDictionary *) headers{
    NSLog(@"get request: %@",url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    //set http Method
    [request setHTTPMethod:@"GET"];
    //set http headers
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    for (NSObject *header in [headers objectEnumerator]) {
        NSString *headerField = [NSString stringWithFormat:@"%@", header];
        [request addValue:[headers objectForKey:headerField] forHTTPHeaderField:headerField];
    }
    [request setTimeoutInterval:10];
    //    NSString *key = [NSString stringWithFormat:@"%@#%@",[RORUserUtils getUserUuid],[RORUserUtils getUserId]];
    //    [request addValue:key forHTTPHeaderField:@"X-CLIENT-KEY"];
    
    RestResponse *httpResponse = [self excuteRequest:request];
    return httpResponse;
}


+ (RestResponse *) excuteRequest: (NSMutableURLRequest *)request{
    NSError *error = nil;
    NSHTTPURLResponse *urlResponse = nil;
    RestResponse *httpResponse = [[RestResponse alloc] init];
    if([HttpMethod checkNetWork]){
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:nil];
        
        if (response == nil) {
            [httpResponse setStatusCode:404];
            [httpResponse setEntity:nil];
            [httpResponse setHeaders:nil];
            NSLog(@"Network connection's not available. Please check the system configuration");
            return httpResponse;
        }
        
        NSInteger statCode = [urlResponse statusCode];
        [httpResponse setStatusCode:statCode];
        [httpResponse setEntity:[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error]];
        NSDictionary *headerDict = [urlResponse allHeaderFields];
        for (NSString *key in [headerDict allKeys]){
            [httpResponse putHeader:key withValue:[headerDict objectForKey:key]];
        }
        
        NSLog(@"Response from request: %@",[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error]);
    }else{
        [httpResponse setEntity:nil];
        [httpResponse setStatusCode:999];
    }
    
    return httpResponse;
}

@end
