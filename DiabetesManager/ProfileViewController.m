//
//  ProfileViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/5.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "ProfileViewController.h"
#import "GlobalFunc.h"
#import "TriangleGrayView.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(87.5, 30, 200, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
 
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"个人信息";
    //topBarTitleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:27];
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    //height:667
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVIBARHEIGHT,375, 667)];
    scrollView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
    //scrollView.directionalLockEnabled = YES; //只能一个方向滑动
    scrollView.pagingEnabled = NO; //是否翻页
    scrollView.scrollsToTop = YES;
    scrollView.bounces = YES;
    scrollView.showsVerticalScrollIndicator = YES; //垂直方向的滚动指示
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;//滚动指示的风格
    scrollView.showsHorizontalScrollIndicator = NO;//水平方向的滚动指示
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(375, 1000);
    [self.view addSubview:scrollView];
    
    //fontName:QXyingbixing
    UILabel *backLogoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -50, 375, 40)];
    backLogoLabel.textColor = [UIColor blackColor];
    //backLogoLabel.font = [UIFont systemFontOfSize:14];
    backLogoLabel.font = [UIFont fontWithName:@"QXyingbixing" size:20];
    backLogoLabel.textAlignment = NSTextAlignmentCenter;
    backLogoLabel.text = @"血糖小帮手";
    [scrollView addSubview:backLogoLabel];
    
    // ***************************************************
    // Data Area
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 1200)];
    backView.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    [scrollView addSubview:backView];
    
    //*****************************************************
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    //flexBarButton占位，否则donebutton在最左端,此处target必须是view
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self.view action:@selector(endEditing:)];
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 35, 90, 40)];
    userNameLabel.textColor = [UIColor blackColor];
    userNameLabel.font = [UIFont systemFontOfSize:19];
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    userNameLabel.text = @"姓名 ：";
    [backView addSubview:userNameLabel];
    
    usernameTextField = [[UITextField alloc]initWithFrame:CGRectMake(123, 35, 200, 40)];
    usernameTextField.backgroundColor = [UIColor clearColor];
    usernameTextField.delegate = self;
    //usernameTextField.text = sharedManagerPF.profileUsernameString;
    usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //usernameTextField.clearButtonMode = UITextFieldViewModeAlways;
    usernameTextField.keyboardType = UIKeyboardTypeDefault;
    usernameTextField.textAlignment = NSTextAlignmentCenter;
    usernameTextField.inputAccessoryView = keyboardToolbar;
    usernameTextField.clearsOnBeginEditing = YES;
    usernameTextField.enabled = NO;
    usernameTextField.textColor = [UIColor grayColor];
    [backView addSubview:usernameTextField];
    
    UIView *separatorX1 = [[UIView alloc]initWithFrame:CGRectMake(123, 67, 215, 1)];
    separatorX1.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX1];
    
    // sp: 50
    phoneNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 85, 90, 40)];
    phoneNumLabel.textColor = [UIColor blackColor];
    phoneNumLabel.font = [UIFont systemFontOfSize:19];
    phoneNumLabel.textAlignment = NSTextAlignmentCenter;
    phoneNumLabel.text = @"手机 ：";
    [backView addSubview:phoneNumLabel];
    
    phoneNumTextField = [[UITextField alloc]initWithFrame:CGRectMake(123, 85, 200, 40)];
    phoneNumTextField.backgroundColor = [UIColor clearColor];
    //phoneNumTextField.text = sharedManagerPF.profilePhoneNumString;
    phoneNumTextField.keyboardType = UIKeyboardTypeDecimalPad;
    phoneNumTextField.textAlignment = NSTextAlignmentCenter;
    phoneNumTextField.delegate = self;
    phoneNumTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneNumTextField.inputAccessoryView = keyboardToolbar;
    phoneNumTextField.clearsOnBeginEditing = YES;
    phoneNumTextField.enabled = NO;
    phoneNumTextField.textColor = [UIColor grayColor];
    [backView addSubview:phoneNumTextField];
    
    UIView *separatorX2 = [[UIView alloc]initWithFrame:CGRectMake(123, 117, 215, 1)];
    separatorX2.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX2];
    
    //*****************************************************
    UILabel *genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 135, 90, 40)];
    genderLabel.textColor = [UIColor blackColor];
    genderLabel.font = [UIFont systemFontOfSize:19];
    genderLabel.textAlignment = NSTextAlignmentCenter;
    genderLabel.text = @"性别 ：";
    [backView addSubview:genderLabel];
    
    UIView *separatorX3 = [[UIView alloc]initWithFrame:CGRectMake(123, 167, 215, 1)];
    separatorX3.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX3];
    
    //*****************************************************
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 185, 90, 40)];
    ageLabel.textColor = [UIColor blackColor];
    ageLabel.font = [UIFont systemFontOfSize:19];
    ageLabel.textAlignment = NSTextAlignmentCenter;
    ageLabel.text = @"年龄 ：";
    [backView addSubview:ageLabel];

    
    UIView *separatorX4 = [[UIView alloc]initWithFrame:CGRectMake(123, 217, 215, 1)];
    separatorX4.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX4];
    
    //*****************************************************
    UILabel *waistlineLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 235, 90, 40)];
    waistlineLabel.textColor = [UIColor blackColor];
    waistlineLabel.font = [UIFont systemFontOfSize:19];
    waistlineLabel.textAlignment = NSTextAlignmentCenter;
    waistlineLabel.text = @"腰围 ：";
    [backView addSubview:waistlineLabel];
    
    UIView *separatorX5 = [[UIView alloc]initWithFrame:CGRectMake(123, 267, 215, 1)];
    separatorX5.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX5];
    
    //*****************************************************
    UILabel *heightLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 285, 90, 40)];
    heightLabel.textColor = [UIColor blackColor];
    heightLabel.font = [UIFont systemFontOfSize:19];
    heightLabel.textAlignment = NSTextAlignmentCenter;
    heightLabel.text = @"身高 ：";
    [backView addSubview:heightLabel];
    
    UIView *separatorX6 = [[UIView alloc]initWithFrame:CGRectMake(123, 317, 215, 1)];
    separatorX6.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX6];
    
    //*****************************************************
    UILabel *weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 335, 90, 40)];
    weightLabel.textColor = [UIColor blackColor];
    weightLabel.font = [UIFont systemFontOfSize:19];
    weightLabel.textAlignment = NSTextAlignmentCenter;
    weightLabel.text = @"体重 ：";
    [backView addSubview:weightLabel];
    
    UIView *separatorX7 = [[UIView alloc]initWithFrame:CGRectMake(123, 367, 215, 1)];
    separatorX7.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX7];
    
    //*****************************************************
    UILabel *bmiLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 385, 110, 40)];
    bmiLabel.textColor = [UIColor blackColor];
    bmiLabel.font = [UIFont systemFontOfSize:19];
    bmiLabel.textAlignment = NSTextAlignmentCenter;
    bmiLabel.text = @"体重指数 ：";
    [backView addSubview:bmiLabel];
    
    
    UIView *separatorX8 = [[UIView alloc]initWithFrame:CGRectMake(123, 417, 215, 1)];
    separatorX8.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX8];
    
    bmiValueChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bmiValueChangedButton addTarget:self action:@selector(bmiChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    bmiValueChangedButton.frame = CGRectMake(123, 385, 190, 40);
    [backView addSubview:bmiValueChangedButton];
    
    //*****************************************************
    
    UILabel *relativesSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 435, 110, 40)];
    relativesSituationLabel.textColor = [UIColor blackColor];
    relativesSituationLabel.font = [UIFont systemFontOfSize:19];
    relativesSituationLabel.textAlignment = NSTextAlignmentCenter;
    relativesSituationLabel.text = @"亲属状况 ：";
    [backView addSubview:relativesSituationLabel];
    
    UIView *separatorX9 = [[UIView alloc]initWithFrame:CGRectMake(123, 467, 215, 1)];
    separatorX9.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX9];
    
    //*****************************************************
    UILabel *occupationSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 485, 110, 40)];
    occupationSituationLabel.textColor = [UIColor blackColor];
    occupationSituationLabel.font = [UIFont systemFontOfSize:19];
    occupationSituationLabel.textAlignment = NSTextAlignmentCenter;
    occupationSituationLabel.text = @"职业状况 ：";
    [backView addSubview:occupationSituationLabel];
    
    UIView *separatorX10 = [[UIView alloc]initWithFrame:CGRectMake(123, 517, 215, 1)];
    separatorX10.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX10];
    
    //*****************************************************
    UILabel *sportsSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 535, 110, 40)];
    sportsSituationLabel.textColor = [UIColor blackColor];
    sportsSituationLabel.font = [UIFont systemFontOfSize:19];
    sportsSituationLabel.textAlignment = NSTextAlignmentCenter;
    sportsSituationLabel.text = @"运动状况 ：";
    [backView addSubview:sportsSituationLabel];
    
    UIView *separatorX11 = [[UIView alloc]initWithFrame:CGRectMake(123, 567, 215, 1)];
    separatorX11.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX11];
    
    //*****************************************************
    UILabel *meatSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 585, 110, 40)];
    meatSituationLabel.textColor = [UIColor blackColor];
    meatSituationLabel.font = [UIFont systemFontOfSize:19];
    meatSituationLabel.textAlignment = NSTextAlignmentCenter;
    meatSituationLabel.text = @"肉类食品 ：";
    [backView addSubview:meatSituationLabel];
    
    UIView *separatorX12 = [[UIView alloc]initWithFrame:CGRectMake(123, 617, 215, 1)];
    separatorX12.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX12];
    
    //*****************************************************
    UILabel *fruitSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 635, 110, 40)];
    fruitSituationLabel.textColor = [UIColor blackColor];
    fruitSituationLabel.font = [UIFont systemFontOfSize:19];
    fruitSituationLabel.textAlignment = NSTextAlignmentCenter;
    fruitSituationLabel.text = @"蔬菜水果 ：";
    [backView addSubview:fruitSituationLabel];

    UIView *separatorX13 = [[UIView alloc]initWithFrame:CGRectMake(123, 667, 215, 1)];
    separatorX13.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX13];
    
    //*****************************************************
    UILabel *drinkSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 685, 110, 40)];
    drinkSituationLabel.textColor = [UIColor blackColor];
    drinkSituationLabel.font = [UIFont systemFontOfSize:19];
    drinkSituationLabel.textAlignment = NSTextAlignmentCenter;
    drinkSituationLabel.text = @"饮酒状况 ：";
    [backView addSubview:drinkSituationLabel];
    
    UIView *separatorX14 = [[UIView alloc]initWithFrame:CGRectMake(123, 717, 215, 1)];
    separatorX14.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX14];
    
    //*****************************************************
    UILabel *smokeSituationLabel = [[UILabel alloc] initWithFrame:CGRectMake(21, 735, 110, 40)];
    smokeSituationLabel.textColor = [UIColor blackColor];
    smokeSituationLabel.font = [UIFont systemFontOfSize:19];
    smokeSituationLabel.textAlignment = NSTextAlignmentCenter;
    smokeSituationLabel.text = @"吸烟状况 ：";
    [backView addSubview:smokeSituationLabel];
    
    UIView *separatorX15 = [[UIView alloc]initWithFrame:CGRectMake(123, 767, 215, 1)];
    separatorX15.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    [backView addSubview:separatorX15];
    
    //***********************************************
    
    [ProfileFunc initProfileElements:backView];
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    usernameTextField.text = sharedManagerPF.profileUsernameString;
    phoneNumTextField.text = sharedManagerPF.profilePhoneNumString;
    
    //设置按钮初始位置
    offSet = 500;
    
    [self addChangeButton];
    
}

