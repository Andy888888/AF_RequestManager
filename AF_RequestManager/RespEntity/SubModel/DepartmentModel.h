//
//  DepartmentModel.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "SubBaseModel.h"
#import "IdentifyModel.h"
#import "PermisstionsModel.h"

@interface DepartmentModel : SubBaseModel

@property (nonatomic,strong) IdentifyModel *identify;
@property (nonatomic,strong) PermisstionsModel *permisstions;
@property (nonatomic,strong)NSString * accountInfo;

@end
