//
//  DataConvert.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "DataConvert.h"
#import "MTLJSONAdapter.h"

@implementation DataConvert

+ (id)convertDic:(NSDictionary *)dic
        toEntity:(Class)cls
{
    return [MTLJSONAdapter modelOfClass:cls
                     fromJSONDictionary:dic
                                  error:nil];
}

@end
