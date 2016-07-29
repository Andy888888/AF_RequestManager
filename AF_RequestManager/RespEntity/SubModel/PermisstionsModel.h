//
//  PermisstionsModel.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "SubBaseModel.h"
#import "OperatorValPermisstionModel.h"

@interface PermisstionsModel : SubBaseModel

@property (nonatomic, strong)NSString * menuPermisstion;
@property (nonatomic, strong)NSString * rights;
@property (nonatomic, strong)OperatorValPermisstionModel * operatorValPermisstion;
@property (nonatomic, strong)NSString * departmentKeyIds;
@property (nonatomic, strong)NSString * rightUpdateTime;

@end
