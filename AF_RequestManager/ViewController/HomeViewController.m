//
//  ViewController.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/29.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "HomeViewController.h"
#import "GetUserPermissionApi.h"
#import "SecondViewController.h"

@interface HomeViewController ()
{
    GetUserPermissionApi *_permApi;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 事件
- (IBAction)requestBtn_click:(id)sender {
    [self sendUseProtocal];
}
- (IBAction)turnPageBtn_click:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{}];
}

#pragma mark - 私有方法
// 使用Block请求
- (void)sendUseBlock
{
    _permApi = [[GetUserPermissionApi alloc]init];
    _permApi.staffNos = @[@"Ceshi666"];
    [_manager sendRequest:_permApi sucBlock:^(id result) {
        
        PermUserEntity *perUser = [DataConvert convertDic:result toEntity:[PermUserEntity class]];
        DepartmentModel *depart = perUser.PermUserInfos[0];
        [self alert:depart.identify.uName];
        
    } failBlock:^(NSError *error) {
        
    }];
}

// 使用Protocal发送请求
- (void)sendUseProtocal
{
    _permApi = [[GetUserPermissionApi alloc]init];
    _permApi.staffNos = @[@"Ceshi666"];
    [_manager sendRequest:_permApi];
}

#pragma mark - 网络请求结果 ResponseDelegate
//在项目中保证该回调放在文件最底部

- (void)respSuc:(id)data andRespClass:(id)cls
{
    if([cls isEqual:[PermUserEntity class]])
    {
        NSLog(@"第一个界面返回数据：%@",data);
        PermUserEntity *perUser = [DataConvert convertDic:data toEntity:cls];
        DepartmentModel *depart = perUser.PermUserInfos[0];
        [self alert:depart.identify.uName];
    }
}

- (void)respFail:(NSError *)error
{
}


@end
