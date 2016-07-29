//
//  BaseApiDelegate.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <UIKit/UIKit.h>

/// BaseApiDelegate BaseApi需要遵守的协议，用来规范请求参数以及设置
/// @warning 请不要随便修改
@protocol BaseApiDelegate <NSObject>

/// 必须实现
@required
/// 请求基础body
/// @warning 默认为nil，遵守实现者必须实现
- (NSDictionary *)getBaseBody;
/// 请求方式
/// @warning 默认为Post（RequestMethodPOST）
- (int)getRequestMethod;

//可选实现
@optional
/// 请求基础header
/// @warning 默认为nil
- (NSDictionary *)getBaseHeader;

@end

/// AbsApiDelegate AbsApi需要遵守的协议，为规范AbsApi对象拥有getRootUrl和getPath方法
/// @warning 请不要随便修改
@protocol AbsApiDelegate <NSObject>

/// 必须实现
@required
/// 请求rootUrl
/// @warning 默认为nil，遵守实现者必须实现
- (NSString *)getRootUrl;
/// 请求url后半部分
/// @warning 默认为nil，遵守实现者必须实现
- (NSString *)getPath;

/// 请求返回数据实体Class
/// @warning 默认为nil，用来区分返回来的数据类型，以及指定序列化dic为实体对象的class类型
- (Class)getRespClass;











@end
