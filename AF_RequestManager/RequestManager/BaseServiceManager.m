//
//  BaseServiceManager.m
//  AF_RequestManager
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseServiceManager.h"


@implementation BaseServiceManager

+ (id)initManager
{
    BaseServiceManager *baseManager = [[BaseServiceManager alloc]init];
    return baseManager;
}


- (void)sendRequest:(AbsApi<BaseApiDelegate>*)api
           sucBlock:(ResponseSuccessBlock)sucBlock
           falBlock:(ResponseFailureBlock)failBlock;
{
    int requestMethod = [api getRequestMethod];
    if(requestMethod == RequestMethodPOST){
        [self postRequest:api sucBlock:sucBlock falBlock:failBlock];
    }else{
        [self getRequest:api sucBlock:sucBlock falBlock:failBlock];
    }
}

- (AFHTTPSessionManager *)createAFHttpManagerForApi:(AbsApi<BaseApiDelegate>*)api
{
    int timeOut = [api getTimeOut];
    
    //创建会话对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置超时时间
    manager.requestSerializer.timeoutInterval = timeOut;
    [self setAcceptableContentTypes:manager];
    //设置请求数据的解析方式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置Header
    [self setHeader:manager withDic:api.getBaseHeader];
    
    return manager;
}




#pragma mark - 私有方法

- (void)postRequest:(AbsApi<BaseApiDelegate>*)api
           sucBlock:(ResponseSuccessBlock)sucBlock
           falBlock:(ResponseFailureBlock)failBlock;
{
    NSString *requestUrl = [api getReqUrl];
    NSDictionary *bodyDic = [api getBaseBody];
    
    AFHTTPSessionManager *manager = [self createAFHttpManagerForApi:api];
    
    [manager POST:requestUrl
       parameters:bodyDic
         progress:^(NSProgress * _Nonnull uploadProgress) {
             NSLog(@"%@",uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"%@",task);
             //请求成功
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:nil];
             if (sucBlock) {
                 sucBlock(dic);
             }
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             //请求失败
             if (failBlock) {
                 failBlock(error);
             }
         }];
}

- (void)getRequest:(AbsApi<BaseApiDelegate>*)api
          sucBlock:(ResponseSuccessBlock)sucBlock
          falBlock:(ResponseFailureBlock)failBlock;
{
    NSString *requestUrl = [api getReqUrl];
    NSDictionary *paramDic = [api getBaseBody];
    
    AFHTTPSessionManager *manager = [self createAFHttpManagerForApi:api];
    
    [manager GET:requestUrl
      parameters:paramDic
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //请求成功
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:NSJSONReadingAllowFragments
                                                                  error:nil];
            if (sucBlock) {
                sucBlock(dic);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //请求失败
            if (failBlock) {
                failBlock(error);
            }
        }];
}


- (void)setAcceptableContentTypes:(AFHTTPSessionManager *)manager
{
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html",@"text/javascript",@"text/plain",@"text/json",@"application/json", nil]];
}

- (void)setHeader:(AFHTTPSessionManager *)manager
          withDic:(NSDictionary *)header;
{
    if(!header){
        return;
    }
    
    NSArray *keys = [header allKeys];
    NSInteger count = [keys count];
    for (int i = 0; i < count; i++) {
        NSString *key = keys[i];
        NSString *value = [header objectForKey:key];
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }
}









@end
