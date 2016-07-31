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


- (void)sendRequest:(AbsApi<ApiDelegate>*)api
           sucBlock:(ResponseSuccessBlock)sucBlock
           failBlock:(ResponseFailureBlock)failBlock;
{
    int requestMethod = [api getRequestMethod];
    if(requestMethod == RequestMethodPOST){
        [self postRequest:api sucBlock:sucBlock failBlock:failBlock];
    }else{
        [self getRequest:api sucBlock:sucBlock failBlock:failBlock];
    }
}

- (AFHTTPSessionManager *)createAFHttpManagerForApi:(AbsApi<ApiDelegate>*)api
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
    [self setHeader:manager withDic:[api getReqHeader]];
    
    return manager;
}

- (NSString *)getReqGetUrl:(AbsApi<ApiDelegate>*)api
{
    NSString *reqUrl = [api getReqUrl];
    NSDictionary *paramDic = [api getBody];
    
    NSArray *keys = [paramDic allKeys];
    NSInteger count = keys.count;
    if(count > 0)
    {
        reqUrl = [NSString stringWithFormat:@"%@?",reqUrl];
        for (NSInteger i = 0; i < count; i++)
        {
            if(i != 0)
            {
                reqUrl = [NSString stringWithFormat:@"%@&",reqUrl];
            }
            NSString *curKey = keys[i];
            NSString *curValue = [paramDic objectForKey:curKey];
            reqUrl = [NSString stringWithFormat:@"%@%@=%@",reqUrl,curKey,curValue];
        }
    }
    
    return reqUrl;
}




#pragma mark - 私有方法

- (void)postRequest:(AbsApi<ApiDelegate>*)api
           sucBlock:(ResponseSuccessBlock)sucBlock
           failBlock:(ResponseFailureBlock)failBlock;
{
    NSString *requestUrl = [api getReqUrl];
    NSDictionary *bodyDic = [api getReqBody];
    
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

- (void)getRequest:(AbsApi<ApiDelegate>*)api
          sucBlock:(ResponseSuccessBlock)sucBlock
          failBlock:(ResponseFailureBlock)failBlock;
{
    NSString *requestUrl = [self getReqGetUrl:api];
    NSLog(@"********[请求地址：%@]",requestUrl);
    
    AFHTTPSessionManager *manager = [self createAFHttpManagerForApi:api];
    [manager GET:requestUrl
      parameters:nil
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
