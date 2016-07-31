//
//  GetUserPermissionApi.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "APlusBaseApi.h"
#import "PermUserEntity.h"

/// 获取用户权限以及身份信息api
@interface GetUserPermissionApi : APlusBaseApi

@property (nonatomic,strong) NSArray *staffNos;

@end
