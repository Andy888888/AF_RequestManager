//
//  GetUserPermissionApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "GetUserPermissionApi.h"

@implementation GetUserPermissionApi

-(NSString *)getPath
{
    return @"WebApiPermisstion/get_user_permisstion";
}

- (NSDictionary *)getHeader
{
    return nil;
}

- (NSDictionary *)getBody
{
    return @{@"UserNumbers":_staffNos};
}

- (Class)getRespClass
{
    return [PermUserEntity class];
}




@end