- (void)addSaveButton
{
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    saveButton.frame = CGRectMake(25, offSet, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    [saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref1 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    CGColorRef colorref2 = [GlobalFunc colorFromHexRGB:@"D3D3D3"].CGColor;
    [saveButton.layer setBackgroundColor:colorref1];//背景颜色
    [saveButton.layer setBorderColor:colorref2];//边框颜色
    [saveButton setTitle:@"保存信息" forState:UIControlStateNormal];
    [backView addSubview:saveButton];
}

-(void)addChangeButton
{
    changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeButton addTarget:self action:@selector(changeButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    changeButton.frame = CGRectMake(25, offSet, WIDTH-50, 40);
    [changeButton.layer setMasksToBounds:YES];
    [changeButton.layer setCornerRadius:10.0];
    [changeButton.layer setBorderWidth:1.0];
    CGColorRef colorref1 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    CGColorRef colorref2 = [GlobalFunc colorFromHexRGB:@"D3D3D3"].CGColor;
    [changeButton.layer setBackgroundColor:colorref1];//背景颜色
    [changeButton.layer setBorderColor:colorref2];//边框颜色
    [changeButton setTitle:@"更改信息" forState:UIControlStateNormal];
    [backView addSubview:changeButton];

}

- (void)scrollViewDidScroll:(UIScrollView *)localScrollView;
{
    //NSLog(@"ContentOffset  x is  %f,yis %f",localScrollView.contentOffset.x,localScrollView.contentOffset.y);
    offSet = localScrollView.contentOffset.y;
    offSet = offSet + 500;
    if (offSet > 1000) {
        saveButton.frame = CGRectMake(25, 800, WIDTH-50, 40);
        changeButton.frame = CGRectMake(25, 800, WIDTH-50, 40);
    } else {
        saveButton.frame = CGRectMake(25, offSet, WIDTH-50, 40);
        changeButton.frame = CGRectMake(25, offSet, WIDTH-50, 40);
    }
}

#pragma mark - ButtonPressed
-(void)returnButtonPressed{
    
    //[GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    [ProfileFunc moveBackFromProfile:self.view moveBackToView:self.view.superview];
    
}

//刚进入profile页面时所有信息为只读状态，点击更改信息后在页面上添加button
//使页面上的button有效，供数据修改
- (void)changeButtonPressed
{
    usernameTextField.enabled = YES;
    usernameTextField.textColor = [UIColor blackColor];
    phoneNumTextField.enabled = YES;
    phoneNumTextField.textColor = [UIColor blackColor];
    
    
    [changeButton removeFromSuperview];
    [ProfileFunc changeProfileElements:backView];
    
    genderChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [genderChangedButton addTarget:self action:@selector(genderChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    genderChangedButton.frame = CGRectMake(123, 135, 190, 40);
    
    ageChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [ageChangedButton addTarget:self action:@selector(ageChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    ageChangedButton.adjustsImageWhenHighlighted = YES;
    ageChangedButton.frame = CGRectMake(123, 185, 190, 40);
    
    waistlineChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [waistlineChangedButton addTarget:self action:@selector(waistlineChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    waistlineChangedButton.frame = CGRectMake(123, 235, 190, 40);
    
    heightValueChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [heightValueChangedButton addTarget:self action:@selector(heightChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    heightValueChangedButton.frame = CGRectMake(123, 285, 190, 40);
    
    weightValueChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [weightValueChangedButton addTarget:self action:@selector(weightChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    weightValueChangedButton.frame = CGRectMake(123, 335, 190, 40);
    
    //bmi是在输入身高，体重后点击保存自动计算的，所以保持灰色三角提示，按钮不随保存按钮状态改变而改变，计算方式查savecontent
    //bmiValueChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //[bmiValueChangedButton addTarget:self action:@selector(bmiChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    //bmiValueChangedButton.frame = CGRectMake(123, 385, 190, 40);
    
    relativesSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [relativesSituationChangedButton addTarget:self action:@selector(relativesSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    relativesSituationChangedButton.frame = CGRectMake(123, 435, 190, 40);
    
    occupationSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [occupationSituationChangedButton addTarget:self action:@selector(occupationSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    occupationSituationChangedButton.frame = CGRectMake(123, 485, 190, 40);
    
    sportsSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sportsSituationChangedButton addTarget:self action:@selector(sportsSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    sportsSituationChangedButton.frame = CGRectMake(123, 535, 190, 40);
    
    meatSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [meatSituationChangedButton addTarget:self action:@selector(meatSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    meatSituationChangedButton.frame = CGRectMake(123, 585, 190, 40);
    
    fruitSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fruitSituationChangedButton addTarget:self action:@selector(fruitSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    fruitSituationChangedButton.frame = CGRectMake(123, 635, 190, 40);
    
    drinkSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [drinkSituationChangedButton addTarget:self action:@selector(drinkSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    drinkSituationChangedButton.frame = CGRectMake(123, 685, 160, 40);
    
    smokeSituationChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [smokeSituationChangedButton addTarget:self action:@selector(smokeSituationChangedButtonPressed) forControlEvents:UIControlEventTouchDown];
    smokeSituationChangedButton.frame = CGRectMake(123, 735, 160, 40);
     
    [backView addSubview:genderChangedButton];
    [backView addSubview:ageChangedButton];
    [backView addSubview:waistlineChangedButton];
    [backView addSubview:heightValueChangedButton];
    [backView addSubview:weightValueChangedButton];
    //[backView addSubview:bmiValueChangedButton];
    [backView addSubview:relativesSituationChangedButton];
    [backView addSubview:occupationSituationChangedButton];
    [backView addSubview:sportsSituationChangedButton];
    [backView addSubview:meatSituationChangedButton];
    [backView addSubview:fruitSituationChangedButton];
    [backView addSubview:drinkSituationChangedButton];
    [backView addSubview:smokeSituationChangedButton];
    
    [self addSaveButton];
}
//TODO: 点击按钮背景色发生变化

//使页面上的button无效，页面信息变成只读状态，更改Global单例中saved的值
-(void)saveButtonPressed{
    
    usernameTextField.enabled = NO;
    usernameTextField.textColor = [UIColor grayColor];
    phoneNumTextField.enabled = NO;
    phoneNumTextField.textColor = [UIColor grayColor];
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    sharedManagerPF.profileUsernameString = usernameTextField.text;
    sharedManagerPF.profilePhoneNumString = phoneNumTextField.text;
    
    [saveButton removeFromSuperview];
    
    [genderChangedButton removeFromSuperview];
    [ageChangedButton removeFromSuperview];
    [waistlineChangedButton removeFromSuperview];
    [heightValueChangedButton removeFromSuperview];
    [weightValueChangedButton removeFromSuperview];
    //[bmiValueChangedButton removeFromSuperview];
    [relativesSituationChangedButton removeFromSuperview];
    [occupationSituationChangedButton removeFromSuperview];
    [sportsSituationChangedButton removeFromSuperview];
    [meatSituationChangedButton removeFromSuperview];
    [fruitSituationChangedButton removeFromSuperview];
    [drinkSituationChangedButton removeFromSuperview];
    [smokeSituationChangedButton removeFromSuperview];
    [glucoseValueChangedButton removeFromSuperview];
    [bloodPressureValueChangedButton removeFromSuperview];
    [cholesterolValueChangedButton removeFromSuperview];
    [triglycerideValueChangedButton removeFromSuperview];
    
    [ProfileFunc saveProfileElements:backView];
    [self addChangeButton];  //使更改信息按钮在三角页面控件之上
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"个人信息" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    /*
    self.view.window.root... presentViewController而不是self presentViewController
    是为了避免Warning :-Presenting view controllers on detached view controllers is discouraged
     */
    [self.view.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    
}

-(void)genderChangedButtonPressed{
    
    [ProfileFunc genderChangedButtonPressed];
}

-(void)ageChangedButtonPressed{

    [ProfileFunc ageChangedButtonPressed:self];
}

-(void)waistlineChangedButtonPressed{

    [ProfileFunc waistlineChangedButtonPressed:self];
}

-(void)heightChangedButtonPressed{
    
    [ProfileFunc heightChangedButtonPressed:self];
}

-(void)weightChangedButtonPressed{
    
    [ProfileFunc weightChangedButtonPressed:self];
}

-(void)bmiChangedButtonPressed{

    [ProfileFunc bmiChangedButtonPressed];
}

-(void)relativesSituationChangedButtonPressed{

    [ProfileFunc relativesSituationChangedButtonPressed];
}

-(void)occupationSituationChangedButtonPressed{
    
    [ProfileFunc occupationSituationChangedButtonPressed];
}

-(void)sportsSituationChangedButtonPressed{
    
    [ProfileFunc sportsSituationChangedButtonPressed];
}

-(void)meatSituationChangedButtonPressed{

    [ProfileFunc meatSituationChangedButtonPressed];
}

-(void)fruitSituationChangedButtonPressed{

    [ProfileFunc fruitSituationChangedButtonPressed];
}

-(void)drinkSituationChangedButtonPressed{
    
    [ProfileFunc drinkSituationChangedButtonPressed];
}

-(void)smokeSituationChangedButtonPressed{
    
    [ProfileFunc smokeSituationChangedButtonPressed];
}

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
-(void)forwardButtonPressed{
    
    AddDietsRecordsView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT)];
    addDietsRecordsViewController = [[AddDietsRecordsViewController alloc] init];
    [AddDietsRecordsView addSubview:addDietsRecordsViewController.view];
    [GlobalFunc moveForwardFromView:self.view moveForwardToView:AddDietsRecordsView];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
