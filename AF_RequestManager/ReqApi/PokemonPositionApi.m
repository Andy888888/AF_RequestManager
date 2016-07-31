//
//  PokemonPositionApi.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/30.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "PokemonPositionApi.h"

@implementation PokemonPositionApi

- (NSString *)getPath
{
    return @"map/data/34.00/-118.5";
}

- (NSDictionary *)getBody
{
    return @{@"User":_user,@"Pwd":_pwd};
}

- (int)getRequestMethod
{
    return RequestMethodGET;
}


@end
