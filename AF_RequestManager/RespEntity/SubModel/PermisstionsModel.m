//
//  PermisstionsModel.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "PermisstionsModel.h"

@implementation PermisstionsModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"menuPermisstion":@"MenuPermisstion",
             @"rights":@"Rights",
             @"operatorValPermisstion":@"OperatorValPermisstion",
             @"departmentKeyIds":@"DepartmentKeyIds",
             @"rightUpdateTime":@"RightUpdateTime",
             };
    
}

+(NSValueTransformer *)operatorValPermisstionJSONTransformer
{
    
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[OperatorValPermisstionModel class]];
}

@end
