//
//  EvaluteFunc.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "EvaluteFunc.h"

@implementation EvaluteFunc

static NSString *evaluteGenderString;
static NSString *evaluteAgeString;
static NSString *evaluteWaistlineString;
static NSString *evaluteHeightString;
static NSString *evaluteWeightString;
static NSString *evaluteRelativesString;
static NSString *evaluteOccupationString;
static NSString *evaluteSportsString;
static NSString *evaluteMeatString;
static NSString *evaluteFruitString;
static NSString *evaluteDrinkString;
static NSString *evaluteSmokeString;

static UILabel *questionNumLabel;
static UIViewController *evaluteViewController;
static UIView *evaluteView;
static int questionNum;
+ (void)addEvaluteView:(UIViewController *)viewController
{
    evaluteViewController = viewController;
    evaluteView = viewController.view;
    
    UIView *separatorXL1 = [[UIView alloc]initWithFrame:CGRectMake(30, 120, 110, 1)];
    separatorXL1.backgroundColor = [GlobalFunc colorFromHexRGB:@"A9A9A9"];
    [evaluteView addSubview:separatorXL1];
    
    UIView *separatorXL2 = [[UIView alloc]initWithFrame:CGRectMake(25, 116, 20, 1)];
    separatorXL2.backgroundColor = [GlobalFunc colorFromHexRGB:@"808080"];
    [evaluteView addSubview:separatorXL2];
    
    UIView *separatorXL3 = [[UIView alloc]initWithFrame:CGRectMake(22, 112, 15, 1)];
    separatorXL3.backgroundColor = [GlobalFunc colorFromHexRGB:@"808080"];
    [evaluteView addSubview:separatorXL3];
    
    UIView *separatorXR1 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH - 30 - 110, 120, 110, 1)];
    separatorXR1.backgroundColor = [GlobalFunc colorFromHexRGB:@"A9A9A9"];
    [evaluteView addSubview:separatorXR1];
    
    UIView *separatorXR2 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH - 45, 116, 20, 1)];
    separatorXR2.backgroundColor = [GlobalFunc colorFromHexRGB:@"808080"];
    [evaluteView addSubview:separatorXR2];
    
    UIView *separatorXR3 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH - 37, 112, 15, 1)];
    separatorXR3.backgroundColor = [GlobalFunc colorFromHexRGB:@"808080"];
    [evaluteView addSubview:separatorXR3];
    
    questionNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 107, 95, 30)];
    questionNumLabel.backgroundColor = [UIColor clearColor];
    questionNumLabel.opaque = NO;
    questionNumLabel.textColor = [UIColor blackColor];
    questionNumLabel.font = [UIFont fontWithName:@"QXyingbixing" size:20];
    questionNumLabel.textAlignment = NSTextAlignmentCenter;
    questionNumLabel.text = @"准备测试";
    [evaluteView addSubview:questionNumLabel];
    
    //开始测试页面
    UIView *beginView = [[UIView alloc] initWithFrame:CGRectMake(35, 165, WIDTH - 70, 260)];
    beginView.backgroundColor = [GlobalFunc colorFromHexRGB:@"FFFAFA"];
    beginView.layer.cornerRadius = 9;
    beginView.layer.shadowColor = [UIColor grayColor].CGColor;//shadowColor阴影颜色
    beginView.layer.shadowOffset = CGSizeMake(2,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    beginView.layer.shadowOpacity = 0.4;//阴影透明度，默认0
    beginView.layer.shadowRadius = 2.5;//阴影半径，默认3
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, WIDTH - 130, 150)];
    contentLabel.text = @"    您将会得到一份为您量身定制的评估报告，在这份报告中您可以了解到您糖尿病控制的总体情况，发现您的糖尿病风险症状和病情发展趋势，更好关注身体指数的起伏变化。";
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor grayColor];
    [beginView addSubview:contentLabel];
    
    UIButton *beginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    beginButton.adjustsImageWhenHighlighted = NO;
    beginButton.frame = CGRectMake(30, 190, WIDTH - 130, 35);
    CGColorRef colorref = [UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1].CGColor;
    [beginButton.layer setBorderColor:colorref];//边框颜色
    [beginButton.layer setBorderWidth:1];
    [beginButton.layer setMasksToBounds:YES];
    [beginButton.layer setCornerRadius:10.0];
    [beginButton addTarget:self action:@selector(beginEvaluteButtonPressed) forControlEvents:UIControlEventTouchDown];
    [beginButton setTitle:@"开始测试" forState:UIControlStateNormal];
    [beginButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    [beginView addSubview:beginButton];
    
    //初始化questionNum = 0，后续加题目就更改题目数字
    questionNum = 0;
    
    [evaluteView addSubview:beginView];
    
}

static UIView *question1View;
static UIView *question2View;
static UIView *question3View;
static UIView *question4View;
static UIView *question5View;
static UIView *question6View;
static UIView *question7View;
static UIView *question8View;
static UIView *question9View;
static UIView *question10View;
static UIView *question11View;
static UIView *question12View;
static UIView *question13View;
static UIView *question14View;
static UIView *question15View;
static UIView *question16View;
static UIView *evaluteResultView;

static UIButton *question1Checkbox1;
static UIButton *question1Checkbox2;

static UIButton *question6Checkbox1;
static UIButton *question6Checkbox2;
static UIButton *question6Checkbox3;
static UIButton *question6Checkbox4;

static UIButton *question7Checkbox1;
static UIButton *question7Checkbox2;
static UIButton *question7Checkbox3;

static UIButton *question8Checkbox1;
static UIButton *question8Checkbox2;
static UIButton *question8Checkbox3;
static UIButton *question8Checkbox4;

static UIButton *question9Checkbox1;
static UIButton *question9Checkbox2;

static UIButton *question10Checkbox1;
static UIButton *question10Checkbox2;

static UIButton *question11Checkbox1;
static UIButton *question11Checkbox2;
static UIButton *question11Checkbox3;

static UIButton *question12Checkbox1;
static UIButton *question12Checkbox2;

static UIButton *question14Checkbox1;
static UIButton *question14Checkbox2;


static UITextField *ageTextField;
static UITextField *waistlineTextField;
static UITextField *heightTextField;
static UITextField *weightTextField;
static UITextField *glucoseTextField;
static UITextField *cholesterolTextField;
static UITextField *triglycerideTextField;

+ (void)beginEvaluteButtonPressed
{
    
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"测试信息会自动保存到电子档案中，是否开始？"preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"开始" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        //初始化questionNum = 0，后续加题目就更改题目数字
        //questionNum = 0;
        NSLog(@"yes");
        [EvaluteFunc initQuestionViews:questionNum];
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    //[rootViewController presentViewController:alertController animated:YES completion:nil];
    [EvaluteFunc initQuestionViews:questionNum];
}


