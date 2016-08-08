//
//  BaseViewController.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [RequestManager initManagerWithDelegate:self];
}

- (void)alert:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:msg
                                                 delegate:nil
                                        cancelButtonTitle:@"取消"
                                        otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)dealloc
{
    _manager.delegate = nil;
    _manager = nil;
    NSLog(@"%@页面销毁, manager = %@",self,_manager);
}

- (void)respSuc:(id)data andRespApi:(id)respApi
{
}
- (void)respFail:(NSError *)error andRespApi:(id)respApi
{
}

@end
