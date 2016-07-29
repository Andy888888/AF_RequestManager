//
//  SecondApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "QuantificationApi.h"
#import "BaseApiDelegate.h"

@implementation QuantificationApi

//请求体参数
- (NSDictionary *)getBaseBody
{
    return [self getBaseFieldWithOthers:@{
                                   @"DepartmentKeyId":_departKeyid,
                                   @"EndDate":_endDate,
                                   @"StartDate":_startDate,
                                   @"UserKeyId":_userKeyId
                                   }];
}

-(NSString *)getPath
{
    return @"WebApiCenter/get_from_opm_quantification";
}

@end
