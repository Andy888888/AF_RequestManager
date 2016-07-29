//
//  GetUserPermissionApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "GetUserPermissionApi.h"
#import "BaseApiDelegate.h"

@implementation GetUserPermissionApi

- (NSDictionary *)getBaseBody
{
    return [self getBaseFieldWithOthers:@{@"UserNumbers":_staffNos}];
}

-(NSString *)getPath
{
    return @"WebApiPermisstion/get_user_permisstion";
}

- (Class)getRespClass
{
    return [PermUserEntity class];
}


@end
