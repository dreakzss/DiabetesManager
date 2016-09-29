//
//  LoginViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/7/30.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "LoginViewController.h"
#import "GlobalFunc.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    
    UIButton *logoButton;
    logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logoButton.adjustsImageWhenHighlighted = NO;
    [logoButton setImage:[UIImage imageNamed:@"Doctor.png"] forState:UIControlStateNormal];
    [logoButton addTarget:self action:@selector(goRegisterButtonPressed) forControlEvents:UIControlEventTouchDown];
    logoButton.frame = CGRectMake(145, 100, 80, 80);
    logoButton.enabled = NO;
    [self.view addSubview:logoButton];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 200, 200, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor blackColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"血糖小管家";
    [self.view addSubview:topBarTitleLabel];
    topBarTitleLabel.font = [UIFont fontWithName:@"QXyingbixing" size:26];
    
    UIView *dbpFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 265, WIDTH-50, 50)];
    dbpFieldView.backgroundColor = [UIColor whiteColor];
    dbpFieldView.layer.cornerRadius = 10.0;
    dbpFieldView.layer.masksToBounds = NO; //防止子元素溢出
    
    [self.view addSubview:dbpFieldView];

    UILabel *dbpTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(23, 270, 90, 40)];
    dbpTextLabel.textColor = [UIColor blackColor];
    dbpTextLabel.font = [UIFont systemFontOfSize:17];
    dbpTextLabel.textAlignment = NSTextAlignmentCenter;
    dbpTextLabel.text = @"用户名";
    [self.view addSubview:dbpTextLabel];
    
    UITextField *dbpTextField = [[UITextField alloc]initWithFrame:CGRectMake(180, 270, 150, 40)];
    dbpTextField.backgroundColor = [UIColor whiteColor];
    dbpTextField.placeholder = @"请输入用户名";
    dbpTextField.keyboardType = UIKeyboardTypeDecimalPad;
    dbpTextField.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:dbpTextField];
    
    UIView *dbpFieldView1 = [[UIView alloc]initWithFrame:CGRectMake(25, 335, WIDTH-50, 50)];
    dbpFieldView1.backgroundColor = [UIColor whiteColor];
    dbpFieldView1.layer.cornerRadius = 10.0;
    dbpFieldView1.layer.masksToBounds = NO; //防止子元素溢出
    
    [self.view addSubview:dbpFieldView1];

    UILabel *dbpTextLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(23, 340, 90, 40)];
    dbpTextLabel1.textColor = [UIColor blackColor];
    dbpTextLabel1.font = [UIFont systemFontOfSize:17];
    dbpTextLabel1.textAlignment = NSTextAlignmentCenter;
    dbpTextLabel1.text = @"密码";
    [self.view addSubview:dbpTextLabel1];
    
    UITextField *dbpTextField1 = [[UITextField alloc]initWithFrame:CGRectMake(180, 340, 150, 40)];
    dbpTextField1.backgroundColor = [UIColor whiteColor];
    dbpTextField1.placeholder = @"请输入6~10位密码";
    dbpTextField1.keyboardType = UIKeyboardTypeDecimalPad;
    dbpTextField1.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:dbpTextField1];
    
    
    UILabel *gpRegisterLable = [[UILabel alloc] initWithFrame:CGRectMake(260, 385, 90, 40)];
    gpRegisterLable.textColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    gpRegisterLable.font = [UIFont systemFontOfSize:16];
    gpRegisterLable.textAlignment = NSTextAlignmentCenter;
    gpRegisterLable.text = @"注册新用户";
    [self.view addSubview:gpRegisterLable];
    UIButton *goRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goRegisterButton addTarget:self action:@selector(goRegisterButtonPressed) forControlEvents:UIControlEventTouchDown];
    goRegisterButton.frame = CGRectMake(260, 385, 90, 40);
    [self.view addSubview:goRegisterButton];
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton addTarget:self action:@selector(loginButtonPressed) forControlEvents:UIControlEventTouchDown];
    //saveButton.frame = CGRectMake(25, 458, WIDTH-50, 40);
    loginButton.frame = CGRectMake(25, 430, WIDTH-50, 40);
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10.0];
    [loginButton.layer setBorderWidth:1.0];
    CGColorRef colorref1 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    CGColorRef colorref2 = [GlobalFunc colorFromHexRGB:@"D3D3D3"].CGColor;
    [loginButton.layer setBackgroundColor:colorref1];//背景颜色
    [loginButton.layer setBorderColor:colorref2];//边框颜色
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    
}

-(void)loginButtonPressed
{
    [self.view.superview removeFromSuperview];
    [self.view removeFromSuperview];
}

-(void)goRegisterButtonPressed
{
    registerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    registerViewController = [[RegisterViewController alloc]init];
    [registerView addSubview:registerViewController.view];
    [self.view addSubview:registerView];
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
