//
//  APlusBaseApi.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseApi.h"
/// APlusBaseApi 业务层，非框架层；统一规范了A+接口的 TimeOut, RootUrl, Header
/// @warning getPath，getRespClass（协议回调类型请求）和getBaseBody需在A+每个接口中实现，且必须实现；如需个别设置Get请求，请重写getRequestMethod方法
@interface APlusBaseApi : BaseApi


@end
