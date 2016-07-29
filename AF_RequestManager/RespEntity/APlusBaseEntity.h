//
//  APlusBaseEntity.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//


#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@interface APlusBaseEntity : MTLModel<MTLJSONSerializing>

@property (nonatomic,assign) BOOL flag;
@property (nonatomic,strong) NSString *errorMsg;
@property (nonatomic,strong) NSString *runTime;

+ (NSMutableDictionary *)getBaseFieldMapping;
+ (NSMutableDictionary *)getBaseFieldWithOthers:(NSDictionary *)dic;

@end
