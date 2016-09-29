//
//  AddBMIRecordsViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/28.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "AddBMIRecordsViewController.h"
#import "GlobalFunc.h"
#import "DairyFunc.h"
#import <QuartzCore/QuartzCore.h>

@interface AddBMIRecordsViewController ()

@property UITextField *textField;

@end

@implementation AddBMIRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.5, 30, 190, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"记录体质参数";
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
    [self.view addSubview:dateFieldView];
    
    UILabel *dateTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 120, 90, 40)];
    dateTextLabel.textColor = [UIColor blackColor];
    dateTextLabel.font = [UIFont systemFontOfSize:17];
    dateTextLabel.textAlignment = NSTextAlignmentCenter;
    dateTextLabel.text = @"记录日期";
    [self.view addSubview:dateTextLabel];
    
    UIButton *dateChangedButton;
    dateChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dateChangedButton addTarget:self action:@selector(bmiTimeChangeButtonPressed) forControlEvents:UIControlEventTouchDown];
    dateChangedButton.frame = CGRectMake(140, 121, 196, 40);
    [self.view addSubview:dateChangedButton];
    
    
    //**************************************************************************************************
    UIView *heightFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 185, WIDTH-50, 50)];
    heightFieldView.backgroundColor = [UIColor whiteColor];
    heightFieldView.layer.cornerRadius = 10.0;
    heightFieldView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:heightFieldView];
    
    UILabel *heightFieldTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 190, 90, 40)];
    heightFieldTextLabel.textColor = [UIColor blackColor];
    heightFieldTextLabel.font = [UIFont systemFontOfSize:17];
    heightFieldTextLabel.textAlignment = NSTextAlignmentCenter;
    heightFieldTextLabel.text = @"记录身高";
    [self.view addSubview:heightFieldTextLabel];
    
    _heightTextField = [[UITextField alloc]initWithFrame:CGRectMake(140, 192, 196, 40)];
    _heightTextField.backgroundColor = [UIColor whiteColor];
    _heightTextField.textColor = [UIColor grayColor];
    _heightTextField.placeholder = @"请输入身高信息";
    _heightTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _heightTextField.textAlignment = NSTextAlignmentCenter;
    _heightTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //_heightTextField.clearsOnBeginEditing = YES;
    //keyboardToolbar中间unitLabel发生变化后不能共用，要重新声明，否则会出错
    UIToolbar *keyboardToolbar1 = [[UIToolbar alloc] init];
    [keyboardToolbar1 sizeToFit];
    UILabel *unitLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 290, 25)];
    unitLabel1.font = [UIFont systemFontOfSize:17];
    unitLabel1.backgroundColor = [UIColor clearColor];
    unitLabel1.textAlignment = NSTextAlignmentLeft;
    unitLabel1.textColor = [UIColor blackColor];
    unitLabel1.text  = @"单位：cm";
    UIBarButtonItem *myButtonItem1 = [[UIBarButtonItem alloc]initWithCustomView:unitLabel1];
    UIBarButtonItem *doneBarButton1 = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self.view action:@selector(endEditing:)];
    keyboardToolbar1.items = @[myButtonItem1, doneBarButton1];
    _heightTextField.inputAccessoryView = keyboardToolbar1;
    [self.view addSubview:_heightTextField];
    
    UIView *weightFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 255, WIDTH-50, 50)];
    weightFieldView.backgroundColor = [UIColor whiteColor];
    weightFieldView.layer.cornerRadius = 10.0;
    weightFieldView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:weightFieldView];
    
    UILabel *weightTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 260, 90, 40)];
    weightTextLabel.textColor = [UIColor blackColor];
    weightTextLabel.font = [UIFont systemFontOfSize:17];
    weightTextLabel.textAlignment = NSTextAlignmentCenter;
    weightTextLabel.text = @"记录体重";
    [self.view addSubview:weightTextLabel];
    
    _weightTextField = [[UITextField alloc]initWithFrame:CGRectMake(140, 262, 196, 40)];
    _weightTextField.backgroundColor = [UIColor whiteColor];
    _weightTextField.textColor = [UIColor grayColor];
    _weightTextField.placeholder = @"请输入体重信息";
    _weightTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _weightTextField.textAlignment = NSTextAlignmentCenter;
    _weightTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //_weightTextField.clearsOnBeginEditing = YES;
    
    UIToolbar* keyboardToolbar2 = [[UIToolbar alloc] init];
    [keyboardToolbar2 sizeToFit];
    UILabel *unitLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 290, 25)];
    unitLabel2.font = [UIFont systemFontOfSize:17];
    unitLabel2.backgroundColor = [UIColor clearColor];
    unitLabel2.textAlignment = NSTextAlignmentLeft;
    unitLabel2.textColor = [UIColor blackColor];
    unitLabel2.text  = @"单位：kg";
    UIBarButtonItem *myButtonItem2 = [[UIBarButtonItem alloc]initWithCustomView:unitLabel2];
    UIBarButtonItem *doneBarButton2 = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                       target:self.view action:@selector(endEditing:)];
    keyboardToolbar2.items = @[myButtonItem2, doneBarButton2];
    _weightTextField.inputAccessoryView = keyboardToolbar2;
    
    [self.view addSubview:_weightTextField];
    
    UIView *waistlineFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 325, WIDTH-50, 50)];
    waistlineFieldView.backgroundColor = [UIColor whiteColor];
    waistlineFieldView.layer.cornerRadius = 10.0;
    waistlineFieldView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:waistlineFieldView];
    
    UILabel *waistlineTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 330, 90, 40)];
    waistlineTextLabel.textColor = [UIColor blackColor];
    waistlineTextLabel.font = [UIFont systemFontOfSize:17];
    waistlineTextLabel.textAlignment = NSTextAlignmentCenter;
    waistlineTextLabel.text = @"记录腰围";
    [self.view addSubview:waistlineTextLabel];
    
    _waistlineTextField = [[UITextField alloc]initWithFrame:CGRectMake(140, 332, 196, 40)];
    _waistlineTextField.backgroundColor = [UIColor whiteColor];
    _waistlineTextField.textColor = [UIColor grayColor];
    _waistlineTextField.placeholder = @"请输入腰围信息";
    _waistlineTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _waistlineTextField.textAlignment = NSTextAlignmentCenter;
    _waistlineTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //_waistlineTextField.clearsOnBeginEditing = YES;
    
    UIToolbar* keyboardToolbar3 = [[UIToolbar alloc] init];
    [keyboardToolbar3 sizeToFit];
    UILabel *unitLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 290, 25)];
    unitLabel3.font = [UIFont systemFontOfSize:17];
    unitLabel3.backgroundColor = [UIColor clearColor];
    unitLabel3.textAlignment = NSTextAlignmentLeft;
    unitLabel3.textColor = [UIColor blackColor];
    unitLabel3.text  = @"单位：cm";
    UIBarButtonItem *myButtonItem3 = [[UIBarButtonItem alloc]initWithCustomView:unitLabel3];
    UIBarButtonItem *doneBarButton3 = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                       target:self.view action:@selector(endEditing:)];
    keyboardToolbar3.items = @[myButtonItem3, doneBarButton3];
    _waistlineTextField.inputAccessoryView = keyboardToolbar3;
    [self.view addSubview:_waistlineTextField];
    
    UIButton *saveButton;
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    saveButton.frame = CGRectMake(25, 417, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    //[saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref4 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    [saveButton.layer setBackgroundColor:colorref4];//边框颜色
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    
    [self.view addSubview:saveButton];
    
    [DairyFunc initAddBMILabels:self.view];
    
    
}


