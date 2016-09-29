//
//  AddSportsReminderViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/15.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "AddSportsReminderViewController.h"
#import "GlobalFunc.h"
#import "TriangleGrayView.h"
#import "ReminderFunc.h"

@interface AddSportsReminderViewController ()

@end

@implementation AddSportsReminderViewController

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
    UIView *sportsNameView = [[UIView alloc]initWithFrame:CGRectMake(25, 115, WIDTH-50, 50)];
    sportsNameView.backgroundColor = [UIColor whiteColor];
    sportsNameView.layer.cornerRadius = 10.0;
    sportsNameView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:sportsNameView];
    
    UILabel *sportsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 122, 90, 40)];
    sportsNameLabel.backgroundColor = [UIColor clearColor];
    sportsNameLabel.opaque = NO;
    sportsNameLabel.textColor = [UIColor blackColor];
    sportsNameLabel.font = [UIFont systemFontOfSize:19];
    sportsNameLabel.textAlignment = NSTextAlignmentLeft;
    sportsNameLabel.text = @"运动名称 :";
    [self.view addSubview:sportsNameLabel];
    
    _sportsNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(140, 123, 195, 40)];
    _sportsNameTextField.backgroundColor = [UIColor clearColor];
    _sportsNameTextField.textColor = [UIColor grayColor];
    _sportsNameTextField.placeholder = @"请输入运动名称";
    _sportsNameTextField.keyboardType = UIKeyboardTypeDefault;
    _sportsNameTextField.returnKeyType = UIReturnKeyDone;
    _sportsNameTextField.textAlignment = NSTextAlignmentCenter;
    _sportsNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _sportsNameTextField.delegate = self;
    [self.view addSubview:_sportsNameTextField];
    
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
    UIView *exerciseTimeView = [[UIView alloc]initWithFrame:CGRectMake(25, 255, WIDTH-50, 50)];
    exerciseTimeView.backgroundColor = [UIColor whiteColor];
    exerciseTimeView.layer.cornerRadius = 10.0;
    exerciseTimeView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:exerciseTimeView];
    
    UILabel *exerciseTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 262, 90, 40)];
    exerciseTimeLabel.textColor = [UIColor blackColor];
    exerciseTimeLabel.font = [UIFont systemFontOfSize:19];
    exerciseTimeLabel.textAlignment = NSTextAlignmentCenter;
    exerciseTimeLabel.text = @"运动时间 :";
    [self.view addSubview:exerciseTimeLabel];
    
    UIButton *exerciseTimeChangedButton;
    exerciseTimeChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [exerciseTimeChangedButton addTarget:self action:@selector(exerciseTimeChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    exerciseTimeChangedButton.frame = CGRectMake(140, 263, 196, 40);
    [self.view addSubview:exerciseTimeChangedButton];
    
    
    //*****************************************************
    UIButton *saveButton;
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    saveButton.frame = CGRectMake(25, 350, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    //[saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    [saveButton.layer setBackgroundColor:colorref];//边框颜色
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.view addSubview:saveButton];
    
    
    //初始化页面数据
    //[ReminderFunc initAddMedLabels:self.view];
    [ReminderFunc initAddSportsLabels:self.view];
    
    //更新textfield.text
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(changeText)
                                                name:@"changeSportsReText"//消息名
                                              object:nil];//注意是nil
    
}

-(void)changeText
{
    //_medicineNameTextField.text = [ReminderFunc getMedName];
    _sportsNameTextField.text = [ReminderFunc getSportsName];
}

-(void)remindDateChangedButtonPressed
{
    //NSLog(@"remindDateChangedButtonPressed");
    //[ReminderFunc medTimeChangeButtonPressed:self];
    [ReminderFunc sportsTimeChangeButtonPressed:self];
}

-(void)exerciseTimeChangedButtonPressed
{
    [ReminderFunc exerciseTimeChangeButtonPressed:self];
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
    //isConact = [ReminderFunc verifyMedDataContact:_sportsNameTextField.text];
    isConact = [ReminderFunc verifySportsDataContact:_sportsNameTextField.text];
    if (isConact == NO) {
        alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"尚有信息未填写" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            if ([ReminderFunc sportsEditStatus] == NO) {
                //[ReminderFunc saveNewMedReminderCellArray:_sportsNameTextField.text];
                [ReminderFunc saveNewSportsReminderCellArray:_sportsNameTextField.text];
            } else {
                //[ReminderFunc saveEditMedReminderCellArray:_sportsNameTextField.text];
                [ReminderFunc saveEditSportsReminderCellArray:_sportsNameTextField.text];
            }
            //[ReminderFunc saveNewMedReminderCellArray:_medicineNameTextField.text];
            [ReminderFunc moveBackFromAddView:self.view moveBackToView:self.view.superview];
            
        }];
        [alertController addAction:okAction];
        //用root不用self是防止warning: detach..
        [rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
