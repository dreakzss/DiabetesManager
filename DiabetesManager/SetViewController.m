//
//  SetViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/30.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "SetViewController.h"
#import "GlobalDef.h"
#import "GlobalFunc.h"
#import "LoginViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.5, 30, 140, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"设置";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    UIImage *backImage = [UIImage imageNamed:@"Doctor.png"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = CGRectMake(WIDTH/2 - 30, 170, 60, 60);
    [self.view addSubview:backImageView];

    UIButton *saveButton;
    UIButton *logoutButton;
    
    CGColorRef colorref1 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    CGColorRef colorref2 = [GlobalFunc colorFromHexRGB:@"D3D3D3"].CGColor;
    [saveButton.layer setBackgroundColor:colorref1];//背景颜色
    [saveButton.layer setBorderColor:colorref2];//边框颜色;
    
    logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutButton.frame = CGRectMake(25, 350, WIDTH-50, 40);
    [logoutButton.layer setMasksToBounds:YES];
    [logoutButton.layer setCornerRadius:10.0];
    [logoutButton.layer setBorderWidth:1.0];
    [logoutButton addTarget:self action:@selector(logoutButtonPressed) forControlEvents:UIControlEventTouchDown];
    [logoutButton.layer setBackgroundColor:colorref1];//背景颜色
    [logoutButton.layer setBorderColor:colorref2];//边框颜色
    [logoutButton setTitle:@"退出账号" forState:UIControlStateNormal];
    [self.view addSubview:logoutButton];
    

}

-(void)logoutButtonPressed
{
    loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    loginViewController = [[LoginViewController alloc]init];
    [loginView addSubview:loginViewController.view];
    [self.view.superview.superview addSubview:loginView];
    [self.view.superview removeFromSuperview];
    [self.view removeFromSuperview];
}

-(void)returnButtonPressed{
    [self.view.superview removeFromSuperview];
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
