//
//  ViewController.m
//  GeneralSDKDemo
//
//  Created by Bjorn on 14/11/6.
//  Copyright (c) 2014年 SilkCloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginTongbuAction:(id)sender {
    [GeneralSDK login:^(ResultCode loginResult){
        switch (loginResult) {
            case SDK_LOGIN_SUCCESS:
                NSLog(@"Login success");
                break;
            case SDK_LOGIN_CANCEL:
                NSLog(@"Login Canceled");
                break;
            case SDK_LOGIN_FAILED:
                NSLog(@"Login failed");
                break;
            default:
                break;
        }
    }];
}
@end
