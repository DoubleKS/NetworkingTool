//
//  TwoViewController.m
//  AFNCopy
//
//  Created by doublek on 2017/3/16.
//  Copyright © 2017年 DoubleK. All rights reserved.
//

#import "TwoViewController.h"
#import "NetworkingTool.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self networkingToolGet];
}

-(void)networkingToolGet{
    
    [[NetworkingTool sharedWorkingTool] requesWithURL:@"http://127.0.0.1/login.php" method:@"GET" parameters:@{@"username":@"zhangsan", @"password": @"zhang"} progress:nil
                                             callBack:^(id response) {
                                                 
                                                 NSLog(@"%@",response);
                                             }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
