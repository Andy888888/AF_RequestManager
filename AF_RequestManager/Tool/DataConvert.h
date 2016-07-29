//
//  DataConvert.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataConvert : NSObject

+ (id)convertDic:(NSDictionary *)dic
        toEntity:(Class)cls;

@end
