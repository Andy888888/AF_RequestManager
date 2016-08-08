//
//  SecondViewController.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "SecondViewController.h"
#import "DataConvert.h"
#import "RequestManager.h"
#import "QuantificationApi.h"


@interface SecondViewController ()
{
    QuantificationApi *_quantificationApi;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 230, 180, 40);
    [btn setTitle:@"请求量化数据" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 300, 180, 40);
    [btn2 setTitle:@"返回" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}


#pragma mark - 事件

- (void)btnClick:(UIButton *)btn{
    _quantificationApi = [[QuantificationApi alloc] init];
    
    _quantificationApi.departKeyid = @"15020410-3847-1d0a-ec93-f8b2565b90c9";
    _quantificationApi.endDate = @"2016-07-27";
    _quantificationApi.startDate = @"2016-07-27";
    _quantificationApi.userKeyId = @"bf87f61a-dd9a-c226-fed5-08d3aaeb1b59";
    
    [_manager sendRequest:_quantificationApi];
}

- (void)btnClick2:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - 数据返回 ResponseDelegate

- (void)respSuc:(id)data andRespApi:(id)respApi
{
    NSLog(@"第二个界面返回数据：%@",data);
    [self alert:@"请求数据响应成功！"];
}

- (void)respFail:(NSError *)error andRespApi:(id)respApi
{
    NSLog(@"%@",error);
}



@end
