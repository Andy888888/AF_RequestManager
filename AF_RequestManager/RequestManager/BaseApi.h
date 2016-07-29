//
//  BaseApi.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "AbsApi.h"
#import "BaseApiDelegate.h"

/// BaseApi 请求基类，遵守了BaseApiDelegate协议，标识凡继承AbsApi的对象都拥有getBaseHeader, getBaseBody和getRequestMethod方法
/// @warning 请不要随便修改
@interface BaseApi : AbsApi<BaseApiDelegate>

@end
