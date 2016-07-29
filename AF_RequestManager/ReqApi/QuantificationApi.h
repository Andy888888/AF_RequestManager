//
//  SecondApi.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "APlusBaseApi.h"

// 我的量化api
@interface QuantificationApi : APlusBaseApi

@property (nonatomic,strong) NSString *departKeyid;
@property (nonatomic,strong) NSString *endDate;
@property (nonatomic,strong) NSString *startDate;
@property (nonatomic,strong) NSString *userKeyId;

@end
