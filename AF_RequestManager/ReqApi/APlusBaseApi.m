//
//  APlusBaseApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "APlusBaseApi.h"

@implementation APlusBaseApi

- (NSString *)getRootUrl
{
    return @"http://10.5.10.42:9016/api/";
}

//- (NSMutableDictionary *)getBaseHeader
//{
//    // 项目中根据实际情况来设置
//    return nil;
//}

- (NSMutableDictionary *)getBaseBody
{
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 @"IsMobileRequest":@"YES"
                                                                                 }];
    return mdic;
}

- (int)getTimeOut
{
    return 10;
}

- (int)getRequestMethod
{
    return RequestMethodPOST;
}

@end
