//
//  RootViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/2.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "GlobalFunc.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor redColor];
    
    mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    mainViewController = [[MainViewController alloc] init];
    
    
    [mainView addSubview:mainViewController.view];
    [self.view addSubview:mainView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Done



//TODO: 页面滑动



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