+ (void)initQuestionViews:(int)questionNum
{
    UIButton *nextQuestionButton;
    UIButton *lastQuestionButton;
    UIButton *evaluteButton;
    
    CGColorRef colorref = [UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1].CGColor;
    
    lastQuestionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lastQuestionButton.adjustsImageWhenHighlighted = NO;
    //lastQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
    [lastQuestionButton.layer setBorderColor:colorref];//边框颜色
    [lastQuestionButton.layer setBorderWidth:1];
    [lastQuestionButton.layer setMasksToBounds:YES];
    [lastQuestionButton.layer setCornerRadius:10.0];
    [lastQuestionButton addTarget:self action:@selector(lastQuestionButtonPressed) forControlEvents:UIControlEventTouchDown];
    [lastQuestionButton setTitle:@"上一题" forState:UIControlStateNormal];
    [lastQuestionButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    
    nextQuestionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextQuestionButton.adjustsImageWhenHighlighted = NO;
    //nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
    [nextQuestionButton.layer setBorderColor:colorref];//边框颜色
    [nextQuestionButton.layer setBorderWidth:1];
    [nextQuestionButton.layer setMasksToBounds:YES];
    [nextQuestionButton.layer setCornerRadius:10.0];
    [nextQuestionButton addTarget:self action:@selector(nextQuestionButtonPressed) forControlEvents:UIControlEventTouchDown];
    [nextQuestionButton setTitle:@"下一题" forState:UIControlStateNormal];
    [nextQuestionButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    
    evaluteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    evaluteButton.adjustsImageWhenHighlighted = NO;
    //nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
    [evaluteButton.layer setBorderColor:colorref];//边框颜色
    [evaluteButton.layer setBorderWidth:1];
    [evaluteButton.layer setMasksToBounds:YES];
    [evaluteButton.layer setCornerRadius:10.0];
    [evaluteButton addTarget:self action:@selector(evaluteButtonPressed) forControlEvents:UIControlEventTouchDown];
    [evaluteButton setTitle:@"评估" forState:UIControlStateNormal];
    [evaluteButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    
    //ios原生numpad没有done和返回按钮，此处添加增强用户体验
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    //flexBarButton占位，否则donebutton在最左端,此处target必须是view
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:evaluteView action:@selector(endEditing:)];
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    
    //开始到第一页，变第一题
    questionNum = questionNum + 1;
    
    if (questionNum == 1) {
        
        questionNumLabel.text = @"第一题";
        
        question1View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"1， 请问您的性别是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        
        question1Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question1Checkbox1.frame = CGRectMake(60, 90, 23, 23);
        [question1Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question1Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question1Checkbox1 addTarget:self action:@selector(q1Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 89, 190, 27)];
        option1Label.text = @"男";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:17];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question1Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question1Checkbox2.frame = CGRectMake(60, 160, 23, 23);
        [question1Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question1Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question1Checkbox2 addTarget:self action:@selector(q1Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 159, 190, 27)];
        option2Label.text = @"女";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:17];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        [question1View addSubview:questionLabel];
        [question1View addSubview:question1Checkbox1];
        [question1View addSubview:question1Checkbox2];
        [question1View addSubview:option1Label];
        [question1View addSubview:option2Label];
        
        //*******************************************************
        [question1View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question1View];
        
    }
    else if(questionNum == 2)
    {
        questionNumLabel.text = @"第二题";
        
        question2View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"2， 请问您的年龄是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        UIView *textBackView = [[UIView alloc]initWithFrame:CGRectMake(40, 110, 230, 40)];
        textBackView.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        textBackView.layer.cornerRadius = 10.0;
        textBackView.layer.masksToBounds = NO; //防止子元素溢出
        
        ageTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 110, 210, 40)];
        ageTextField.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        ageTextField.placeholder = @"请输入，数值范围10~99";
        ageTextField.keyboardType = UIKeyboardTypeNumberPad;
        ageTextField.clearButtonMode = UITextFieldViewModeWhileEditing;  //设置×按钮
        ageTextField.clearsOnBeginEditing = YES;  //再次编辑就清空
        ageTextField.textAlignment = NSTextAlignmentCenter;
        ageTextField.inputAccessoryView = keyboardToolbar;
        ageTextField.text = evaluteAgeString;
        //ageTextField.text = nil;  //初始时设置为nill
        //不需要加，agetextfield会自动保存text值
        //点击下一题时保存到evalute值中
        //[ageTextField addTarget:self action:@selector(ageTextFieldChanged:) forControlEvents:UIControlEventEditingDidEnd];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question2View addSubview:questionLabel];
        [question2View addSubview:textBackView];
        [question2View addSubview:ageTextField];
        
        [question2View addSubview:lastQuestionButton];
        [question2View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question2View];
    }
    else if(questionNum == 3)
    {
        questionNumLabel.text = @"第三题";
        
        question3View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"3， 请问您的腰围是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 57, WIDTH - 70, 25)];
        remarkLabel.text = @"（ 单位：cm ）";
        remarkLabel.textColor = [UIColor grayColor];
        remarkLabel.textAlignment = NSTextAlignmentCenter;
        remarkLabel.font = [UIFont systemFontOfSize:12];
        
        UIView *textBackView = [[UIView alloc]initWithFrame:CGRectMake(40, 110, 230, 40)];
        textBackView.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        textBackView.layer.cornerRadius = 10.0;
        textBackView.layer.masksToBounds = NO; //防止子元素溢出
        
        waistlineTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 110, 210, 40)];
        waistlineTextField.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        waistlineTextField.placeholder = @"请输入，数值范围40~99";
        //男性：身高（cm）÷2-11（cm）,女性：身高（cm）÷2-14（cm）,±5%
        waistlineTextField.keyboardType = UIKeyboardTypeNumberPad;
        waistlineTextField.clearButtonMode = UITextFieldViewModeWhileEditing;  //设置×按钮
        waistlineTextField.clearsOnBeginEditing = YES;  //再次编辑就清空
        waistlineTextField.textAlignment = NSTextAlignmentCenter;
        waistlineTextField.inputAccessoryView = keyboardToolbar;
        waistlineTextField.text = evaluteWaistlineString;
        //waistlineTextField.text = nil;  //初始时设置为nill
        //不需要加，agetextfield会自动保存text值
        //点击下一题时保存到evalute值中
        //[ageTextField addTarget:self action:@selector(ageTextFieldChanged:) forControlEvents:UIControlEventEditingDidEnd];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question3View addSubview:questionLabel];
        [question3View addSubview:remarkLabel];
        [question3View addSubview:textBackView];
        [question3View addSubview:waistlineTextField];
        
        [question3View addSubview:lastQuestionButton];
        [question3View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question3View];
    }
    else if(questionNum == 4)
    {
        questionNumLabel.text = @"第四题";
        
        question4View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"4， 请问您的身高是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 57, WIDTH - 70, 25)];
        remarkLabel.text = @"（ 单位：cm ）";
        remarkLabel.textColor = [UIColor grayColor];
        remarkLabel.textAlignment = NSTextAlignmentCenter;
        remarkLabel.font = [UIFont systemFontOfSize:12];
        
        UIView *textBackView = [[UIView alloc]initWithFrame:CGRectMake(40, 110, 230, 40)];
        textBackView.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        textBackView.layer.cornerRadius = 10.0;
        textBackView.layer.masksToBounds = NO; //防止子元素溢出
        
        heightTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 110, 210, 40)];
        heightTextField.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        heightTextField.placeholder = @"请输入，数值范围140~199";
        heightTextField.keyboardType = UIKeyboardTypeNumberPad;
        heightTextField.clearButtonMode = UITextFieldViewModeWhileEditing;  //设置×按钮
        heightTextField.clearsOnBeginEditing = YES;  //再次编辑就清空
        heightTextField.textAlignment = NSTextAlignmentCenter;
        heightTextField.inputAccessoryView = keyboardToolbar;
        heightTextField.text = evaluteHeightString;  //初始时设置为nill
        //不需要加，agetextfield会自动保存text值
        //点击下一题时保存到evalute值中
        //[ageTextField addTarget:self action:@selector(ageTextFieldChanged:) forControlEvents:UIControlEventEditingDidEnd];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question4View addSubview:questionLabel];
        [question4View addSubview:remarkLabel];
        [question4View addSubview:textBackView];
        [question4View addSubview:heightTextField];
        
        [question4View addSubview:lastQuestionButton];
        [question4View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question4View];
    }
    else if(questionNum == 5)
    {
        questionNumLabel.text = @"第五题";
        
        question5View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"5， 请问您的体重是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 57, WIDTH - 70, 25)];
        remarkLabel.text = @"（ 单位：kg ）";
        remarkLabel.textColor = [UIColor grayColor];
        remarkLabel.textAlignment = NSTextAlignmentCenter;
        remarkLabel.font = [UIFont systemFontOfSize:12];
        
        UIView *textBackView = [[UIView alloc]initWithFrame:CGRectMake(40, 110, 230, 40)];
        textBackView.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        textBackView.layer.cornerRadius = 10.0;
        textBackView.layer.masksToBounds = NO; //防止子元素溢出
        
        weightTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 110, 210, 40)];
        weightTextField.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
        weightTextField.placeholder = @"请输入，数值范围30~99";
        weightTextField.keyboardType = UIKeyboardTypeNumberPad;
        weightTextField.clearButtonMode = UITextFieldViewModeWhileEditing;  //设置×按钮
        weightTextField.clearsOnBeginEditing = YES;  //再次编辑就清空
        weightTextField.textAlignment = NSTextAlignmentCenter;
        weightTextField.inputAccessoryView = keyboardToolbar;
        weightTextField.text = evaluteWeightString;  //初始时设置为nill
        //不需要加，agetextfield会自动保存text值
        //点击下一题时保存到evalute值中
        //[ageTextField addTarget:self action:@selector(ageTextFieldChanged:) forControlEvents:UIControlEventEditingDidEnd];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question5View addSubview:questionLabel];
        [question5View addSubview:remarkLabel];
        [question5View addSubview:textBackView];
        [question5View addSubview:weightTextField];
        
        [question5View addSubview:lastQuestionButton];
        [question5View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question5View];
    }
    else if(questionNum == 6)
    {
        questionNumLabel.text = @"第六题";
        
        question6View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"6， 请问您的亲属状况是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        question6Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question6Checkbox1.frame = CGRectMake(35, 75, 15, 15);
        [question6Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question6Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question6Checkbox1 addTarget:self action:@selector(q6Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 69, 190, 27)];
        option1Label.text = @"兄弟姐妹中有患病";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:15];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question6Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question6Checkbox2.frame = CGRectMake(35, 110, 15, 15);
        [question6Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question6Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question6Checkbox2 addTarget:self action:@selector(q6Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 104, 190, 27)];
        option2Label.text = @"双亲中一人患病";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:15];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        question6Checkbox3 = [UIButton buttonWithType:UIButtonTypeCustom];
        question6Checkbox3.frame = CGRectMake(35, 145, 15, 15);
        [question6Checkbox3 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question6Checkbox3 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question6Checkbox3 addTarget:self action:@selector(q6Checkbox3Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option3Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 139, 190, 27)];
        option3Label.text = @"双亲均患病";
        option3Label.textColor = [UIColor blackColor];
        option3Label.font = [UIFont systemFontOfSize:15];
        option3Label.textAlignment = NSTextAlignmentCenter;
        
        question6Checkbox4 = [UIButton buttonWithType:UIButtonTypeCustom];
        question6Checkbox4.frame = CGRectMake(35, 180, 15, 15);
        [question6Checkbox4 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question6Checkbox4 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question6Checkbox4 addTarget:self action:@selector(q6Checkbox4Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option4Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 174, 190, 27)];
        option4Label.text = @"亲属无人患病";
        option4Label.textColor = [UIColor blackColor];
        option4Label.font = [UIFont systemFontOfSize:15];
        option4Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteRelativesString  isEqual: @"兄弟姐妹中有患病"]) {
            question6Checkbox1.selected = YES;
        }
        else if ([evaluteRelativesString  isEqual: @"双亲中一人患病"]) {
            question6Checkbox2.selected = YES;
        }
        else if ([evaluteRelativesString  isEqual: @"双亲均患病"]) {
            question6Checkbox3.selected = YES;
        }
        else if ([evaluteRelativesString  isEqual: @"亲属无人患病"]) {
            question6Checkbox4.selected = YES;
        }
        
        [question6View addSubview:questionLabel];
        [question6View addSubview:question6Checkbox1];
        [question6View addSubview:question6Checkbox2];
        [question6View addSubview:question6Checkbox3];
        [question6View addSubview:question6Checkbox4];
        [question6View addSubview:option1Label];
        [question6View addSubview:option2Label];
        [question6View addSubview:option3Label];
        [question6View addSubview:option4Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question6View addSubview:lastQuestionButton];
        [question6View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question6View];
    }
    else if(questionNum == 7)
    {
        questionNumLabel.text = @"第七题";
        
        question7View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"7， 请问您的职业情况是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        question7Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question7Checkbox1.frame = CGRectMake(35, 87, 20, 20);
        [question7Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question7Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question7Checkbox1 addTarget:self action:@selector(q7Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 83, 190, 27)];
        option1Label.text = @"无体力劳动";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:15];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question7Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question7Checkbox2.frame = CGRectMake(35, 132, 20, 20);
        [question7Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question7Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question7Checkbox2 addTarget:self action:@selector(q7Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 128, 190, 27)];
        option2Label.text = @"轻体力劳动";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:15];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        question7Checkbox3 = [UIButton buttonWithType:UIButtonTypeCustom];
        question7Checkbox3.frame = CGRectMake(35, 177, 20, 20);
        [question7Checkbox3 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question7Checkbox3 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question7Checkbox3 addTarget:self action:@selector(q7Checkbox3Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option3Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 173, 190, 27)];
        option3Label.text = @"重体力劳动";
        option3Label.textColor = [UIColor blackColor];
        option3Label.font = [UIFont systemFontOfSize:15];
        option3Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteOccupationString  isEqual: @"无体力劳动"]) {
            question7Checkbox1.selected = YES;
        }
        else if ([evaluteOccupationString  isEqual: @"轻体力劳动"]) {
            question7Checkbox2.selected = YES;
        }
        else if ([evaluteOccupationString  isEqual: @"重体力劳动"]) {
            question7Checkbox3.selected = YES;
        }
        
        [question7View addSubview:questionLabel];
        [question7View addSubview:question7Checkbox1];
        [question7View addSubview:question7Checkbox2];
        [question7View addSubview:question7Checkbox3];
        [question7View addSubview:option1Label];
        [question7View addSubview:option2Label];
        [question7View addSubview:option3Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question7View addSubview:lastQuestionButton];
        [question7View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question7View];
    }
    else if(questionNum == 8)
    {
        questionNumLabel.text = @"第八题";
        
        question8View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"8， 请问您的运动情况是？";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        question8Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question8Checkbox1.frame = CGRectMake(35, 75, 15, 15);
        [question8Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question8Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question8Checkbox1 addTarget:self action:@selector(q8Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 69, 190, 27)];
        option1Label.text = @"日中等强度体力活动<30min";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:15];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question8Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question8Checkbox2.frame = CGRectMake(35, 110, 15, 15);
        [question8Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question8Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question8Checkbox2 addTarget:self action:@selector(q8Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 104, 190, 27)];
        option2Label.text = @"日中等强度体力活动>30min";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:15];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        question8Checkbox3 = [UIButton buttonWithType:UIButtonTypeCustom];
        question8Checkbox3.frame = CGRectMake(35, 145, 15, 15);
        [question8Checkbox3 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question8Checkbox3 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question8Checkbox3 addTarget:self action:@selector(q8Checkbox3Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option3Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 139, 190, 27)];
        option3Label.text = @"周重体力活动<60min";
        option3Label.textColor = [UIColor blackColor];
        option3Label.font = [UIFont systemFontOfSize:15];
        option3Label.textAlignment = NSTextAlignmentCenter;
        
        question8Checkbox4 = [UIButton buttonWithType:UIButtonTypeCustom];
        question8Checkbox4.frame = CGRectMake(35, 180, 15, 15);
        [question8Checkbox4 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question8Checkbox4 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question8Checkbox4 addTarget:self action:@selector(q8Checkbox4Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option4Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 174, 190, 27)];
        option4Label.text = @"周重体力活动>60min";
        option4Label.textColor = [UIColor blackColor];
        option4Label.font = [UIFont systemFontOfSize:15];
        option4Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteSportsString  isEqual: @"日中等强度体力活动<30min"]) {
            question8Checkbox1.selected = YES;
        }
        else if ([evaluteSportsString  isEqual: @"日中等强度体力活动>30min"]) {
            question8Checkbox2.selected = YES;
        }
        else if ([evaluteSportsString  isEqual: @"周重体力活动<60min"]) {
            question8Checkbox3.selected = YES;
        }
        else if ([evaluteSportsString  isEqual: @"周重体力活动>60min"]) {
            question8Checkbox4.selected = YES;
        }
        
        [question8View addSubview:questionLabel];
        [question8View addSubview:question8Checkbox1];
        [question8View addSubview:question8Checkbox2];
        [question8View addSubview:question8Checkbox3];
        [question8View addSubview:question8Checkbox4];
        [question8View addSubview:option1Label];
        [question8View addSubview:option2Label];
        [question8View addSubview:option3Label];
        [question8View addSubview:option4Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question8View addSubview:lastQuestionButton];
        [question8View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question8View];
    }
    else if(questionNum == 9)
    {
        questionNumLabel.text = @"第九题";
        
        question9View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"9，进食肉类情况";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 57, WIDTH - 70, 25)];
        remarkLabel.text = @"（ 不包括海鲜 ）";
        remarkLabel.textColor = [UIColor grayColor];
        remarkLabel.textAlignment = NSTextAlignmentCenter;
        remarkLabel.font = [UIFont systemFontOfSize:12];
        
        question9Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question9Checkbox1.frame = CGRectMake(60, 90, 23, 23);
        [question9Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question9Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question9Checkbox1 addTarget:self action:@selector(q9Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 89, 190, 27)];
        option1Label.text = @"日进食 < 200g";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:17];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question9Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question9Checkbox2.frame = CGRectMake(60, 160, 23, 23);
        [question9Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                      forState:UIControlStateNormal];
        [question9Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                      forState:UIControlStateSelected];
        [question9Checkbox2 addTarget:self action:@selector(q9Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 159, 190, 27)];
        option2Label.text = @"日进食 > 200g";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:17];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteMeatString  isEqual: @"日进食 < 200g"]) {
            question9Checkbox1.selected = YES;
        }
        else if ([evaluteMeatString  isEqual: @"日进食 > 200g"]) {
            question9Checkbox2.selected = YES;
        }
        
        [question9View addSubview:questionLabel];
        [question9View addSubview:remarkLabel];
        [question9View addSubview:question9Checkbox1];
        [question9View addSubview:question9Checkbox2];
        [question9View addSubview:option1Label];
        [question9View addSubview:option2Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question9View addSubview:lastQuestionButton];
        [question9View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question9View];
    }
    else if(questionNum == 10)
    {
        questionNumLabel.text = @"第十题";
        
        question10View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"10， 进食蔬菜情况";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        question10Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question10Checkbox1.frame = CGRectMake(60, 90, 23, 23);
        [question10Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question10Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question10Checkbox1 addTarget:self action:@selector(q10Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 89, 190, 27)];
        option1Label.text = @"日进食 < 2次";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:17];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question10Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question10Checkbox2.frame = CGRectMake(60, 160, 23, 23);
        [question10Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question10Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question10Checkbox2 addTarget:self action:@selector(q10Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 159, 190, 27)];
        option2Label.text = @"日进食 > 2次";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:17];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteFruitString  isEqual: @"日进食 < 2次"]) {
            question10Checkbox1.selected = YES;
        }
        else if ([evaluteFruitString  isEqual: @"日进食 > 2次"]) {
            question10Checkbox2.selected = YES;
        }
        
        [question10View addSubview:questionLabel];
        [question10View addSubview:question10Checkbox1];
        [question10View addSubview:question10Checkbox2];
        [question10View addSubview:option1Label];
        [question10View addSubview:option2Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question10View addSubview:lastQuestionButton];
        [question10View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question10View];
    }
    else if(questionNum == 11)
    {
        questionNumLabel.text = @"第十一题";
        
        question11View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"11，饮酒状况";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *remarkLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 57, WIDTH - 70, 25)];
        remarkLabel.text = @"（ 含乙醇10g的任何酒类 ）";
        remarkLabel.textColor = [UIColor grayColor];
        remarkLabel.textAlignment = NSTextAlignmentCenter;
        remarkLabel.font = [UIFont systemFontOfSize:12];
        
        question11Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question11Checkbox1.frame = CGRectMake(35, 87, 20, 20);
        [question11Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question11Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question11Checkbox1 addTarget:self action:@selector(q11Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 83, 190, 27)];
        option1Label.text = @"不饮酒";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:15];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question11Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question11Checkbox2.frame = CGRectMake(35, 132, 20, 20);
        [question11Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question11Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question11Checkbox2 addTarget:self action:@selector(q11Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 128, 190, 27)];
        option2Label.text = @"日饮 < 4杯";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:15];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        question11Checkbox3 = [UIButton buttonWithType:UIButtonTypeCustom];
        question11Checkbox3.frame = CGRectMake(35, 177, 20, 20);
        [question11Checkbox3 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question11Checkbox3 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question11Checkbox3 addTarget:self action:@selector(q11Checkbox3Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option3Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 173, 190, 27)];
        option3Label.text = @"日饮 > 4杯";
        option3Label.textColor = [UIColor blackColor];
        option3Label.font = [UIFont systemFontOfSize:15];
        option3Label.textAlignment = NSTextAlignmentCenter;
        
        nextQuestionButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteDrinkString  isEqual: @"不饮酒"]) {
            question11Checkbox1.selected = YES;
        }
        else if ([evaluteDrinkString  isEqual: @"日饮 < 4杯"]) {
            question11Checkbox2.selected = YES;
        }
        else if ([evaluteDrinkString  isEqual: @"日饮 > 4杯"]) {
            question11Checkbox3.selected = YES;
        }
        
        [question11View addSubview:questionLabel];
        [question11View addSubview:remarkLabel];
        [question11View addSubview:question11Checkbox1];
        [question11View addSubview:question11Checkbox2];
        [question11View addSubview:question11Checkbox3];
        [question11View addSubview:option1Label];
        [question11View addSubview:option2Label];
        [question11View addSubview:option3Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        nextQuestionButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question11View addSubview:lastQuestionButton];
        [question11View addSubview:nextQuestionButton];
        
        [evaluteView addSubview:question11View];
    }
    else if(questionNum == 12)
    {
        questionNumLabel.text = @"第十二题";
        
        question12View = [EvaluteFunc addQuestionBackView];
        
        UILabel *questionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, WIDTH - 70, 30)];
        questionLabel.text = @"12，吸烟状况";
        questionLabel.textColor = [UIColor blackColor];
        questionLabel.font = [UIFont systemFontOfSize:18];
        questionLabel.textAlignment = NSTextAlignmentCenter;
        
        
        question12Checkbox1 = [UIButton buttonWithType:UIButtonTypeCustom];
        question12Checkbox1.frame = CGRectMake(60, 90, 23, 23);
        [question12Checkbox1 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question12Checkbox1 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question12Checkbox1 addTarget:self action:@selector(q12Checkbox1Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option1Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 89, 190, 27)];
        option1Label.text = @"不吸烟";
        option1Label.textColor = [UIColor blackColor];
        option1Label.font = [UIFont systemFontOfSize:17];
        option1Label.textAlignment = NSTextAlignmentCenter;
        
        question12Checkbox2 = [UIButton buttonWithType:UIButtonTypeCustom];
        question12Checkbox2.frame = CGRectMake(60, 160, 23, 23);
        [question12Checkbox2 setBackgroundImage:[UIImage imageNamed:@"UncheckedBox.png"]
                                       forState:UIControlStateNormal];
        [question12Checkbox2 setBackgroundImage:[UIImage imageNamed:@"CheckedBox.png"]
                                       forState:UIControlStateSelected];
        [question12Checkbox2 addTarget:self action:@selector(q12Checkbox2Selected) forControlEvents:UIControlEventTouchDown];
        
        UILabel *option2Label = [[UILabel alloc]initWithFrame:CGRectMake(65, 159, 190, 27)];
        option2Label.text = @"吸烟";
        option2Label.textColor = [UIColor blackColor];
        option2Label.font = [UIFont systemFontOfSize:17];
        option2Label.textAlignment = NSTextAlignmentCenter;
        
        evaluteButton.frame = CGRectMake(100, 225, WIDTH - 270, 25);
        
        //点击前一题后再点击下一题不被刷新
        if ([evaluteSmokeString  isEqual: @"不吸烟"]) {
            question12Checkbox1.selected = YES;
        }
        else if ([evaluteSmokeString  isEqual: @"吸烟"]) {
            question12Checkbox2.selected = YES;
        }
        
        [question12View addSubview:questionLabel];
        [question12View addSubview:question12Checkbox1];
        [question12View addSubview:question12Checkbox2];
        [question12View addSubview:option1Label];
        [question12View addSubview:option2Label];
        
        //*******************************************************
        lastQuestionButton.frame = CGRectMake(60, 225, 80, 25);
        evaluteButton.frame = CGRectMake(170, 225, 80, 25);
        
        [question12View addSubview:lastQuestionButton];
        [question12View addSubview:evaluteButton];
        
        [evaluteView addSubview:question12View];
    }
    else if(questionNum == 13)
    {
        
        evaluteResultView = [EvaluteFunc addQuestionBackView];
        
        questionNumLabel.text = @"评估结果";
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, WIDTH - 130, 90)];
        contentLabel.text = @"    我们将患病风险风险分为较低，中等，较高，非常高。您的患病风险为：";
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = [UIColor grayColor];
        [evaluteResultView addSubview:contentLabel];
        
        UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 140, WIDTH - 130, 40)];
        //resultLabel.text = @"较高";
        resultLabel.numberOfLines = 0;
        resultLabel.textColor = [UIColor redColor];
        resultLabel.font = [UIFont systemFontOfSize:20];
        resultLabel.textAlignment = NSTextAlignmentCenter;
        [evaluteResultView addSubview:resultLabel];
        
        [evaluteView addSubview:evaluteResultView];
        
        double score = [EvaluteFunc evaluteResult];
        if (score < 0.9) {
            resultLabel.text = @"较低";
        }
        else if((score > 0.9) && (score < 1.1)){
            resultLabel.text = @"中等";
        }
        else if((score >= 1.1) && (score < 2.0)){
            resultLabel.text = @"较高";
        }
        else if(score >= 2.0){
            resultLabel.text = @"非常高";
        }
    
    }
    NSLog(@"questionNum: %d",questionNum);
}


