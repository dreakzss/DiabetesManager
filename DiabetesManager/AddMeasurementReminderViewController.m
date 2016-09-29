//
//  AddMeasurementReminderViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/15.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "AddMeasurementReminderViewController.h"
#import "GlobalFunc.h"
#import "TriangleGrayView.h"

@interface AddMeasurementReminderViewController ()

@end

@implementation AddMeasurementReminderViewController

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
    topBarTitleLabel.text = @"添加提醒";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    //*****************************************************
    UILabel *measurementNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, 90, 40)];
    measurementNameLabel.backgroundColor = [UIColor clearColor];
    measurementNameLabel.opaque = NO;
    measurementNameLabel.textColor = [UIColor blackColor];
    measurementNameLabel.font = [UIFont systemFontOfSize:19];
    measurementNameLabel.textAlignment = NSTextAlignmentLeft;
    measurementNameLabel.text = @"测量类型 :";
    [self.view addSubview:measurementNameLabel];
    
    UITextField *measurementNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(125, 110, 195, 40)];
    measurementNameTextField.backgroundColor = [UIColor clearColor];
    measurementNameTextField.placeholder = @"请输入测量类型";
    measurementNameTextField.keyboardType = UIKeyboardTypeDefault;
    measurementNameTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:measurementNameTextField];
    
    UIImageView *micImageView1;
    UIImage *micView = [UIImage imageNamed:@"Mic.png"];
    micImageView1 = [[UIImageView alloc] initWithImage:micView];
    //micImageView.frame = CGRectMake(25, 390, 40, 40);
    micImageView1.frame = CGRectMake(315, 110, 40, 40);
    //[self.view addSubview:micImageView1];
    
    //UIView *separatorXLine = [[UIView alloc]initWithFrame:CGRectMake(80, 435, 262, 1)];
    UIView *separatorX1 = [[UIView alloc]initWithFrame:CGRectMake(123, 148, 180, 1)];
    separatorX1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:separatorX1];
    
    
    //*****************************************************
    UILabel *remindDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 160, 100, 40)];
    remindDateLabel.textColor = [UIColor blackColor];
    remindDateLabel.font = [UIFont systemFontOfSize:19];
    remindDateLabel.textAlignment = NSTextAlignmentLeft;
    remindDateLabel.text = @"提醒时间 :";
    [self.view addSubview:remindDateLabel];
    
    UILabel *remindDateValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 160, 190, 40)];
    remindDateValueLabel.textColor = [UIColor grayColor];
    remindDateValueLabel.font = [UIFont systemFontOfSize:17];
    remindDateValueLabel.textAlignment = NSTextAlignmentCenter;
    remindDateValueLabel.text = @"2016-05-13 19:20";
    [self.view addSubview:remindDateValueLabel];
    
    TriangleBlueView *triangleView4 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 176, 30, 30)];
    triangleView4.backgroundColor = [UIColor clearColor];
    [self.view addSubview:triangleView4];
    
    UIView *separatorX5 = [[UIView alloc]initWithFrame:CGRectMake(123, 192, 215, 1)];
    separatorX5.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [self.view addSubview:separatorX5];
    
    //*****************************************************
    UILabel *switchLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 210, 100, 40)];
    switchLabel.textColor = [UIColor blackColor];
    switchLabel.font = [UIFont systemFontOfSize:19];
    switchLabel.textAlignment = NSTextAlignmentLeft;
    switchLabel.text = @"是否开启 :";
    [self.view addSubview:switchLabel];
    
    UISwitch* onSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(288, 215, 0, 0)];
    [onSwitch setOn:YES];
    onSwitch.tintColor = [UIColor grayColor];
    [self.view addSubview:onSwitch];//添加到父视图
    
    //*****************************************************
    UIButton *saveButton;
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    saveButton.frame = CGRectMake(25, 270, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    //[saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    [saveButton.layer setBackgroundColor:colorref];//边框颜色
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
    
}

-(void)saveButtonPressed{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
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
