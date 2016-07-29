//
//  PermUserEntity.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "PermUserEntity.h"

@implementation PermUserEntity

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return [self getBaseFieldWithOthers:@{
                                          @"PermUserInfos":@"PermUserInfos",
                                          }];
}

+(NSValueTransformer *)PermUserInfosJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[DepartmentModel class]];

}

@end