+ (void)nextQuestionButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    //alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"请输入信息"preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    //[alertController addAction:confirmAction];
    //要在if语句里面设定，否则会有bug，ios自己的bug
    //warning:Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior ()
    
    //GlobalFunc *sharedManagerGF = [EvaluteFunc sharedManager];
    if (questionNum == 1) {
        if (evaluteGenderString == nil) {
            
            alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"请输入信息"preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:confirmAction];
            rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            [rootViewController presentViewController:alertController animated:YES completion:nil];
            
        } else {
            [EvaluteFunc initQuestionViews:questionNum];
            
        }
    }
    else if (questionNum == 2) {
        //textfield.text判断空不能用nil，只能用长度判断
        if ([ageTextField.text length] == 0) {
            
            alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"请输入信息"preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:confirmAction];
            rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            [rootViewController presentViewController:alertController animated:YES completion:nil];
            
        } else {
            int ageValue = [ageTextField.text intValue];
            //范围判定
            if ((ageValue > 99) || (ageValue < 10)) {
                alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"超出范围，范围应在10~99之间"preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                [alertController addAction:confirmAction];
                rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
                [rootViewController presentViewController:alertController animated:YES completion:nil];
            } else {
                //保存数值
                evaluteAgeString = ageTextField.text;
                
                NSLog(@"evaAge: %@",evaluteAgeString);
                [EvaluteFunc initQuestionViews:questionNum];
            }
        }
    }
    else if (questionNum == 3) {
        evaluteWaistlineString = waistlineTextField.text;
        
        NSLog(@"evaWL: %@",evaluteWaistlineString);
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 4) {
        evaluteHeightString = heightTextField.text;
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 5) {
        evaluteWeightString = weightTextField.text;
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 6) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 7) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 8) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 9) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 10) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 11) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    else if (questionNum == 12) {
        [EvaluteFunc initQuestionViews:questionNum];
    }
    
}

