//
//  RemindSportsViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/14.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "RemindSportsViewController.h"
#import "GlobalFunc.h"
#import "AddSportsReminderViewController.h"
#import "ReminderFunc.h"

@interface RemindSportsViewController ()

@end

@implementation RemindSportsViewController

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
    topBarTitleLabel.text = @"运动提醒";
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
    
    //****************************************************
    //[ReminderFunc initMedicineReminder:self.view isReload:0];
    [ReminderFunc initSportsReminder:self.view isReload:0];
    
    //设置监听，监听是否有删除，添加然后调用函数,更新页面
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reloadSportsReminder)
                                                name:@"saveSportsReCellData"//消息名
                                              object:nil];//注意是nil
    //点击edit时进入跳转
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(editButtonPressed)
                                                name:@"editSportsReCellData"//消息名
                                              object:nil];//注意是nil
    
    
}

-(void)reloadSportsReminder
{
    [ReminderFunc initSportsReminder:self.view isReload:1];
}

-(void)returnButtonPressed{
    
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    
}

-(void)forwardButtonPressed{
    
    NSLog(@"Add");
    
    [ReminderFunc isSportsEditNo];
    
    addSportsReminderView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    addSportsReminderViewController = [[AddSportsReminderViewController alloc] init];
    [addSportsReminderView addSubview:addSportsReminderViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:addSportsReminderView];
    
}

-(void)editButtonPressed{
    
    //NSLog(@"edit");
    [ReminderFunc isSportsEditYes];
    
    addSportsReminderView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    addSportsReminderViewController = [[AddSportsReminderViewController alloc] init];
    [addSportsReminderView addSubview:addSportsReminderViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:addSportsReminderView];
    
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
