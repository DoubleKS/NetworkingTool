//
//  ViewController.m
//  AFNCopy
//
//  Created by doublek on 2017/3/15.
//  Copyright © 2017年 DoubleK. All rights reserved.
//

#import "ViewController.h"
#import "NetworkingTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self networkingToolGet];
    
}

-(void)networkingToolGet{
    
    [[NetworkingTool sharedWorkingTool] requesWithURL:@"http://www.apple.com/cn/" method:@"GET" parameters:nil progress:nil callBack:^(id responseObject) {
        
        NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    }];

//    [[AFHTTPSessionManager manager] GET:@"http://www.apple.com/cn/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"======%@",error);
//    }];
}

-(void)networkingToolPOST{
    
    [[NetworkingTool sharedWorkingTool] requesWithURL:@"http://127.0.0.1/login.php" method:@"POST" parameters:@{@"username":@"zhangsan", @"password": @"zhang"} progress:nil callBack:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
    }];
      
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