+ (void)evaluteButtonPressed
{
    [EvaluteFunc initQuestionViews:questionNum];
}

+ (double)evaluteResult
{
    double score = 0.0346; //根据公式pdf案例中的结果除掉相应变量后得到的底数
    if ([evaluteRelativesString isEqualToString:@"兄弟姐妹中有患病"] || [evaluteRelativesString isEqualToString:@"双亲中一人患病"]) {
        score = score * 1.4;
    }
    else if ([evaluteRelativesString isEqualToString:@"双亲均患病"]){
        score = score * 3.8;
    }
    
    double height = [evaluteHeightString doubleValue];
    double weight = [evaluteWeightString doubleValue];
    double bmi = weight / (height * height);
    
    if ( (bmi > 24) && (bmi < 28) ) {
        score = score * 1.6;
    }
    else if ((bmi > 28)){
        score = score * 3.5;
    }
    
    double waistline = [evaluteWaistlineString doubleValue];
    if ([evaluteGenderString isEqualToString:@"男"]) {
        if ( (waistline >= 85) && (waistline < 90) ) {
            score = score * 1.4;
        }
        else if((waistline >= 90) && (waistline <= 100)){
            score = score * 2.1;
        }
        else if (waistline > 100){
            score = score * 2.8;
        }
    }
    else if ([evaluteGenderString isEqualToString:@"女"]) {
        if ( (waistline >= 80) && (waistline < 85) ) {
            score = score * 1.4;
        }
        else if((waistline >= 85) && (waistline <= 95)){
            score = score * 2.1;
        }
        else if (waistline > 95){
            score = score * 2.8;
        }
    }
    
    if ([evaluteOccupationString isEqualToString:@"无体力劳动"] || [evaluteOccupationString isEqualToString:@"轻体力劳动"]) {
        score = score * 2.6;
    }
    if ([evaluteSportsString isEqualToString:@"日中等强度体力活动<30min"] || [evaluteSportsString isEqualToString:@"周重体力活动<60min"]) {
        score = score * 1.4;
    }
    if ([evaluteMeatString isEqualToString:@"日进食 > 200g"]) {
        score = score * 1.3;
    }
    if ([evaluteFruitString isEqualToString:@"日进食 < 2次"]) {
        score = score * 1.2;
    }
    if ([evaluteDrinkString isEqualToString:@"日饮 > 4杯"]) {
        score = score * 1.5;
    }
    if ([evaluteSmokeString isEqualToString:@"吸烟"]) {
        score = score * 1.2;
    }
    return score;
}

