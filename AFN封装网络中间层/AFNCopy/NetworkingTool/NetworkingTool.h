//
//  NetworkingTool.h
//  AFNCopy
//
//  Created by doublek on 2017/3/16.
//  Copyright © 2017年 DoubleK. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkingTool : AFHTTPSessionManager

//单例
+(instancetype)sharedWorkingTool;

-(void)requesWithURL:(NSString *)urlstr method:(NSString *)method parameters:(id)parameters progress:(void (^)(NSProgress * ))downloadProgress callBack:(void(^)(id responseObject)) callBack;


@end