#pragma mark - ButtonPressed

-(void)saveButtonPressed{
    
    NSLog(@"BMIRecordsSaved");
    UIViewController *rootViewController;
    UIAlertController *alertController;
    UIAlertAction *okAction;
    Boolean isConact;
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    //验证是否全填完信息
    isConact = [DairyFunc verifyAddBMIDataContact:_heightTextField.text withWeight:_weightTextField.text withWaistline:_waistlineTextField.text];
    if (isConact == NO) {
        alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"尚有信息未填写" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [rootViewController presentViewController:alertController animated:YES completion:nil];
    } else {
        alertController = [UIAlertController alertControllerWithTitle:@"体质参数记录" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
            //通知
            NSLog(@"waistline1: %@",_waistlineTextField.text);
            [DairyFunc saveNewBMIDairyCellArray:_heightTextField.text withWeight:_weightTextField.text withWaistline:_waistlineTextField.text];
            //NSLog(@"_heightTextField%@",_heightTextField.text);
            [GlobalFunc moveBackFromAddView:self.view moveBackToView:self.view.superview];
            
        }];
        [alertController addAction:okAction];
        //用root不用self是防止warning: detach..
        [rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
    
}


-(void)bmiTimeChangeButtonPressed{
    
    //NSLog(@"remindDateChangedButtonPressed");
    [DairyFunc bmiTimeChangeButtonPressed:self];
}

-(void)returnButtonPressed{
    
    [self.view endEditing:YES];
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
   
}

//当用户按下return键或者按回车键，keyboard消失，要写.delegate = self才生效
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