+ (void)deleteData
{
    evaluteGenderString  = nil;
    evaluteAgeString = nil;
    evaluteWaistlineString = nil;
    evaluteHeightString = nil;
    evaluteWeightString = nil;
    evaluteRelativesString = nil;
    evaluteOccupationString = nil;
    evaluteSportsString = nil;
    evaluteMeatString = nil;
    evaluteFruitString = nil;
    evaluteDrinkString = nil;
    evaluteSmokeString = nil;
}

+ (void)lastQuestionButtonPressed
{
    if (questionNum == 2) {
        [question2View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 3){
        [question3View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 4){
        [question4View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 5){
        [question5View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 6){
        [question6View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 7){
        [question7View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 8){
        [question8View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 9){
        [question9View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 10){
        [question10View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 11){
        [question11View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 12){
        [question12View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 13){
        [question13View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 14){
        [question14View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 15){
        [question15View removeFromSuperview];
        questionNum = questionNum - 1;
    } else if(questionNum == 16){
        [question16View removeFromSuperview];
        questionNum = questionNum - 1;
    }
    
}

+ (UIView *)addQuestionBackView
{
    UIView *questionBackView = [[UIView alloc]init];
    
    questionBackView.frame = CGRectMake(35, 165, WIDTH - 70, 270);
    questionNum = questionNum + 1;   //加一个view题目数加1
    
    questionBackView.backgroundColor = [GlobalFunc colorFromHexRGB:@"FFFAFA"];
    questionBackView.layer.cornerRadius = 9;
    //questionBackView.layer.masksToBounds = YES;
    questionBackView.layer.shadowColor = [UIColor grayColor].CGColor;//shadowColor阴影颜色
    questionBackView.layer.shadowOffset = CGSizeMake(2,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    questionBackView.layer.shadowOpacity = 0.4;//阴影透明度，默认0
    questionBackView.layer.shadowRadius = 2.5;//阴影半径，默认3
    return questionBackView;
}


+ (void)q1Checkbox1Selected
{
    //GlobalFunc *sharedManagerGF = [GlobalFunc sharedManager];
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question1Checkbox1.selected == NO) {
        question1Checkbox1.selected = YES;
        if (question1Checkbox2.selected == YES) {
            question1Checkbox2.selected = NO;
        }
        evaluteGenderString = @"男";
    } else {
        question1Checkbox1.selected = NO;
        evaluteGenderString = nil;
    }
    NSLog(@"q1Checkbox1: %@",evaluteGenderString);
}

+ (void)q1Checkbox2Selected
{
    //GlobalFunc *sharedManagerGF = [EvaluteFunc sharedManager];
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question1Checkbox2.selected == NO) {
        question1Checkbox2.selected = YES;
        if (question1Checkbox1.selected == YES) {
            question1Checkbox1.selected = NO;
        }
        evaluteGenderString = @"女";
    } else {
        question1Checkbox2.selected = NO;
        evaluteGenderString = nil;
    }
    NSLog(@"q1Checkbox2: %@",evaluteGenderString);
}

+ (void)q6Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question6Checkbox1.selected == NO) {
        question6Checkbox1.selected = YES;
        if (question6Checkbox2.selected == YES) {
            question6Checkbox2.selected = NO;
        }
        if (question6Checkbox3.selected == YES) {
            question6Checkbox3.selected = NO;
        }
        if (question6Checkbox4.selected == YES) {
            question6Checkbox4.selected = NO;
        }
        evaluteRelativesString = @"兄弟姐妹中有患病";
    } else {
        question6Checkbox1.selected = NO;
        evaluteRelativesString = nil;
    }
    NSLog(@"q6Checkbox1: %@",evaluteRelativesString);
}

+ (void)q6Checkbox2Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question6Checkbox2.selected == NO) {
        question6Checkbox2.selected = YES;
        if (question6Checkbox1.selected == YES) {
            question6Checkbox1.selected = NO;
        }
        if (question6Checkbox3.selected == YES) {
            question6Checkbox3.selected = NO;
        }
        if (question6Checkbox4.selected == YES) {
            question6Checkbox4.selected = NO;
        }
        evaluteRelativesString = @"双亲中一人患病";
    } else {
        question6Checkbox2.selected = NO;
        evaluteRelativesString = nil;
    }
    NSLog(@"q6Checkbox2: %@",evaluteRelativesString);
}

+ (void)q6Checkbox3Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question6Checkbox3.selected == NO) {
        question6Checkbox3.selected = YES;
        if (question6Checkbox2.selected == YES) {
            question6Checkbox2.selected = NO;
        }
        if (question6Checkbox1.selected == YES) {
            question6Checkbox1.selected = NO;
        }
        if (question6Checkbox4.selected == YES) {
            question6Checkbox4.selected = NO;
        }
        evaluteRelativesString = @"双亲均患病";
    } else {
        
        question6Checkbox3.selected = NO;
        evaluteRelativesString = nil;
    }
    NSLog(@"q6Checkbox3: %@",evaluteRelativesString);
}

+ (void)q6Checkbox4Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question6Checkbox4.selected == NO) {
        question6Checkbox4.selected = YES;
        if (question6Checkbox2.selected == YES) {
            question6Checkbox2.selected = NO;
        }
        if (question6Checkbox3.selected == YES) {
            question6Checkbox3.selected = NO;
        }
        if (question6Checkbox1.selected == YES) {
            question6Checkbox1.selected = NO;
        }
        evaluteRelativesString = @"亲属无人患病";
    } else {
        question6Checkbox4.selected = NO;
        evaluteRelativesString = nil;
    }
    NSLog(@"q6Checkbox4: %@",evaluteRelativesString);
}

+ (void)q7Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question7Checkbox1.selected == NO) {
        question7Checkbox1.selected = YES;
        if (question7Checkbox2.selected == YES) {
            question7Checkbox2.selected = NO;
        }
        if (question7Checkbox3.selected == YES) {
            question7Checkbox3.selected = NO;
        }
        evaluteOccupationString = @"无体力劳动";
    } else {
        question7Checkbox1.selected = NO;
        evaluteOccupationString = nil;
    }
    NSLog(@"q7Checkbox1: %@",evaluteOccupationString);
}

+ (void)q7Checkbox2Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question7Checkbox2.selected == NO) {
        question7Checkbox2.selected = YES;
        if (question7Checkbox1.selected == YES) {
            question7Checkbox1.selected = NO;
        }
        if (question7Checkbox3.selected == YES) {
            question7Checkbox3.selected = NO;
        }
        evaluteOccupationString = @"轻体力劳动";
    } else {
        question7Checkbox2.selected = NO;
        evaluteOccupationString = nil;
    }
    NSLog(@"q7Checkbox2: %@",evaluteOccupationString);
}

