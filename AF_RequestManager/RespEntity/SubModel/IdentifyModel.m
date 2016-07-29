//
//  IdentifyModel.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "IdentifyModel.h"

@implementation IdentifyModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"uId":@"UId",
             @"uName":@"UName",
             @"departId":@"DepartId",
             @"departName":@"DepartName",
             @"userNo":@"UserNo",
             };
    
}

@end
