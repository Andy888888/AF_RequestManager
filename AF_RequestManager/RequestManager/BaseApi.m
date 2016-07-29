//
//  BaseApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

#pragma mark - AbsApiDelegate 重写

- (NSString *)getRootUrl
{
    return nil;
}


#pragma mark - BaseApiDelegate 必须实现

/*  虽然是必须实现，但是在BaseApi中却是可选实现的  */

/// 请求基础body
/// @warning 默认body为nil
- (NSDictionary *)getBaseBody
{
    return nil;
}
/// 请求方式
/// @warning 默认方式为Post（RequestMethodPOST）
- (int)getRequestMethod
{
    return RequestMethodPOST;
}


#pragma mark - BaseApiDelegate 可选实现

/*  虽然是可选，但是在BaseApi中却是必须实现的  */

/// 请求基础header
/// @warning 默认header为nil
- (NSDictionary *)getBaseHeader
{
    return nil;
}










@end