+ (void)q7Checkbox3Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question7Checkbox3.selected == NO) {
        question7Checkbox3.selected = YES;
        if (question7Checkbox1.selected == YES) {
            question7Checkbox1.selected = NO;
        }
        if (question7Checkbox2.selected == YES) {
            question7Checkbox2.selected = NO;
        }
        evaluteOccupationString = @"重体力劳动";
    } else {
        question7Checkbox2.selected = NO;
        evaluteOccupationString = nil;
    }
    NSLog(@"q7Checkbox3: %@",evaluteOccupationString);
}

+ (void)q8Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question8Checkbox1.selected == NO) {
        question8Checkbox1.selected = YES;
        if (question8Checkbox2.selected == YES) {
            question8Checkbox2.selected = NO;
        }
        if (question8Checkbox3.selected == YES) {
            question8Checkbox3.selected = NO;
        }
        if (question8Checkbox4.selected == YES) {
            question8Checkbox4.selected = NO;
        }
        evaluteSportsString = @"日中等强度体力活动<30min";
    } else {
        question8Checkbox1.selected = NO;
        evaluteSportsString = nil;
    }
    NSLog(@"q8Checkbox1: %@",evaluteSportsString);
}

+ (void)q8Checkbox2Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question8Checkbox2.selected == NO) {
        question8Checkbox2.selected = YES;
        if (question8Checkbox1.selected == YES) {
            question8Checkbox1.selected = NO;
        }
        if (question8Checkbox3.selected == YES) {
            question8Checkbox3.selected = NO;
        }
        if (question8Checkbox4.selected == YES) {
            question8Checkbox4.selected = NO;
        }
        evaluteSportsString = @"日中等强度体力活动>30min";
    } else {
        question8Checkbox2.selected = NO;
        evaluteSportsString = nil;
    }
    NSLog(@"q8Checkbox2: %@",evaluteSportsString);
}

