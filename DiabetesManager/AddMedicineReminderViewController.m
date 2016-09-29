//
//  AddMedicineReminderViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/14.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "AddMedicineReminderViewController.h"
#import "GlobalFunc.h"
#import "ReminderFunc.h"

@interface AddMedicineReminderViewController ()

@end

@implementation AddMedicineReminderViewController

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
    UIView *medicineNameView = [[UIView alloc]initWithFrame:CGRectMake(25, 115, WIDTH-50, 50)];
    medicineNameView.backgroundColor = [UIColor whiteColor];
    medicineNameView.layer.cornerRadius = 10.0;
    medicineNameView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:medicineNameView];
    
    UILabel *medicineNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 122, 90, 40)];
    medicineNameLabel.backgroundColor = [UIColor clearColor];
    medicineNameLabel.opaque = NO;
    medicineNameLabel.textColor = [UIColor blackColor];
    medicineNameLabel.font = [UIFont systemFontOfSize:19];
    medicineNameLabel.textAlignment = NSTextAlignmentLeft;
    medicineNameLabel.text = @"药品名称 :";
    [self.view addSubview:medicineNameLabel];
    
    _medicineNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(140, 123, 195, 40)];
    _medicineNameTextField.backgroundColor = [UIColor clearColor];
    _medicineNameTextField.textColor = [UIColor grayColor];
    _medicineNameTextField.placeholder = @"请输入药品名称";
    _medicineNameTextField.keyboardType = UIKeyboardTypeDefault;
    _medicineNameTextField.returnKeyType = UIReturnKeyDone;
    _medicineNameTextField.textAlignment = NSTextAlignmentCenter;
    _medicineNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _medicineNameTextField.delegate = self;
    [self.view addSubview:_medicineNameTextField];
    
    //*****************************************************
    UIView *remindDateView = [[UIView alloc]initWithFrame:CGRectMake(25, 185, WIDTH-50, 50)];
    remindDateView.backgroundColor = [UIColor whiteColor];
    remindDateView.layer.cornerRadius = 10.0;
    remindDateView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:remindDateView];
    
    UILabel *remindDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 192, 90, 40)];
    remindDateLabel.textColor = [UIColor blackColor];
    remindDateLabel.font = [UIFont systemFontOfSize:19];
    remindDateLabel.textAlignment = NSTextAlignmentLeft;
    remindDateLabel.text = @"提醒时间 :";
    [self.view addSubview:remindDateLabel];
    
    UIButton *remindDateChangedButton;
    remindDateChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [remindDateChangedButton addTarget:self action:@selector(remindDateChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    remindDateChangedButton.frame = CGRectMake(140, 193, 196, 40);
    [self.view addSubview:remindDateChangedButton];
    
    //*****************************************************
    UIView *dosageView = [[UIView alloc]initWithFrame:CGRectMake(25, 255, WIDTH-50, 50)];
    dosageView.backgroundColor = [UIColor whiteColor];
    dosageView.layer.cornerRadius = 10.0;
    dosageView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:dosageView];
    
    UILabel *dosageLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 262, 90, 40)];
    dosageLabel.textColor = [UIColor blackColor];
    dosageLabel.font = [UIFont systemFontOfSize:19];
    dosageLabel.textAlignment = NSTextAlignmentCenter;
    dosageLabel.text = @"用量 :";
    [self.view addSubview:dosageLabel];
    
    UIButton *dosageChangedButton;
    dosageChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dosageChangedButton addTarget:self action:@selector(dosageChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    dosageChangedButton.frame = CGRectMake(140, 263, 196, 40);
    [self.view addSubview:dosageChangedButton];
    
    //*****************************************************
    UIView *unitTypeView = [[UIView alloc]initWithFrame:CGRectMake(25, 325, WIDTH-50, 50)];
    unitTypeView.backgroundColor = [UIColor whiteColor];
    unitTypeView.layer.cornerRadius = 10.0;
    unitTypeView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:unitTypeView];
    
    UILabel *unitTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 332, 90, 40)];
    unitTypeLabel.textColor = [UIColor blackColor];
    unitTypeLabel.font = [UIFont systemFontOfSize:19];
    unitTypeLabel.textAlignment = NSTextAlignmentCenter;
    unitTypeLabel.text = @"单位 :";
    [self.view addSubview:unitTypeLabel];
    
    UIButton *unitTypeChangedButton;
    unitTypeChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [unitTypeChangedButton addTarget:self action:@selector(unitTypeChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    unitTypeChangedButton.frame = CGRectMake(140, 333, 196, 40);
    [self.view addSubview:unitTypeChangedButton];
    
    //*****************************************************
    UIButton *saveButton;
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    saveButton.frame = CGRectMake(25, 420, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    //[saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    [saveButton.layer setBackgroundColor:colorref];//边框颜色
    [saveButton setTitle:@"保存信息" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
    
    //初始化页面数据
    [ReminderFunc initAddMedLabels:self.view];
    
    //更新textfield.text
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(changeText)
                                                name:@"changeMedReText"//消息名
                                              object:nil];//注意是nil

}

-(void)changeText
{
    _medicineNameTextField.text = [ReminderFunc getMedName];
}


-(void)remindDateChangedButtonPressed{
    
    //NSLog(@"remindDateChangedButtonPressed");
    [ReminderFunc medTimeChangeButtonPressed:self];
}

-(void)dosageChangedButtonPressed{

    //NSLog(@"dosageChangedButtonPressed");
    [ReminderFunc medDosageChangeButtonPressed:self];
}

-(void)unitTypeChangedButtonPressed{
    
    //NSLog(@"unitTypeChangedButtonPressed");
    [ReminderFunc medUnitChangeButtonPressed:self];
}


-(void)saveButtonPressed{
    
    //进入add页面时初始化temp数组，否则数组无法存值
    //[ReminderFunc initTempMedReminderCellArray];
    UIViewController *rootViewController;
    UIAlertController *alertController;
    UIAlertAction *okAction;
    Boolean isConact;
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    //验证是否全填完信息
    isConact = [ReminderFunc verifyMedDataContact:_medicineNameTextField.text];
    if (isConact == NO) {
        alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"尚有信息未填写" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            if ([ReminderFunc medEditStatus] == NO) {
                [ReminderFunc saveNewMedReminderCellArray:_medicineNameTextField.text];
            } else {
                [ReminderFunc saveEditMedReminderCellArray:_medicineNameTextField.text];
            }
            //[ReminderFunc saveNewMedReminderCellArray:_medicineNameTextField.text];
            [ReminderFunc moveBackFromAddView:self.view moveBackToView:self.view.superview];
        
        }];
        [alertController addAction:okAction];
        //用root不用self是防止warning: detach..
        [rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
    //NSLog(@"text:%@",_medicineNameTextField.text);
}


-(void)returnButtonPressed{
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


@end
