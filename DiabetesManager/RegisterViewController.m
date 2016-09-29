//
//  RegisterViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/7/30.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "RegisterViewController.h"
#import "GlobalFunc.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    
    UIButton *logoButton;
    logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logoButton.adjustsImageWhenHighlighted = NO;
    [logoButton setImage:[UIImage imageNamed:@"Doctor.png"] forState:UIControlStateNormal];
    [logoButton addTarget:self action:@selector(registerButtonPressed) forControlEvents:UIControlEventTouchDown];
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
    
    UIView *dbpFieldView1 = [[UIView alloc]initWithFrame:CGRectMake(25, 325, WIDTH-50, 50)];
    dbpFieldView1.backgroundColor = [UIColor whiteColor];
    dbpFieldView1.layer.cornerRadius = 10.0;
    dbpFieldView1.layer.masksToBounds = NO; //防止子元素溢出
    
    [self.view addSubview:dbpFieldView1];
    
    UILabel *dbpTextLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(23, 330, 90, 40)];
    dbpTextLabel1.textColor = [UIColor blackColor];
    dbpTextLabel1.font = [UIFont systemFontOfSize:17];
    dbpTextLabel1.textAlignment = NSTextAlignmentCenter;
    dbpTextLabel1.text = @"密码";
    [self.view addSubview:dbpTextLabel1];
    
    UITextField *dbpTextField1 = [[UITextField alloc]initWithFrame:CGRectMake(180, 330, 150, 40)];
    dbpTextField1.backgroundColor = [UIColor whiteColor];
    dbpTextField1.placeholder = @"请输入6~10位密码";
    dbpTextField1.keyboardType = UIKeyboardTypeDecimalPad;
    dbpTextField1.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:dbpTextField1];
    
    UIView *dbpFieldView3 = [[UIView alloc]initWithFrame:CGRectMake(25, 385, WIDTH-50, 50)];
    dbpFieldView3.backgroundColor = [UIColor whiteColor];
    dbpFieldView3.layer.cornerRadius = 10.0;
    dbpFieldView3.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:dbpFieldView3];

    UILabel *dbpTextLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 390, 90, 40)];
    dbpTextLabel3.textColor = [UIColor blackColor];
    dbpTextLabel3.font = [UIFont systemFontOfSize:17];
    dbpTextLabel3.textAlignment = NSTextAlignmentCenter;
    dbpTextLabel3.text = @"密码确认";
    [self.view addSubview:dbpTextLabel3];
     
    UITextField *dbpTextField3 = [[UITextField alloc]initWithFrame:CGRectMake(180, 390, 150, 40)];
    dbpTextField3.backgroundColor = [UIColor whiteColor];
    dbpTextField3.placeholder = @"请确认密码";
    dbpTextField3.keyboardType = UIKeyboardTypeDecimalPad;
    dbpTextField3.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:dbpTextField3];
    
    UILabel *goLoginLable = [[UILabel alloc] initWithFrame:CGRectMake(265, 435, 90, 40)];
    goLoginLable.textColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    goLoginLable.font = [UIFont systemFontOfSize:16];
    goLoginLable.textAlignment = NSTextAlignmentCenter;
    goLoginLable.text = @"直接登录";
    [self.view addSubview:goLoginLable];
    UIButton *goLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goLoginButton addTarget:self action:@selector(goLoginButtonPressed) forControlEvents:UIControlEventTouchDown];
    goLoginButton.frame = CGRectMake(265, 435, 90, 40);
    [self.view addSubview:goLoginButton];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton addTarget:self action:@selector(registerButtonPressed) forControlEvents:UIControlEventTouchDown];
    registerButton.frame = CGRectMake(25, 480, WIDTH-50, 40);
    [registerButton.layer setMasksToBounds:YES];
    [registerButton.layer setCornerRadius:10.0];
    [registerButton.layer setBorderWidth:1.0];
    CGColorRef colorref1 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    CGColorRef colorref2 = [GlobalFunc colorFromHexRGB:@"D3D3D3"].CGColor;
    [registerButton.layer setBackgroundColor:colorref1];//背景颜色
    [registerButton.layer setBorderColor:colorref2];//边框颜色
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:registerButton];
}


-(void)registerButtonPressed
{
    [self.view.superview.superview.superview removeFromSuperview];
    [self.view.superview.superview removeFromSuperview];
    [self.view.superview removeFromSuperview];
    [self.view removeFromSuperview];
}

-(void)goLoginButtonPressed
{
    [self.view.superview removeFromSuperview];
    [self.view removeFromSuperview];
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
