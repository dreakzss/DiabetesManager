//
//  AddDietsRecordsViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/5.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "AddDietsRecordsViewController.h"
#import "GlobalFunc.h"
#import <QuartzCore/QuartzCore.h>

@interface AddDietsRecordsViewController ()

@property UITextField *textField;

@end

@implementation AddDietsRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    topBarTitleLabel.text = @"记录饮食";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    UIButton *returnButton;
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    
    // ***************************************************
    // Data Area
    UIView *dateFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 115, WIDTH-50, 50)];
    dateFieldView.backgroundColor = [UIColor whiteColor];
    dateFieldView.layer.cornerRadius = 10.0;
    dateFieldView.layer.masksToBounds = NO; //防止子元素溢出
    
    /*
     UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(50, 120, 275, 40)];
     textField.backgroundColor = [UIColor whiteColor];
     textField.placeholder = @"请输入";
     textField.keyboardType = UIKeyboardTypeDefault;
     */
    
    [self.view addSubview:dateFieldView];
    //[self.view addSubview:textField];
    
    UILabel *dateTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 90, 40)];
    dateTextLabel.textColor = [UIColor blackColor];
    dateTextLabel.font = [UIFont systemFontOfSize:17];
    dateTextLabel.textAlignment = NSTextAlignmentCenter;
    dateTextLabel.text = @"记录日期";
    [self.view addSubview:dateTextLabel];
    
    UILabel *dateDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 121, 160, 40)];
    dateDataLabel.textColor = [UIColor blackColor];
    dateDataLabel.font = [UIFont systemFontOfSize:17];
    dateDataLabel.textAlignment = NSTextAlignmentCenter;
    dateDataLabel.text = @"2016-05-11";
    [self.view addSubview:dateDataLabel];
    
    //space:70
    UIView *dbpTextFieldVIew = [[UIView alloc]initWithFrame:CGRectMake(25, 185, WIDTH-50, 50)];
    dbpTextFieldVIew.backgroundColor = [UIColor whiteColor];
    dbpTextFieldVIew.layer.cornerRadius = 10.0;
    dbpTextFieldVIew.layer.masksToBounds = NO; //防止子元素溢出
    
    //[self.view addSubview:dbpTextFieldVIew];
    //[self.view addSubview:textField];
    
    
    //25, 185, WIDTH-50, 50
    //UIView *sbpFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 255, WIDTH-50, 50)];
    UIView *sbpFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 185, WIDTH-50, 50)];
    sbpFieldView.backgroundColor = [UIColor whiteColor];
    sbpFieldView.layer.cornerRadius = 10.0;
    sbpFieldView.layer.masksToBounds = NO; //防止子元素溢出
    
    [self.view addSubview:sbpFieldView];
    //[self.view addSubview:textField];
    
    //UILabel *sbpTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 260, 110, 40)];
    UILabel *sbpTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, 190, 90, 40)];
    sbpTextLabel.textColor = [UIColor blackColor];
    sbpTextLabel.font = [UIFont systemFontOfSize:17];
    sbpTextLabel.textAlignment = NSTextAlignmentCenter;
    sbpTextLabel.text = @"记录食物";
    [self.view addSubview:sbpTextLabel];
    
    //UITextField *sbpTextField=[[UITextField alloc]initWithFrame:CGRectMake(180, 261, 150, 40)];
    UITextField *sbpTextField=[[UITextField alloc]initWithFrame:CGRectMake(180, 190, 150, 40)];
    sbpTextField.backgroundColor = [UIColor whiteColor];
    sbpTextField.placeholder = @"请输入食物信息";
    sbpTextField.keyboardType = UIKeyboardTypeDecimalPad;
    sbpTextField.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:sbpTextField];
    
    //UIView *dbpFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 325, WIDTH-50, 50)];
    UIView *dbpFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 255, WIDTH-50, 50)];
    dbpFieldView.backgroundColor = [UIColor whiteColor];
    dbpFieldView.layer.cornerRadius = 10.0;
    dbpFieldView.layer.masksToBounds = NO; //防止子元素溢出
    
    [self.view addSubview:dbpFieldView];
    //[self.view addSubview:textField];
    
    //UILabel *dbpTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 330, 110, 40)];
    UILabel *dbpTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 260, 110, 40)];
    dbpTextLabel.textColor = [UIColor blackColor];
    dbpTextLabel.font = [UIFont systemFontOfSize:17];
    dbpTextLabel.textAlignment = NSTextAlignmentCenter;
    dbpTextLabel.text = @"记录生糖指数";
    [self.view addSubview:dbpTextLabel];
    
    UITextField *dbpTextField=[[UITextField alloc]initWithFrame:CGRectMake(180, 260, 150, 40)];
    dbpTextField.backgroundColor = [UIColor whiteColor];
    dbpTextField.placeholder = @"请输入生糖指数";
    dbpTextField.keyboardType = UIKeyboardTypeDecimalPad;
    dbpTextField.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:dbpTextField];
    
    UIImageView *micImageView;
    UIImage *MicView = [UIImage imageNamed:@"Mic.png"];
    micImageView = [[UIImageView alloc] initWithImage:MicView];
    //micImageView.frame = CGRectMake(25, 390, 40, 40);
    micImageView.frame = CGRectMake(25, 330, 40, 40);
    //[self.view addSubview:micImageView];
    
    //UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(90, 393, 275, 40)];
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(30, 333, 335, 40)];
    _textField.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    _textField.placeholder = @"请输入备注信息，不超过20字";
    _textField.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:_textField];
    
    //UIView *separatorXLine = [[UIView alloc]initWithFrame:CGRectMake(80, 435, 262, 1)];
    UIView *separatorXLine = [[UIView alloc]initWithFrame:CGRectMake(30, 375, 312, 1)];
    separatorXLine.backgroundColor = [UIColor grayColor];
    [self.view addSubview:separatorXLine];
    
    //_textField.delegate = self;
    
    
    UIButton *saveButton;
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    saveButton.frame = CGRectMake(25, 408, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    //[saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref4 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    [saveButton.layer setBackgroundColor:colorref4];//边框颜色
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    
    [self.view addSubview:saveButton];
    
    
    /*
     [DateArray addObject:@"2016-04-11 6pm"];
     
     [sbpArray addObject:@"60"];
     [sbpArray addObject:@"66"];
     [sbpArray addObject:@"83"];
     [sbpArray addObject:@"73"];
     [sbpArray addObject:@"58"];
     //[sbpArray addObject:@"58"];
     
     // @120, @130, @125, @133, @116
     [dbpArray addObject:@"120"];
     [dbpArray addObject:@"130"];
     [dbpArray addObject:@"125"];
     [dbpArray addObject:@"133"];
     [dbpArray addObject:@"116"];
     //[dbpArray addObject:@"116"];
     */
    
    
}

#pragma mark - ButtonPressed

-(void)saveButtonPressed{
    
    NSLog(@"BMIRecordsSaved");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"体质参数记录" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
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
