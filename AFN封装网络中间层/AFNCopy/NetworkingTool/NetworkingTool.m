//
//  NetworkingTool.m
//  AFNCopy
//
//  Created by doublek on 2017/3/16.
//  Copyright © 2017年 DoubleK. All rights reserved.
//

#import "NetworkingTool.h"

@implementation NetworkingTool

/**
 创建网络请求工具的单例
 */
+(instancetype)sharedWorkingTool{
    
    static NetworkingTool * workingTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        workingTool = [[self alloc]initWithBaseURL:nil];
        
        //设置客户端可以接收的数据类型
        workingTool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", nil];        
    });
    
    return workingTool;
}

-(void)requesWithURL:(NSString *)urlstr method:(NSString *)method parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))downloadProgress callBack:(void (^)(id responseObject))callBack{
    
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer  serializer];
    
    if ([method isEqualToString:@"GET"]) {
        //调用AFN发起GET请求
        [self GET:urlstr parameters:parameters progress:downloadProgress  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //将AFN获取的数据,原封不动地返回给controller
            //回调数据
            callBack(responseObject);
            NSLog(@"%@",responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //如果请求失败,也需要执行callBack,告诉调用者请求失败了,不然服务器会在一直等待
            callBack(nil);
            
        }];
    }
    
    //调用POST请求
    if ([method isEqualToString:@"POST"]) {
        
        [self POST:urlstr parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //请求成功就数据回调
            callBack(responseObject);
            NSLog(@"%@",responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            //请求失败就返回nill
            callBack(nil);
            
        }];
   
    }
    
}

@end
