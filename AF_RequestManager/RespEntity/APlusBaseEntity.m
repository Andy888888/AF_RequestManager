//
//  APlusBaseEntity.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "APlusBaseEntity.h"

@implementation APlusBaseEntity

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *dic = [self getBaseFieldWithOthers:nil];
    return dic;
}

+ (NSMutableDictionary *)getBaseFieldMapping
{
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 @"flag":@"Flag",
                                                                                 @"errorMsg":@"ErrorMsg",
                                                                                 @"runTime":@"RunTime",
                                                                                 }];
    return mdic;
}

+ (NSMutableDictionary *)getBaseFieldWithOthers:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [self getBaseFieldMapping];
    [mdic addEntriesFromDictionary:dic];
    return mdic;
}

@end
