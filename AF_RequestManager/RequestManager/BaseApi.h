//
//  BaseApi.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "ApiDelegate.h"
#import "AbsApi.h"

/// BaseApi 请求基类，继承自AbsApi，且遵守了ApiDelegate协议
/// @warning 请不要随便修改
@interface BaseApi : AbsApi<ApiDelegate>

@end