+ (void)q8Checkbox3Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question8Checkbox3.selected == NO) {
        question8Checkbox3.selected = YES;
        if (question8Checkbox1.selected == YES) {
            question8Checkbox1.selected = NO;
        }
        if (question8Checkbox2.selected == YES) {
            question8Checkbox2.selected = NO;
        }
        if (question8Checkbox4.selected == YES) {
            question8Checkbox4.selected = NO;
        }
        evaluteSportsString = @"周重体力活动<60min";
    } else {
        question8Checkbox3.selected = NO;
        evaluteSportsString = nil;
    }
    NSLog(@"q8Checkbox3: %@",evaluteSportsString);
}

+ (void)q8Checkbox4Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question8Checkbox4.selected == NO) {
        question8Checkbox4.selected = YES;
        if (question8Checkbox1.selected == YES) {
            question8Checkbox1.selected = NO;
        }
        if (question8Checkbox2.selected == YES) {
            question8Checkbox2.selected = NO;
        }
        if (question8Checkbox3.selected == YES) {
            question8Checkbox3.selected = NO;
        }
        evaluteSportsString = @"周重体力活动>60min";
    } else {
        question8Checkbox4.selected = NO;
        evaluteSportsString = nil;
    }
    NSLog(@"q8Checkbox4: %@",evaluteSportsString);
}

