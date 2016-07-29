//
//  AbsApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "AbsApi.h"

@implementation AbsApi

/// 完整的请求url
- (NSString *)getReqUrl
{
    NSString *reqUrl = [NSString stringWithFormat:@"%@%@",[self getRootUrl],[self getPath]];
    return reqUrl;
}

/// 设置超时时间，默认10秒
- (int)getTimeOut
{
    return 10;
}

/// @warning rootUrl默认为nil
- (NSString *)getRootUrl
{
    return nil;
}

/// @warning path默认为nil
- (NSString *)getPath
{
    return nil;
}

- (Class)getRespClass
{
    return nil;
}



@end
