//
//  RecordDiabetesViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "RecordDiabetesViewController.h"
#import "GlobalFunc.h"
#import "PNChart.h"
#import <QuartzCore/QuartzCore.h>
#import "AddDiabetesRecordsViewController.h"
#import "DairyFunc.h"

@interface RecordDiabetesViewController ()

@property  UIImageView *backgroundImageView;

@property UILabel *startDateLabel;
@property UILabel *endDateLabel;

@property PNLineChart * lineChart;
@property UIView *bottomBarView;
@property UIView *greyBackgroundView;
@property UIView *datePickerBackgroundView;
@property UIView *reminderBackgroundView;
@property UIDatePicker *datePicker;

@end

@implementation RecordDiabetesViewController

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
    topBarTitleLabel.text = @"血糖信息";
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
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, NAVIBARHEIGHT, 50, 30)];
    label1.backgroundColor = [UIColor clearColor];
    label1.opaque = NO;
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"早餐";
    [self.view addSubview:label1];
    
    UIView *separatorX5 = [[UIView alloc]initWithFrame:CGRectMake(50, NAVIBARHEIGHT+30, 50, 2)];
    separatorX5.backgroundColor = [UIColor grayColor];
    [self.view addSubview:separatorX5];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(155, NAVIBARHEIGHT, 50, 30)];
    label2.backgroundColor = [UIColor clearColor];
    label2.opaque = NO;
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"午餐";
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(260, NAVIBARHEIGHT, 50, 30)];
    label3.backgroundColor = [UIColor clearColor];
    label3.opaque = NO;
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont systemFontOfSize:16];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.text = @"晚餐";
    [self.view addSubview:label3];

    
    // ***************************************************
    // Line Chart Area
    UIView *disgram = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIBARHEIGHT, WIDTH+120,245)];
    disgram.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:disgram];
    
    [DairyFunc initMealTypeButtons:self.view];
    [DairyFunc initDiabetesDairy:self.view];  //初始Dairy Colume数据数组
    [DairyFunc initMealTypeButtonsStatus];

    //************************************************************************************
    //设置监听，监听是否有删除，添加然后调用函数,更新页面
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reloadDiabetesIDairy)
                                                name:@"saveDiabetesCellData"//消息名
                                              object:nil];//注意是nil
    
    //设置监听，监听是否更换页面
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(reloadDiabetesIDairy)
                                                name:@"changeDiabetesView"//消息名
                                              object:nil];//注意是nil
    
}
//TODO: bottomBarView集成到GlobalFunc

#pragma mark - ButtonPressed
// *******************************************************************
-(void)reloadDiabetesIDairy
{
    [DairyFunc initDiabetesDairy:self.view];
}






// Return&Forward
-(void)returnButtonPressed{
    
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    
}


-(void)forwardButtonPressed{
    
    NSLog(@"Add");
    addDiabetesRecordsView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    addDiabetesRecordsViewController = [[AddDiabetesRecordsViewController alloc] init];
    [addDiabetesRecordsView addSubview:addDiabetesRecordsViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:addDiabetesRecordsView];
    
}


// *******************************************************************
// Reminder
-(void)reminderButtonPressed {
    
    [self.view addSubview:_greyBackgroundView];
    [self.view addSubview:_reminderBackgroundView];
    
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
 // ***************************************************
 // Reminder Area
 UIButton *reminderButton = [UIButton buttonWithType:UIButtonTypeCustom];
 reminderButton.frame = CGRectMake(62, NAVIBARHEIGHT + 500, 149, 22);
 reminderButton.adjustsImageWhenHighlighted = NO;
 [reminderButton setTitle:@"备注" forState:UIControlStateNormal];
 reminderButton.titleLabel.font = [UIFont systemFontOfSize: 19.0];
 [reminderButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 [reminderButton addTarget:self action:@selector(reminderButtonPressed) forControlEvents:UIControlEventTouchDown];
 
 _reminderBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(40, 200, 300, 220)];
 _reminderBackgroundView.backgroundColor = [UIColor whiteColor];
 _reminderBackgroundView.alpha = 1.0;
 _reminderBackgroundView.layer.cornerRadius = 10.0;
 _reminderBackgroundView.layer.masksToBounds = NO; //防止子元素溢出
 
 _reminderBackgroundView.layer.shadowOffset = CGSizeMake(1, 1);
 _reminderBackgroundView.layer.shadowRadius = 5.0;
 _reminderBackgroundView.layer.shadowColor = [UIColor blackColor].CGColor;
 _reminderBackgroundView.layer.shadowOpacity = 0.8;
 
 UILabel *reminderLabel = [[UILabel alloc]initWithFrame:CGRectMake(98, 15,95,25)];
 reminderLabel.backgroundColor = [UIColor clearColor];
 reminderLabel.opaque = NO;
 reminderLabel.textColor = [UIColor blackColor];
 reminderLabel.font = [UIFont systemFontOfSize:21];
 reminderLabel.textAlignment = NSTextAlignmentCenter;
 reminderLabel.text = @"备注";
 
 UILabel *reminderTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 55,130,25)];
 reminderTextLabel.backgroundColor = [UIColor clearColor];
 reminderTextLabel.opaque = NO;
 reminderTextLabel.textColor = [UIColor blackColor];
 reminderTextLabel.font = [UIFont systemFontOfSize:16];
 reminderTextLabel.textAlignment = NSTextAlignmentCenter;
 reminderTextLabel.text = @"保持作息规律。";
 
 UIButton *reminderConfirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
 reminderConfirmButton.frame = CGRectMake(100, 185, 95, 25);
 reminderConfirmButton.adjustsImageWhenHighlighted = NO;
 [reminderConfirmButton setTitle:@"确认" forState:UIControlStateNormal];
 reminderConfirmButton.titleLabel.font = [UIFont systemFontOfSize: 19.0];
 [reminderConfirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
 [reminderConfirmButton addTarget:self action:@selector(reminderCancelButtonPressed) forControlEvents:UIControlEventTouchDown];
 
 
 [_reminderBackgroundView addSubview:reminderLabel];
 [_reminderBackgroundView addSubview:reminderConfirmButton];
 [_reminderBackgroundView addSubview:reminderTextLabel];
 [_reminderBackgroundView addSubview:separatorXLine];
 //[self.view addSubview:reminderButton];
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
