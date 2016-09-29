//
//  RecordBMIViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/28.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "RecordBMIViewController.h"
#import "GlobalFunc.h"
#import "PNChart.h"
#import "AddBMIRecordsViewController.h"
#import "DairyFunc.h"


@interface RecordBMIViewController ()

@property  UIImageView *backgroundImageView;

@property PNLineChart * lineChart;
@property UIView *bottomBarView;
@property UIView *greyBackgroundView;
@property UIView *datePickerBackgroundView;
@property UIView *reminderBackgroundView;
@property UIDatePicker *datePicker;

@end

@implementation RecordBMIViewController

static UILabel *bmiRecordsStartDate;
static UILabel *bmiRecordsEndDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    UIButton *addButton;
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(87.5, 30, 200, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"体质参数";
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
    
    // ***************************************************
    // Line Chart Area
    UIView *disgram = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIBARHEIGHT, WIDTH+120,245)];
    disgram.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:disgram];
    
    [DairyFunc initBMIDairy:self.view];  //初始Dairy Colume数据数组
    
    //设置监听，监听是否有删除，添加然后调用函数,更新页面
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reloadBMIDairy)
                                                name:@"saveBMICellData"//消息名
                                              object:nil];//注意是nil
    
    
}

#pragma mark - ButtonPressed
// *******************************************************************
-(void)reloadBMIDairy
{
    [DairyFunc initBMIDairy:self.view];
}


-(void)returnButtonPressed{
    
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    
}

-(void)forwardButtonPressed{
    
    addBMIRecordsView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    addBMIRecordsViewController = [[AddBMIRecordsViewController alloc] init];
    [addBMIRecordsView addSubview:addBMIRecordsViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:addBMIRecordsView];
    
}

-(void)reminderCancelButtonPressed{
    
    [_greyBackgroundView removeFromSuperview];
    [_reminderBackgroundView removeFromSuperview];
    
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

