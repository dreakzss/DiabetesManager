//
//  ReminderViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/14.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "ReminderViewController.h"
#import "GlobalFunc.h"
#import "RemindMedicineViewController.h"
#import "RemindSportsViewController.h"
#import "RemindMeasurementViewController.h"

@interface ReminderViewController ()

@property  UIImageView *backgroundImageView;

@end

@implementation ReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    UIButton *remindMedicineButton;
    UIButton *remindSportsButton;
    
    //保证按钮不失效
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    
    UIImage *background = [UIImage imageNamed:@"Background.jpg"];
    self.backgroundImageView = [[UIImageView alloc] initWithImage:background];
    self.backgroundImageView.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.backgroundImageView.contentMode =  UIViewContentModeLeft;
    [self.view addSubview:self.backgroundImageView];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(87.5, 30, 200, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"我的提醒";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    
    // ***************************************************
    // Forward Area
    //spacing: 80 + 40 = 120
    remindMedicineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    remindMedicineButton.frame = CGRectMake(77.5, 170, 220, 80);
    remindMedicineButton.backgroundColor = [GlobalFunc colorFromHexRGB:@"33CCCC"];
    [remindMedicineButton.layer setMasksToBounds:YES];
    [remindMedicineButton.layer setCornerRadius:10];
    [remindMedicineButton.layer setBorderWidth:1];
    CGColorRef borderColorDiabetes = [GlobalFunc colorFromHexRGB:@"CC9900"].CGColor;
    [remindMedicineButton.layer setBorderColor:borderColorDiabetes];
    [remindMedicineButton addTarget:self action:@selector(remindMedicineButtonPressed) forControlEvents:UIControlEventTouchDown];
    UILabel *remindMedicineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 220, 80)];
    remindMedicineLabel.text = @"用药提醒";
    remindMedicineLabel.font = [UIFont systemFontOfSize:30];
    remindMedicineLabel.textColor = [UIColor whiteColor];
    remindMedicineLabel.textAlignment = NSTextAlignmentCenter;
    
    [remindMedicineButton addSubview:remindMedicineLabel];
    
    remindSportsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    remindSportsButton.frame = CGRectMake(77.5, 290, 220, 80);
    remindSportsButton.backgroundColor = [GlobalFunc colorFromHexRGB:@"33CCCC"];
    [remindSportsButton.layer setMasksToBounds:YES];
    [remindSportsButton.layer setCornerRadius:10];
    [remindSportsButton.layer setBorderWidth:1];
    CGColorRef BorderColorBMI = [GlobalFunc colorFromHexRGB:@"CC9900"].CGColor;
    [remindSportsButton.layer setBorderColor:BorderColorBMI];
    [remindSportsButton addTarget:self action:@selector(remindSportsButtonPressed) forControlEvents:UIControlEventTouchDown];
    UILabel *remindSportsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 220, 80)];
    remindSportsLabel.text = @"运动提醒";
    remindSportsLabel.font = [UIFont systemFontOfSize:30];
    remindSportsLabel.textColor = [UIColor whiteColor];
    remindSportsLabel.textAlignment = NSTextAlignmentCenter;
    
    [remindSportsButton addSubview:remindSportsLabel];
    
    /*
    remindMeasurementButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    remindMeasurementButton.frame = CGRectMake(77.5, 410, 220, 80);
    remindMeasurementButton.backgroundColor = [GlobalFunc colorFromHexRGB:@"33CCCC"];
    [remindMeasurementButton.layer setMasksToBounds:YES];
    [remindMeasurementButton.layer setCornerRadius:10];
    [remindMeasurementButton.layer setBorderWidth:1];
    CGColorRef BorderColorDiets = [GlobalFunc colorFromHexRGB:@"CC9900"].CGColor;
    [remindMeasurementButton.layer setBorderColor:BorderColorDiets];
    [remindMeasurementButton addTarget:self action:@selector(remindMeasurementButtonPressed) forControlEvents:UIControlEventTouchDown];
    UILabel *remindMeasurementLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 220, 80)];
    remindMeasurementLabel.text = @"测量提醒";
    remindMeasurementLabel.font = [UIFont systemFontOfSize:30];
    remindMeasurementLabel.textColor = [UIColor whiteColor];
    remindMeasurementLabel.textAlignment = NSTextAlignmentCenter;
    
    //[remindMeasurementButton addSubview:remindMeasurementLabel];
    */
    [self.view addSubview:remindMedicineButton];
    [self.view addSubview:remindSportsButton];
    //[self.view addSubview:remindMeasurementButton];
    
}

#pragma mark - ButtonPressed

-(void)remindMedicineButtonPressed{
    
    NSLog(@"Medicine");
    
    remindMedicineView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    remindMedicineViewController = [[RemindMedicineViewController alloc] init];
    [remindMedicineView addSubview:remindMedicineViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:remindMedicineView];
    
    
}

-(void)remindSportsButtonPressed{
    
    NSLog(@"Sports");
    
    remindSportsView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    remindSportsViewController = [[RemindSportsViewController alloc] init];
    [remindSportsView addSubview:remindSportsViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:remindSportsView];
    
}

-(void)remindMeasurementButtonPressed{
    
    NSLog(@"Measurement");
    
    remindMeasurementView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    remindMeasurementViewController = [[RemindMeasurementViewController alloc] init];
    [remindMeasurementView addSubview:remindMeasurementViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:remindMeasurementView];
    
}

-(void)returnButtonPressed{
    
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    
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
