//
//  ViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "MainViewController.h"
#import "GlobalFunc.h"
#import "DairyViewController.h"
#import "ProfileViewController.h"
#import "ReminderViewController.h"
#import "EvaluteViewController.h"
#import "SetViewController.h"
#import "commonKnowledgeViewController.h"
#import "LoginViewController.h"

#import <CoreData/CoreData.h>
#import "User.h"
#import "AppDelegate.h"

@interface MainViewController ()

@property  UIImageView *backgroundImageView;
@property  CGFloat screenHeight;
@property  CGFloat screenWight;

@property  NSManagedObjectContext *myContext;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数值
    //DataManagment *dataManagment = [DataManagment sharedManager];
    //[dataManagment initValues];
    
    //保证按钮不失效
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    
    UIImage *background = [UIImage imageNamed:@"Desktop.png"];
    self.backgroundImageView = [[UIImageView alloc] initWithImage:background];
    self.backgroundImageView.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.backgroundImageView.contentMode =  UIViewContentModeLeft;
    [self.view addSubview:self.backgroundImageView];
    //self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    //self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(85.5, 30, 200, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"血糖小管家";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    
    // ***************************************************
    // Forward Area
    UIButton *dairyButton;
    UIButton *fileButton;
    UIButton *evaluteButton;
    UIButton *reminderButton;
    UIButton *commonKnowledgeButton;
    UIButton *setButton;
    
    setButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [setButton setImage:[UIImage imageNamed:@"Settings.png"] forState:UIControlStateNormal];
    [setButton addTarget:self action:@selector(setButtonPressed) forControlEvents:UIControlEventTouchDown];
    setButton.frame = CGRectMake(15, 34, 26, 26);
    [topBarView addSubview:setButton];
    
    dairyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dairyButton setImage:[UIImage imageNamed:@"Dairy.png"] forState:UIControlStateNormal];
    [dairyButton addTarget:self action:@selector(dairyButtonPressed) forControlEvents:UIControlEventTouchDown];
    dairyButton.frame = CGRectMake(45, 135, 180, 144);
    
    //left; space: 7; ratio: 5/4
    fileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //fileButton.adjustsImageWhenHighlighted = NO;
    [fileButton setImage:[UIImage imageNamed:@"File.png"] forState:UIControlStateNormal];
    [fileButton addTarget:self action:@selector(fileButtonPressed) forControlEvents:UIControlEventTouchDown];
    fileButton.frame = CGRectMake(45, 286, 180, 144);
    
    reminderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //reminderButton.adjustsImageWhenHighlighted = NO;
    [reminderButton setImage:[UIImage imageNamed:@"Reminder.png"] forState:UIControlStateNormal];
    [reminderButton addTarget:self action:@selector(reminderButtonPressed) forControlEvents:UIControlEventTouchDown];
    reminderButton.frame = CGRectMake(45, 437, 180, 144);
    
    //right; space: 7
    evaluteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //evaluteButton.adjustsImageWhenHighlighted = NO;
    [evaluteButton setImage:[UIImage imageNamed:@"Judge.png"] forState:UIControlStateNormal];
    [evaluteButton addTarget:self action:@selector(evaluteButtonPressed) forControlEvents:UIControlEventTouchDown];
    evaluteButton.frame = CGRectMake(232, 135, 100, 295);
    
    commonKnowledgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //commonKnowledgeButton.adjustsImageWhenHighlighted = NO;
    [commonKnowledgeButton setImage:[UIImage imageNamed:@"CommonKnowledge.png"] forState:UIControlStateNormal];
    [commonKnowledgeButton addTarget:self action:@selector(commonKnowledgeButtonPressed) forControlEvents:UIControlEventTouchDown];
    commonKnowledgeButton.frame = CGRectMake(232, 437, 100, 144);
    
    [self.view addSubview:dairyButton];
    [self.view addSubview:fileButton];
    [self.view addSubview:reminderButton];
    [self.view addSubview:evaluteButton];
    [self.view addSubview:commonKnowledgeButton];
    
    [self addLogin];
    
    
    //Database Test*********************************************************************
    
    //AppDelegate *delegate= [UIApplication sharedApplication].delegate;
    //_myContext = delegate.managedObjectContext;
    
    //User *user = [self regiseter:@"zhangsv"];
    //[self saveData:user withAge:@"17" withGender:@"man"];
    //[self printData:user];
    
}

#pragma mark - ButtonPressed

-(void)addLogin
{
    loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    loginViewController = [[LoginViewController alloc]init];
    [loginView addSubview:loginViewController.view];
    [self.view addSubview:loginView];
}

-(void)setButtonPressed{
    
    NSLog(@"Set");
    setView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    setViewController = [[SetViewController alloc] init];
    [setView addSubview:setViewController.view];
    [self.view addSubview:setView];
    //[GlobalFunc moveForwardFromView:self.view moveForwardToView:setView];
    
}


-(void)dairyButtonPressed{
    
    NSLog(@"Dairy");
    dairyView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    dairyViewController = [[DairyViewController alloc] init];
    [dairyView addSubview:dairyViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:dairyView];
    
}

-(void)fileButtonPressed{
    
    NSLog(@"File");
    
    profileView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    profileViewController = [[ProfileViewController alloc] init];
    [profileView addSubview:profileViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:profileView];
    
}

-(void)reminderButtonPressed{
    NSLog(@"Reminder");
    
    reminderView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    reminderViewController = [[ReminderViewController alloc] init];
    [reminderView addSubview:reminderViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:reminderView];
    
}

-(void)evaluteButtonPressed{
    NSLog(@"evalute");
    
    evaluteView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    evaluteViewController = [[EvaluteViewController alloc] init];
    [evaluteView addSubview:evaluteViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:evaluteView];
    
}

-(void)commonKnowledgeButtonPressed{
    NSLog(@"CommonKnowlodge");
    
    commonKnowledgeView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    commonKnowledgeViewController = [[CommonKnowledgeViewController alloc] init];
    [commonKnowledgeView addSubview:commonKnowledgeViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:commonKnowledgeView];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
