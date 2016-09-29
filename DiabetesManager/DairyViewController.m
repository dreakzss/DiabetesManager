//
//  DairyViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "DairyViewController.h"
#import "MainViewController.h"
#import "GlobalFunc.h"
#import "RecordDiabetesViewController.h"
#import "RecordBMIViewController.h"


@interface DairyViewController ()

@property  UIImageView *backgroundImageView;

@end

@implementation DairyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    UIButton *recordDiabetesButton;
    UIButton *recordBMIButton;
    
    //保证按钮不失效
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    
    UIImage *backgroundImage = [UIImage imageNamed:@"Background.jpg"];
    self.backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
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
    topBarTitleLabel.text = @"我的日记";
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
    recordDiabetesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    recordDiabetesButton.frame = CGRectMake(77.5, 170, 220, 80);
    recordDiabetesButton.backgroundColor = [GlobalFunc colorFromHexRGB:@"33CCCC"];
    [recordDiabetesButton.layer setMasksToBounds:YES];
    [recordDiabetesButton.layer setCornerRadius:10];
    [recordDiabetesButton.layer setBorderWidth:1];
    CGColorRef borderColorDiabetes = [GlobalFunc colorFromHexRGB:@"CC9900"].CGColor;
    [recordDiabetesButton.layer setBorderColor:borderColorDiabetes];
    [recordDiabetesButton addTarget:self action:@selector(recordDiabetesButtonPressed) forControlEvents:UIControlEventTouchDown];
    UILabel *recordDiabetesLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 220, 80)];
    recordDiabetesLabel.text = @"记录血糖";
    recordDiabetesLabel.font = [UIFont systemFontOfSize:30];
    recordDiabetesLabel.textColor = [UIColor whiteColor];
    recordDiabetesLabel.textAlignment = NSTextAlignmentCenter;
    
    [recordDiabetesButton addSubview:recordDiabetesLabel];
    
    
    recordBMIButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    recordBMIButton.frame = CGRectMake(77.5, 290, 220, 80);
    recordBMIButton.backgroundColor = [GlobalFunc colorFromHexRGB:@"33CCCC"];
    [recordBMIButton.layer setMasksToBounds:YES];
    [recordBMIButton.layer setCornerRadius:10];
    [recordBMIButton.layer setBorderWidth:1];
    CGColorRef BorderColorBMI = [GlobalFunc colorFromHexRGB:@"CC9900"].CGColor;
    [recordBMIButton.layer setBorderColor:BorderColorBMI];
    [recordBMIButton addTarget:self action:@selector(recordBMIButtonPressed) forControlEvents:UIControlEventTouchDown];
    UILabel *recordBMILabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 220, 80)];
    recordBMILabel.text = @"体质参数";
    recordBMILabel.font = [UIFont systemFontOfSize:30];
    recordBMILabel.textColor = [UIColor whiteColor];
    recordBMILabel.textAlignment = NSTextAlignmentCenter;
    [recordBMIButton addSubview:recordBMILabel];
    
    [self.view addSubview:recordDiabetesButton];
    [self.view addSubview:recordBMIButton];

}


#pragma mark - ButtonPressed

-(void)recordDiabetesButtonPressed{
    
    NSLog(@"Diabetes");
    recordDiabetesView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    recordDiabetesViewController = [[RecordDiabetesViewController alloc] init];
    [recordDiabetesView addSubview:recordDiabetesViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:recordDiabetesView];
    
}

-(void)recordBMIButtonPressed{
    
    NSLog(@"BMI");
    recordBMIView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    recordBMIViewController = [[RecordBMIViewController alloc] init];
    [recordBMIView addSubview:recordBMIViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:recordBMIView];
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
