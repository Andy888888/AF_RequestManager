//
//  AbsApi.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseApiDelegate.h"

/// RequestMethod 请求方式枚举
/// @warning 请不要随便修改
enum RequestMethod
{
    /// Post请求方式
    RequestMethodPOST = 1,
    /// Get请求方式
    RequestMethodGET = 2
};

/// AbsApi 请求最基类，遵守了AbsApiDelegate协议，标识凡继承AbsApi的对象都拥有getRootUrl和getPath方法
/// @warning 请不要随便修改
@interface AbsApi : NSObject<AbsApiDelegate>

/// 完整的请求url
- (NSString *)getReqUrl;
/// 设置超时时间
- (int)getTimeOut;

@end
