//
//  PokemonBaseApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/30.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "PokemonBaseApi.h"

@implementation PokemonBaseApi

- (NSString *)getRootUrl
{
    return @"https://pokevision.com/";
}


- (int)getTimeOut
{
    return 30;
}

- (int)getRequestMethod
{
    return RequestMethodGET;
}

@end
