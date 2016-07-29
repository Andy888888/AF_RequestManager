//
//  DepartmentModel.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "DepartmentModel.h"

@implementation DepartmentModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"identify":@"Identify",
             @"permisstions":@"Permisstions",
             @"accountInfo":@"AccountInfo",
             };
    
}

+(NSValueTransformer *)identifyJSONTransformer
{
    
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[IdentifyModel class]];
}
+(NSValueTransformer *)permisstionsJSONTransformer
{
    
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[PermisstionsModel class]];
}

@end