+ (void)q9Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question9Checkbox1.selected == NO) {
        question9Checkbox1.selected = YES;
        if (question9Checkbox2.selected == YES) {
            question9Checkbox2.selected = NO;
        }
        evaluteMeatString = @"日进食 < 200g";
    } else {
        question9Checkbox1.selected = NO;
        evaluteMeatString = nil;
    }
    NSLog(@"q9Checkbox1: %@",evaluteMeatString);
}

+ (void)q9Checkbox2Selected
{
    //GlobalFunc *sharedManagerGF = [EvaluteFunc sharedManager];
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question9Checkbox2.selected == NO) {
        question9Checkbox2.selected = YES;
        if (question1Checkbox1.selected == YES) {
            question1Checkbox1.selected = NO;
        }
        evaluteMeatString = @"日进食 > 200g";
    } else {
        question9Checkbox2.selected = NO;
        evaluteMeatString = nil;
    }
    NSLog(@"q9Checkbox2: %@",evaluteMeatString);
}

+ (void)q10Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question10Checkbox1.selected == NO) {
        question10Checkbox1.selected = YES;
        if (question10Checkbox2.selected == YES) {
            question10Checkbox2.selected = NO;
        }
        evaluteFruitString = @"日进食 < 2次";
    } else {
        question10Checkbox1.selected = NO;
        evaluteFruitString = nil;
    }
    NSLog(@"q10Checkbox1: %@",evaluteFruitString);
}

+ (void)q10Checkbox2Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question10Checkbox2.selected == NO) {
        question10Checkbox2.selected = YES;
        if (question10Checkbox1.selected == YES) {
            question10Checkbox1.selected = NO;
        }
        evaluteFruitString = @"日进食 > 2次";
    } else {
        question10Checkbox2.selected = NO;
        evaluteFruitString = nil;
    }
    NSLog(@"q10Checkbox2: %@",evaluteFruitString);
}

+ (void)q11Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question11Checkbox1.selected == NO) {
        question11Checkbox1.selected = YES;
        if (question11Checkbox2.selected == YES) {
            question11Checkbox2.selected = NO;
        }
        if (question11Checkbox3.selected == YES) {
            question11Checkbox3.selected = NO;
        }
        evaluteDrinkString = @"不饮酒";
    } else {
        question11Checkbox1.selected = NO;
        evaluteDrinkString = nil;
    }
    NSLog(@"q11Checkbox1: %@",evaluteDrinkString);
}

+ (void)q11Checkbox2Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question11Checkbox2.selected == NO) {
        question11Checkbox2.selected = YES;
        if (question11Checkbox1.selected == YES) {
            question11Checkbox1.selected = NO;
        }
        if (question11Checkbox3.selected == YES) {
            question11Checkbox3.selected = NO;
        }
        evaluteDrinkString = @"日饮 < 4杯";
    } else {
        question11Checkbox2.selected = NO;
        evaluteDrinkString = nil;
    }
    NSLog(@"q11Checkbox2: %@",evaluteDrinkString);
}

+ (void)q11Checkbox3Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question11Checkbox3.selected == NO) {
        question11Checkbox3.selected = YES;
        if (question11Checkbox2.selected == YES) {
            question11Checkbox2.selected = NO;
        }
        if (question11Checkbox1.selected == YES) {
            question11Checkbox1.selected = NO;
        }
        evaluteDrinkString = @"日饮 > 4杯";
    } else {
        question11Checkbox3.selected = NO;
        evaluteDrinkString = nil;
    }
    NSLog(@"q11Checkbox3: %@",evaluteDrinkString);
}

+ (void)q12Checkbox1Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question12Checkbox1.selected == NO) {
        question12Checkbox1.selected = YES;
        if (question12Checkbox2.selected == YES) {
            question12Checkbox2.selected = NO;
        }
        evaluteSmokeString = @"不吸烟";
    } else {
        question12Checkbox1.selected = NO;
        evaluteSmokeString = nil;
    }
    NSLog(@"q12Checkbox1: %@",evaluteSmokeString);
}

+ (void)q12Checkbox2Selected
{
    //实现点击一下确认，点击两下取消确认，第二个if如果其他checkbox有选中的话取消选中状态
    if (question12Checkbox2.selected == NO) {
        question12Checkbox2.selected = YES;
        if (question12Checkbox1.selected == YES) {
            question12Checkbox1.selected = NO;
        }
        evaluteSmokeString = @"吸烟";
    } else {
        question12Checkbox2.selected = NO;
        evaluteSmokeString = nil;
    }
    NSLog(@"q12Checkbox2: %@",evaluteSmokeString);
}

+ (void)moveBackFromEvalute:(UIView *)fromView
             moveBackToView:(UIView *)toView
{
    UIViewController *rootViewController;
    UIAlertController *alertController;

    if ((questionNum > 0) && (questionNum < 13) ) {
        alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"有信息未保存，是否确定退出"preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                        {
                                            [UIView animateWithDuration:0.30
                                                                  delay:0.14    //等待弹出框消失再返回，否则看不到跳转效果
                                                                options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                                                             animations:^{
                                                                 //开始动画
                                                                 toView.superview.transform = CGAffineTransformMakeTranslation(0, 0);
                                                                 toView.transform = CGAffineTransformMakeTranslation(WIDTH, 0);
                                                                 //[self MoveBack:self.view.superview];
                                                                 
                                                             }
                                                             completion:^(BOOL finished){
                                                                 [fromView removeFromSuperview];
                                                                 [EvaluteFunc deleteData];
                                                             }];
                                        }];
        [alertController addAction:cancelAction];
        [alertController addAction:confirmAction];
        rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        [UIView animateWithDuration:0.30
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                         animations:^{
                             //开始动画
                             toView.superview.transform = CGAffineTransformMakeTranslation(0, 0);
                             toView.transform = CGAffineTransformMakeTranslation(WIDTH, 0);
                             //[self MoveBack:self.view.superview];
                             
                         }
                         completion:^(BOOL finished){
                             [fromView removeFromSuperview];
                             [EvaluteFunc deleteData];
                         }];
    }
    
}

@end
