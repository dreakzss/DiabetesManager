//
//  RemindMeasurementViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/14.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "RemindMeasurementViewController.h"
#import "GlobalFunc.h"
#import "AddMeasurementReminderViewController.h"

@interface RemindMeasurementViewController ()

@end

@implementation RemindMeasurementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    UIButton *addButton;
    
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
    topBarTitleLabel.text = @"测量提醒";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.adjustsImageWhenHighlighted = NO;
    [addButton setImage:[UIImage imageNamed:@"IconAdd.png"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(forwardButtonPressed) forControlEvents:UIControlEventTouchDown];
    addButton.frame = CGRectMake(330, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    [self.view addSubview:addButton];
    
    UIView *reminder1View = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIBARHEIGHT, WIDTH, 85)];
    reminder1View.backgroundColor = [UIColor clearColor];
    [self.view addSubview:reminder1View];
    
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 18, 100, 30)];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.opaque = NO;
    timeLabel.textColor = [UIColor blackColor];
    timeLabel.font = [UIFont systemFontOfSize:35];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.text = @"21:10";
    [reminder1View addSubview:timeLabel];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 53, 100, 20)];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.opaque = NO;
    dateLabel.textColor = [UIColor blackColor];
    dateLabel.font = [UIFont systemFontOfSize:16];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.text = @"2016-05-15";
    [reminder1View addSubview:dateLabel];
    
    UISwitch* onSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(305, 23, 0, 0)];
    [onSwitch setOn:YES];
    onSwitch.tintColor = [UIColor grayColor];
    [reminder1View addSubview:onSwitch];
    
    UILabel *measurementNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(162, 33, 70, 15)];
    measurementNameLabel.backgroundColor = [UIColor clearColor];
    measurementNameLabel.opaque = NO;
    measurementNameLabel.textColor = [UIColor blackColor];
    measurementNameLabel.font = [UIFont systemFontOfSize:15];
    measurementNameLabel.textAlignment = NSTextAlignmentCenter;
    measurementNameLabel.text = @"测量血糖";
    [reminder1View addSubview:measurementNameLabel];
    
    UIView *separatorX1 = [[UIView alloc]initWithFrame:CGRectMake(15, 0, WIDTH - 30, 1)];
    separatorX1.backgroundColor = [GlobalFunc colorFromHexRGB:@"D3D3D3"];
    //[reminder1View addSubview:separatorX1];
    
    UIView *separatorX2 = [[UIView alloc]initWithFrame:CGRectMake(15, 85, WIDTH - 30, 1)];
    separatorX2.backgroundColor = [GlobalFunc colorFromHexRGB:@"D3D3D3"];
    [reminder1View addSubview:separatorX2];
}

-(void)returnButtonPressed{
    
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    
}

-(void)forwardButtonPressed{
    
    NSLog(@"Add");
    
    addMeasurementReminderView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    addMeasurementReminderViewController = [[AddMeasurementReminderViewController alloc] init];
    [addMeasurementReminderView addSubview:addMeasurementReminderViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:addMeasurementReminderView];
    
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
