//
//  BaseViewController.h
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestManager.h"
#import "DataConvert.h"

@interface BaseViewController : UIViewController<ResponseDelegate>
{
    RequestManager *_manager;
}

- (void)alert:(NSString *)msg;

@end
