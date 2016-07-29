//
//  IdentifyModel.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "SubBaseModel.h"

@interface IdentifyModel : SubBaseModel

@property (nonatomic, strong)NSString * uId;
@property (nonatomic, strong)NSString * uName;
@property (nonatomic, strong)NSString * departId;
@property (nonatomic, strong)NSString * departName;
@property (nonatomic, strong)NSString * userNo;

@end
