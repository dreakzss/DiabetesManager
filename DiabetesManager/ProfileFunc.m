//
//  ProfileFunc.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/7/23.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "ProfileFunc.h"

@implementation ProfileFunc

static ProfileFunc *sharedManager = nil;
+ (ProfileFunc *)sharedManager
{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        
    });
    return sharedManager;
}

+ (void)moveBackFromProfile:(UIView *)fromView
             moveBackToView:(UIView *)toView
{
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    //changed:yes saved:no弹出提醒   changed:yes saved:no不弹出提醒
    NSLog(@"change:%@", sharedManagerPF.changed?@"YES":@"NO");
    if ((sharedManagerPF.changed == YES) && (sharedManagerPF.saved == NO)) {
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
                         }];
    }
    
}

static UIView *pickerView;
+ (UIView *)addPickerBackground:(NSString *)unitString
                 withButtonName:(NSString *)buttonString
{
    pickerView = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIBARHEIGHT, WIDTH, HEIGHT - NAVIBARHEIGHT)];
    pickerView.backgroundColor = [UIColor clearColor];
    
    UIView *grayBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - NAVIBARHEIGHT - 230)];
    grayBackground.backgroundColor = [UIColor blackColor];
    grayBackground.alpha = 0.35;
    
    UIView *pickerDetailView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 230, WIDTH, 230)];
    pickerDetailView.backgroundColor = [GlobalFunc colorFromHexRGB:@"F5F5F5"];
    
    UIView *separatorX1 = [[UIView alloc]initWithFrame:CGRectMake(0, 35, WIDTH, 1)];
    separatorX1.backgroundColor = [GlobalFunc colorFromHexRGB:@"A3A3A3"];
    UIView *statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 35)];
    statusBarView.backgroundColor = [UIColor whiteColor];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(10, 5, 50, 25);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    [cancelButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(removePickerBackground) forControlEvents:UIControlEventTouchDown];
    
    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 35)];
    unitLabel.textColor = [UIColor grayColor];
    unitLabel.font = [UIFont systemFontOfSize:17];
    unitLabel.textAlignment = NSTextAlignmentCenter;
    [statusBarView addSubview:unitLabel];
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(WIDTH - 60, 5, 50, 25);
    [confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    confirmButton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    [confirmButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    if ([buttonString isEqualToString:@"gender"]) {
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(ageChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if ([buttonString isEqualToString:@"age"]) {
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(ageChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"waistline"]){
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(waistlineChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"height"]){
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(heightChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"weight"]){
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(weightChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"1"]){
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(removePickerBackground) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"1"]){
        unitLabel.text = unitString;
        [confirmButton addTarget:self action:@selector(removePickerBackground) forControlEvents:UIControlEventTouchDown];
    }
    
    [statusBarView addSubview:cancelButton];
    [statusBarView addSubview:confirmButton];
    [pickerDetailView addSubview:separatorX1];
    [pickerDetailView addSubview:statusBarView];
    [pickerView addSubview:grayBackground];
    [pickerView addSubview:pickerDetailView];
    
    return pickerView;
}

+ (void)removePickerBackground
{
    [pickerView removeFromSuperview];
}

#pragma mark - ProfileDataChange   ( ProfileViewController )
static UILabel *ageValueLabel;
static UILabel *genderValueLabel;
static UILabel *waistlineValueLabel;
static UILabel *heightValueLabel;
static UILabel *weightValueLabel;
static UILabel *bmiValueLabel;
static UILabel *relativesSituationValueLabel;
static UILabel *occupationSituationValueLabel;
static UILabel *sportsSituationValueLabel;
static UILabel *meatSituationValueLabel;
static UILabel *fruitSituationValueLabel;
static UILabel *drinkSituationValueLabel;
static UILabel *smokeSituationValueLabel;
static UILabel *glucoseValueLabel;
static UILabel *bloodPressureValueLabel;
static UILabel *cholesterolValueLabel;
static UILabel *triglycerideValueLabel;

static TriangleGrayView *triangleGrayView1;
static TriangleBlueView *triangleBlueView1;
static TriangleGrayView *triangleGrayView2;
static TriangleBlueView *triangleBlueView2;
static TriangleGrayView *triangleGrayView3;
static TriangleBlueView *triangleBlueView3;
static TriangleGrayView *triangleGrayView4;
static TriangleBlueView *triangleBlueView4;
static TriangleGrayView *triangleGrayView5;
static TriangleBlueView *triangleBlueView5;
static TriangleGrayView *triangleGrayView6;
static TriangleBlueView *triangleBlueView6;
static TriangleGrayView *triangleGrayView7;
static TriangleBlueView *triangleBlueView7;
static TriangleGrayView *triangleGrayView8;
static TriangleBlueView *triangleBlueView8;
static TriangleGrayView *triangleGrayView9;
static TriangleBlueView *triangleBlueView9;
static TriangleGrayView *triangleGrayView10;
static TriangleBlueView *triangleBlueView10;
static TriangleGrayView *triangleGrayView11;
static TriangleBlueView *triangleBlueView11;
static TriangleGrayView *triangleGrayView12;
static TriangleBlueView *triangleBlueView12;
static TriangleGrayView *triangleGrayView13;
static TriangleBlueView *triangleBlueView13;
static TriangleGrayView *triangleGrayView14;
static TriangleBlueView *triangleBlueView14;
static TriangleGrayView *triangleGrayView15;
static TriangleBlueView *triangleBlueView15;
static TriangleGrayView *triangleGrayView16;
static TriangleBlueView *triangleBlueView16;
static TriangleGrayView *triangleGrayView17;
static TriangleBlueView *triangleBlueView17;

+ (void)getProfileDataFromDM
{
    //如果数据没有赋值，默认显示 - -
    ProfileModel *sharedManagerPM = [ProfileModel sharedManager];
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    [sharedManagerPM initProfileData];
    
    //初始化时调用DM中的信息，profile中的值要重新赋值一次
    sharedManagerPF.profileUsernameString = sharedManagerPM.usernameString;
    sharedManagerPF.profilePhoneNumString = sharedManagerPM.phoneNumString;
    sharedManagerPF.profileGenderString = sharedManagerPM.genderString;
    sharedManagerPF.profileAgeString = sharedManagerPM.ageString;
    sharedManagerPF.profileWaistlineString = sharedManagerPM.waistlineString;
    sharedManagerPF.profileHeightString = sharedManagerPM.heightString;
    sharedManagerPF.profileWeightString = sharedManagerPM.weightString;
    sharedManagerPF.profileBMIString = sharedManagerPM.bmiString;
    sharedManagerPF.profileRelativesSituationString = sharedManagerPM.relativesSituationString;
    sharedManagerPF.profileOccupationSituationString = sharedManagerPM.occupationSituationString;
    sharedManagerPF.profileSportsSituationString = sharedManagerPM.sportsSituationString;
    sharedManagerPF.profileMeatSituationString = sharedManagerPM.meatSituationString;
    sharedManagerPF.profileFruitSituationString = sharedManagerPM.fruitSituationString;
    sharedManagerPF.profileDrinkSituationString = sharedManagerPM.drinkSituationString;
    sharedManagerPF.profileSmokeSituationString = sharedManagerPM.smokeSituationString;
    
    NSLog(@"profileUsername: %@",sharedManagerPF.profileUsernameString);
    NSLog(@"profilePhoneNum: %@",sharedManagerPF.profilePhoneNumString);
    NSLog(@"profileGender: %@",sharedManagerPF.profileGenderString);
    NSLog(@"tempGender: %@",sharedManagerPF.tempProfileGender);
    NSLog(@"profileAge: %@",sharedManagerPF.profileAgeString);
    NSLog(@"tempAge: %@",sharedManagerPF.tempProfileAge);
    NSLog(@"profileHeight: %@",sharedManagerPF.profileWaistlineString);
    NSLog(@"tempHeight: %@",sharedManagerPF.tempProfileWaistline);
    NSLog(@"profileHeight: %@",sharedManagerPF.profileHeightString);
    NSLog(@"tempHeight: %@",sharedManagerPF.tempProfileHeight);
    NSLog(@"profileWeight: %@",sharedManagerPF.profileWeightString);
    NSLog(@"tempWeight: %@",sharedManagerPF.tempProfileWeight);
    NSLog(@"profileBMI: %@",sharedManagerPF.profileBMIString);
    NSLog(@"tempBMI: %@",sharedManagerPF.tempProfileBMI);
    NSLog(@"profileRelatives: %@",sharedManagerPF.profileRelativesSituationString);
    NSLog(@"tempRelatives: %@",sharedManagerPF.tempProfileRelativesSituation);
    NSLog(@"profileOccupation: %@",sharedManagerPF.profileOccupationSituationString);
    NSLog(@"tempOccupation: %@",sharedManagerPF.tempProfileOccupationSituation);
    NSLog(@"profileSports: %@",sharedManagerPF.profileSportsSituationString);
    NSLog(@"tempSports: %@",sharedManagerPF.tempProfileSportsSituation);
    NSLog(@"profileMeat: %@",sharedManagerPF.profileMeatSituationString);
    NSLog(@"tempMeat: %@",sharedManagerPF.tempProfileMeatSituation);
    NSLog(@"profileFruit: %@",sharedManagerPF.profileFruitSituationString);
    NSLog(@"tempFruit: %@",sharedManagerPF.tempProfileFruitSituation);
    NSLog(@"profileDrink: %@",sharedManagerPF.profileDrinkSituationString);
    NSLog(@"tempDrink: %@",sharedManagerPF.tempProfileDrinkSituationString);
    NSLog(@"profileSmoke: %@",sharedManagerPF.profileSmokeSituationString);
    NSLog(@"tempSmoke: %@",sharedManagerPF.tempProfileSmokeSituationString);
    
}

+ (void)initProfileElements:(UIView *)view
{
    //初始化时调用DM中的信息，profile中的值要重新赋值
    [ProfileFunc getProfileDataFromDM];
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    //创建labels
    genderValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 135, 200, 40)];
    ageValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 185, 200, 40)];
    waistlineValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 235, 200, 40)];
    heightValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 285, 200, 40)];
    weightValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 335, 200, 40)];
    bmiValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 385, 200, 40)];
    
    relativesSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 435, 200, 40)];
    occupationSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 485, 200, 40)];
    sportsSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 535, 200, 40)];
    meatSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 585, 200, 40)];
    fruitSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 635, 200, 40)];
    drinkSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 685, 200, 40)];
    smokeSituationValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(123, 735, 200, 40)];
    
    //dataInit
    //changed和saved,初始值为NO用于判断是否在确定更改信息后，保存信息前点击返回按钮
    sharedManagerPF.changed = NO;
    sharedManagerPF.saved = NO;
    
    genderValueLabel.text = sharedManagerPF.profileGenderString;
    ageValueLabel.text = sharedManagerPF.profileAgeString;
    waistlineValueLabel.text = sharedManagerPF.profileWaistlineString;
    heightValueLabel.text = sharedManagerPF.profileHeightString;
    weightValueLabel.text = sharedManagerPF.profileWeightString;
    bmiValueLabel.text = sharedManagerPF.profileBMIString;
    relativesSituationValueLabel.text = sharedManagerPF.profileRelativesSituationString;
    occupationSituationValueLabel.text = sharedManagerPF.profileOccupationSituationString;
    sportsSituationValueLabel.text = sharedManagerPF.profileSportsSituationString;
    meatSituationValueLabel.text = sharedManagerPF.profileMeatSituationString;
    fruitSituationValueLabel.text = sharedManagerPF.profileFruitSituationString;
    drinkSituationValueLabel.text = sharedManagerPF.profileDrinkSituationString;
    smokeSituationValueLabel.text = sharedManagerPF.profileSmokeSituationString;
    
    //viewInit
    genderValueLabel.textColor = [UIColor grayColor];
    genderValueLabel.font = [UIFont systemFontOfSize:17];
    genderValueLabel.textAlignment = NSTextAlignmentCenter;
    
    ageValueLabel.textColor = [UIColor grayColor];
    ageValueLabel.font = [UIFont systemFontOfSize:17];
    ageValueLabel.textAlignment = NSTextAlignmentCenter;
    
    waistlineValueLabel.textColor = [UIColor grayColor];
    waistlineValueLabel.font = [UIFont systemFontOfSize:17];
    waistlineValueLabel.textAlignment = NSTextAlignmentCenter;
    
    heightValueLabel.textColor = [UIColor grayColor];
    heightValueLabel.font = [UIFont systemFontOfSize:17];
    heightValueLabel.textAlignment = NSTextAlignmentCenter;
    
    weightValueLabel.textColor = [UIColor grayColor];
    weightValueLabel.font = [UIFont systemFontOfSize:17];
    weightValueLabel.textAlignment = NSTextAlignmentCenter;
    
    bmiValueLabel.textColor = [UIColor grayColor];
    bmiValueLabel.font = [UIFont systemFontOfSize:17];
    bmiValueLabel.textAlignment = NSTextAlignmentCenter;
    
    relativesSituationValueLabel.textColor = [UIColor grayColor];
    relativesSituationValueLabel.font = [UIFont systemFontOfSize:17];
    relativesSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    occupationSituationValueLabel.textColor = [UIColor grayColor];
    occupationSituationValueLabel.font = [UIFont systemFontOfSize:17];
    occupationSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    sportsSituationValueLabel.textColor = [UIColor grayColor];
    sportsSituationValueLabel.font = [UIFont systemFontOfSize:14];
    sportsSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    meatSituationValueLabel.textColor = [UIColor grayColor];
    meatSituationValueLabel.font = [UIFont systemFontOfSize:17];
    meatSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    fruitSituationValueLabel.textColor = [UIColor grayColor];
    fruitSituationValueLabel.font = [UIFont systemFontOfSize:17];
    fruitSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    drinkSituationValueLabel.textColor = [UIColor grayColor];
    drinkSituationValueLabel.font = [UIFont systemFontOfSize:17];
    drinkSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    smokeSituationValueLabel.textColor = [UIColor grayColor];
    smokeSituationValueLabel.font = [UIFont systemFontOfSize:17];
    smokeSituationValueLabel.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:genderValueLabel];
    [view addSubview:ageValueLabel];
    [view addSubview:waistlineValueLabel];
    [view addSubview:heightValueLabel];
    [view addSubview:weightValueLabel];
    [view addSubview:bmiValueLabel];
    [view addSubview:relativesSituationValueLabel];
    [view addSubview:occupationSituationValueLabel];
    [view addSubview:sportsSituationValueLabel];
    [view addSubview:meatSituationValueLabel];
    [view addSubview:fruitSituationValueLabel];
    [view addSubview:drinkSituationValueLabel];
    [view addSubview:smokeSituationValueLabel];
    
    triangleGrayView1 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 151, 15, 15)];
    triangleGrayView2 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 201, 15, 15)];
    triangleGrayView3 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 251, 15, 15)];
    triangleGrayView4 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 301, 15, 15)];
    triangleGrayView5 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 351, 15, 15)];
    triangleGrayView6 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 401, 15, 15)];
    triangleGrayView7 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 451, 15, 15)];
    triangleGrayView8 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 501, 15, 15)];
    triangleGrayView9 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 551, 15, 15)];
    triangleGrayView10 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 601, 15, 15)];
    triangleGrayView11 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 651, 15, 15)];
    triangleGrayView12 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 701, 15, 15)];
    triangleGrayView13 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 751, 15, 15)];
    
    triangleGrayView1.backgroundColor = [UIColor clearColor];
    triangleGrayView2.backgroundColor = [UIColor clearColor];
    triangleGrayView3.backgroundColor = [UIColor clearColor];
    triangleGrayView4.backgroundColor = [UIColor clearColor];
    triangleGrayView5.backgroundColor = [UIColor clearColor];
    triangleGrayView6.backgroundColor = [UIColor clearColor];
    triangleGrayView7.backgroundColor = [UIColor clearColor];
    triangleGrayView8.backgroundColor = [UIColor clearColor];
    triangleGrayView9.backgroundColor = [UIColor clearColor];
    triangleGrayView10.backgroundColor = [UIColor clearColor];
    triangleGrayView11.backgroundColor = [UIColor clearColor];
    triangleGrayView12.backgroundColor = [UIColor clearColor];
    triangleGrayView13.backgroundColor = [UIColor clearColor];
    
    [view addSubview:triangleGrayView1];
    [view addSubview:triangleGrayView2];
    [view addSubview:triangleGrayView3];
    [view addSubview:triangleGrayView4];
    [view addSubview:triangleGrayView5];
    [view addSubview:triangleGrayView6];
    [view addSubview:triangleGrayView7];
    [view addSubview:triangleGrayView8];
    [view addSubview:triangleGrayView9];
    [view addSubview:triangleGrayView10];
    [view addSubview:triangleGrayView11];
    [view addSubview:triangleGrayView12];
    [view addSubview:triangleGrayView13];
    
}
//从只读状态到可更改状态
+ (void)changeProfileElements:(UIView *)view
{
    //viewChange
    [triangleGrayView1 removeFromSuperview];
    [triangleGrayView2 removeFromSuperview];
    [triangleGrayView3 removeFromSuperview];
    [triangleGrayView4 removeFromSuperview];
    [triangleGrayView5 removeFromSuperview];
    //[triangleGrayView6 removeFromSuperview];
    [triangleGrayView7 removeFromSuperview];
    [triangleGrayView8 removeFromSuperview];
    [triangleGrayView9 removeFromSuperview];
    [triangleGrayView10 removeFromSuperview];
    [triangleGrayView11 removeFromSuperview];
    [triangleGrayView12 removeFromSuperview];
    [triangleGrayView13 removeFromSuperview];
    
    genderValueLabel.textColor = [UIColor blackColor];
    ageValueLabel.textColor = [UIColor blackColor];
    waistlineValueLabel.textColor = [UIColor blackColor];
    heightValueLabel.textColor = [UIColor blackColor];
    weightValueLabel.textColor = [UIColor blackColor];
    //bmiValueLabel.textColor = [UIColor blackColor];
    relativesSituationValueLabel.textColor = [UIColor blackColor];
    occupationSituationValueLabel.textColor = [UIColor blackColor];
    sportsSituationValueLabel.textColor = [UIColor blackColor];
    meatSituationValueLabel.textColor = [UIColor blackColor];
    fruitSituationValueLabel.textColor = [UIColor blackColor];
    drinkSituationValueLabel.textColor = [UIColor blackColor];
    smokeSituationValueLabel.textColor = [UIColor blackColor];
    
    triangleBlueView1 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 151, 15, 15)];
    triangleBlueView2 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 201, 15, 15)];
    triangleBlueView3 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 251, 15, 15)];
    triangleBlueView4 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 301, 15, 15)];
    triangleBlueView5 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 351, 15, 15)];
    //triangleBlueView6 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 401, 15, 15)];
    triangleBlueView7 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 451, 15, 15)];
    triangleBlueView8 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 501, 15, 15)];
    triangleBlueView9 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 551, 15, 15)];
    triangleBlueView10 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 601, 15, 15)];
    triangleBlueView11 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 651, 15, 15)];
    triangleBlueView12 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 701, 15, 15)];
    triangleBlueView13 = [[TriangleBlueView alloc]initWithFrame:CGRectMake(323, 751, 15, 15)];
    
    triangleBlueView1.backgroundColor = [UIColor clearColor];
    triangleBlueView2.backgroundColor = [UIColor clearColor];
    triangleBlueView3.backgroundColor = [UIColor clearColor];
    triangleBlueView4.backgroundColor = [UIColor clearColor];
    triangleBlueView5.backgroundColor = [UIColor clearColor];
    //triangleBlueView6.backgroundColor = [UIColor clearColor];
    triangleBlueView7.backgroundColor = [UIColor clearColor];
    triangleBlueView8.backgroundColor = [UIColor clearColor];
    triangleBlueView9.backgroundColor = [UIColor clearColor];
    triangleBlueView10.backgroundColor = [UIColor clearColor];
    triangleBlueView11.backgroundColor = [UIColor clearColor];
    triangleBlueView12.backgroundColor = [UIColor clearColor];
    triangleBlueView13.backgroundColor = [UIColor clearColor];
    
    [view addSubview:triangleBlueView1];
    [view addSubview:triangleBlueView2];
    [view addSubview:triangleBlueView3];
    [view addSubview:triangleBlueView4];
    [view addSubview:triangleBlueView5];
    //[view addSubview:triangleBlueView6];
    [view addSubview:triangleBlueView7];
    [view addSubview:triangleBlueView8];
    [view addSubview:triangleBlueView9];
    [view addSubview:triangleBlueView10];
    [view addSubview:triangleBlueView11];
    [view addSubview:triangleBlueView12];
    [view addSubview:triangleBlueView13];
}
//从可更改状态到只读状态，将saved状态改成yes，供页面函数判断是否弹出退出提醒
+ (void)saveProfileElements:(UIView *)view
{
    [triangleBlueView1 removeFromSuperview];
    [triangleBlueView2 removeFromSuperview];
    [triangleBlueView3 removeFromSuperview];
    [triangleBlueView4 removeFromSuperview];
    [triangleBlueView5 removeFromSuperview];
    //[triangleBlueView6 removeFromSuperview];
    [triangleBlueView7 removeFromSuperview];
    [triangleBlueView8 removeFromSuperview];
    [triangleBlueView9 removeFromSuperview];
    [triangleBlueView10 removeFromSuperview];
    [triangleBlueView11 removeFromSuperview];
    [triangleBlueView12 removeFromSuperview];
    [triangleBlueView13 removeFromSuperview];
    
    //数据读取
    ProfileModel *sharedManagerPM = [ProfileModel sharedManager];
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    //data
    //saved状态改变
    sharedManagerPF.saved = YES;
    
    //将profile各值存入label中，使得退出当前页面label中的值也能保存
    genderValueLabel.text = sharedManagerPF.profileGenderString;
    ageValueLabel.text = sharedManagerPF.profileAgeString;
    waistlineValueLabel.text = sharedManagerPF.profileWaistlineString;
    weightValueLabel.text = sharedManagerPF.profileWeightString;
    heightValueLabel.text = sharedManagerPF.profileHeightString;
    [ProfileFunc bmiCalculate];
    bmiValueLabel.text = sharedManagerPF.profileBMIString;
    relativesSituationValueLabel.text = sharedManagerPF.profileRelativesSituationString;
    occupationSituationValueLabel.text = sharedManagerPF.profileOccupationSituationString;
    sportsSituationValueLabel.text = sharedManagerPF.profileSportsSituationString;
    meatSituationValueLabel.text = sharedManagerPF.profileMeatSituationString;
    fruitSituationValueLabel.text = sharedManagerPF.profileFruitSituationString;
    drinkSituationValueLabel.text = sharedManagerPF.profileDrinkSituationString;
    smokeSituationValueLabel.text = sharedManagerPF.profileSmokeSituationString;
    NSLog(@"data: %@",sharedManagerPF.profileSmokeSituationString);
    
    //数据集中存储到DM中便于一起存储到数据库中
    sharedManagerPM.usernameString = sharedManagerPF.profileUsernameString;
    sharedManagerPM.phoneNumString = sharedManagerPF.profilePhoneNumString;
    NSLog(@"saveUsername/phoneNum: %@",sharedManagerPF.profileUsernameString);
    sharedManagerPM.genderString = sharedManagerPF.profileGenderString;
    sharedManagerPM.ageString = sharedManagerPF.profileAgeString;
    sharedManagerPM.waistlineString = sharedManagerPF.profileWaistlineString;
    sharedManagerPM.weightString = sharedManagerPF.profileWeightString;
    sharedManagerPM.heightString = sharedManagerPF.profileHeightString;
    sharedManagerPM.bmiString = sharedManagerPF.profileBMIString;
    NSLog(@"saveProfileBMI: %@",sharedManagerPF.profileBMIString);
    sharedManagerPM.relativesSituationString = sharedManagerPF.profileRelativesSituationString;
    sharedManagerPM.occupationSituationString = sharedManagerPF.profileOccupationSituationString;
    sharedManagerPM.sportsSituationString = sharedManagerPF.profileSportsSituationString;
    sharedManagerPM.meatSituationString = sharedManagerPF.profileMeatSituationString;
    sharedManagerPM.fruitSituationString = sharedManagerPF.profileFruitSituationString;
    sharedManagerPM.drinkSituationString = sharedManagerPF.profileDrinkSituationString;
    sharedManagerPM.smokeSituationString = sharedManagerPF.profileSmokeSituationString;

    
    //TO DO:数据集体保存数据库中
    //view
    genderValueLabel.textColor = [UIColor grayColor];
    ageValueLabel.textColor = [UIColor grayColor];
    waistlineValueLabel.textColor = [UIColor grayColor];
    heightValueLabel.textColor = [UIColor grayColor];
    weightValueLabel.textColor = [UIColor grayColor];
    //bmiValueLabel.textColor = [UIColor grayColor];
    relativesSituationValueLabel.textColor = [UIColor grayColor];
    occupationSituationValueLabel.textColor = [UIColor grayColor];
    sportsSituationValueLabel.textColor = [UIColor grayColor];
    meatSituationValueLabel.textColor = [UIColor grayColor];
    fruitSituationValueLabel.textColor = [UIColor grayColor];
    drinkSituationValueLabel.textColor = [UIColor grayColor];
    smokeSituationValueLabel.textColor = [UIColor grayColor];
    
    triangleGrayView1 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 151, 15, 15)];
    triangleGrayView2 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 201, 15, 15)];
    triangleGrayView3 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 251, 15, 15)];
    triangleGrayView4 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 301, 15, 15)];
    triangleGrayView5 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 351, 15, 15)];
    //triangleGrayView6 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 401, 15, 15)];
    triangleGrayView7 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 451, 15, 15)];
    triangleGrayView8 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 501, 15, 15)];
    triangleGrayView9 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 551, 15, 15)];
    triangleGrayView10 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 601, 15, 15)];
    triangleGrayView11 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 651, 15, 15)];
    triangleGrayView12 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 701, 15, 15)];
    triangleGrayView13 = [[TriangleGrayView alloc]initWithFrame:CGRectMake(323, 751, 15, 15)];
    
    triangleGrayView1.backgroundColor = [UIColor clearColor];
    triangleGrayView2.backgroundColor = [UIColor clearColor];
    triangleGrayView3.backgroundColor = [UIColor clearColor];
    triangleGrayView4.backgroundColor = [UIColor clearColor];
    triangleGrayView5.backgroundColor = [UIColor clearColor];
    //triangleGrayView6.backgroundColor = [UIColor clearColor];
    triangleGrayView7.backgroundColor = [UIColor clearColor];
    triangleGrayView8.backgroundColor = [UIColor clearColor];
    triangleGrayView9.backgroundColor = [UIColor clearColor];
    triangleGrayView10.backgroundColor = [UIColor clearColor];
    triangleGrayView11.backgroundColor = [UIColor clearColor];
    triangleGrayView12.backgroundColor = [UIColor clearColor];
    triangleGrayView13.backgroundColor = [UIColor clearColor];
    
    [view addSubview:triangleGrayView1];
    [view addSubview:triangleGrayView2];
    [view addSubview:triangleGrayView3];
    [view addSubview:triangleGrayView4];
    [view addSubview:triangleGrayView5];
    //[view addSubview:triangleGrayView6];
    [view addSubview:triangleGrayView7];
    [view addSubview:triangleGrayView8];
    [view addSubview:triangleGrayView9];
    [view addSubview:triangleGrayView10];
    [view addSubview:triangleGrayView11];
    [view addSubview:triangleGrayView12];
    [view addSubview:triangleGrayView13];
}

+ (void)bmiCalculate
{
    float bmiValue1;
    float bmiValue2;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    if (([sharedManagerPF.profileHeightString isEqualToString:@"- -"]) || ([sharedManagerPF.profileWeightString isEqualToString:@"- -"] ))
    {
        sharedManagerPF.profileBMIString = @"- -";
        NSLog(@"profileBMI: %@",sharedManagerPF.profileBMIString);
        
    } else {
        bmiValue1 = [sharedManagerPF.profileHeightString floatValue] * [sharedManagerPF.profileHeightString floatValue];
        bmiValue1 = bmiValue1 / 10000; //厘米转米
        bmiValue2 = [sharedManagerPF.profileWeightString floatValue] / bmiValue1;
        bmiValue2 = round(bmiValue2*100)/100;  //round(12345.6789) 结果为：12346 取小数点后两位，先乘100舍完再除100
        sharedManagerPF.profileBMIString = [NSString stringWithFormat:@"%.2f",bmiValue2];  //.2f取前2位小数
        //round后成100得2122.000000，再除100后21.219999，截取小数点后两位为题解决
        
        NSLog(@"CauprofileBMI: %@",sharedManagerPF.profileBMIString);
    }
}


+ (void)genderChangedButtonPressed
{
    NSLog(@"genderChanged");
    
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"性别选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileGender = @"男";
        if([sharedManagerPF.tempProfileGender isEqualToString:sharedManagerPF.profileGenderString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileGenderString = sharedManagerPF.tempProfileGender;
            genderValueLabel.text = sharedManagerPF.tempProfileGender;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileGender = @"女";
        if([sharedManagerPF.tempProfileGender isEqualToString:sharedManagerPF.profileGenderString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileGenderString = sharedManagerPF.tempProfileGender;
            genderValueLabel.text = sharedManager.tempProfileGender;
        }
    }];
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)ageChangedButtonPressed:(UIViewController *)viewController
{
    NSLog(@"ageChangedButtonPressed");
    UIView *pickerView = [ProfileFunc addPickerBackground:@"单位：岁" withButtonName:@"age"];
    
    UIViewController *pickerViewController = [[AgePickerViewController alloc]init];
    //保障控件可以添加到页面当中
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

//+函数不能调用-函数
+ (void)ageChangeConfirmed
{
    [ProfileFunc removePickerBackground];
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    NSLog(@"ageChangeConfirmed：%@",sharedManagerPF.tempProfileAge);
    
    //点击confirm时，temp值已更新。首先判断新的temp值和初始时从DM中取值后的profile值是否相同，不相同再更改changed状态
    if([sharedManagerPF.tempProfileAge isEqualToString:sharedManagerPF.profileAgeString] == NO){
        if(sharedManagerPF.changed == NO){
            sharedManagerPF.changed = YES;
        }
        //确认后将临时值赋予profile，用于上传给DM做数据存储
        sharedManagerPF.profileAgeString = sharedManagerPF.tempProfileAge;
        //点击确定后将临时值而不是profile值赋予label，使得未点击保存按钮退出profile页面，信息不会保存
        ageValueLabel.text = sharedManagerPF.tempProfileAge;
    }
}

+ (void)waistlineChangedButtonPressed:(UIViewController *)viewController
{
    NSLog(@"ageChangedButtonPressed");
    UIView *pickerView = [ProfileFunc addPickerBackground:@"单位：cm" withButtonName:@"waistline"];
    
    UIViewController *pickerViewController = [[WaistlinePickerViewController alloc]init];
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+ (void)waistlineChangeConfirmed
{
    [ProfileFunc removePickerBackground];
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    NSLog(@"ageChangeConfirmed：%@",sharedManagerPF.tempProfileWaistline);
    
    //点击confirm时，temp值已更新。首先判断新的temp值和初始时从DM中取值后的profile值是否相同，不相同再更改changed状态
    if([sharedManagerPF.tempProfileWaistline isEqualToString:sharedManagerPF.profileWaistlineString] == NO){
        if(sharedManagerPF.changed == NO){
            sharedManagerPF.changed = YES;
        }
        //确认后将临时值赋予profile，用于上传给DM做数据存储
        sharedManagerPF.profileWaistlineString = sharedManagerPF.tempProfileWaistline;
        //点击确定后将临时值而不是profile值赋予label，使得未点击保存按钮退出profile页面，信息不会保存
        waistlineValueLabel.text = sharedManagerPF.tempProfileWaistline;
    }
}

+ (void)heightChangedButtonPressed:(UIViewController *)viewController
{
    NSLog(@"heightChangedButtonPressed");
    UIView *pickerView = [ProfileFunc addPickerBackground:@"单位：cm" withButtonName:@"height"];
    UIViewController *pickerViewController = [[HeightPickerViewController alloc]init];
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+ (void)heightChangeConfirmed
{
    [ProfileFunc removePickerBackground];
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    NSLog(@"ageChangeConfirmed：%@",sharedManagerPF.tempProfileHeight);
    
    //点击confirm时，temp值已从picker控件中（被赋予默认值或新值）更新。首先判断新的temp值和初始时从DM中取值后的profile值是否相同，不相同再更改changed状态
    if([sharedManagerPF.tempProfileHeight isEqualToString:sharedManagerPF.profileHeightString] == NO){
        if(sharedManagerPF.changed == NO){
            sharedManagerPF.changed = YES;
        }
        //确认后将临时值赋予profile，用于上传给DM做数据存储
        sharedManagerPF.profileHeightString = sharedManagerPF.tempProfileHeight;
        //点击确定后将临时值而不是profile值赋予label，使得未点击保存按钮退出profile页面，信息不会保存
        heightValueLabel.text = sharedManagerPF.tempProfileHeight;
    }
}

+ (void)weightChangedButtonPressed:(UIViewController *)viewController
{
    NSLog(@"weightChangedButtonPressed");
    UIView *pickerView = [ProfileFunc addPickerBackground:@"单位：kg" withButtonName:@"weight"];
    UIViewController *pickerViewController = [[WeightPickerViewController alloc]init];
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+ (void)weightChangeConfirmed
{
    [ProfileFunc removePickerBackground];
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    NSLog(@"ageChangeConfirmed：%@",sharedManagerPF.tempProfileWeight);
    
    //点击confirm时，temp值已从picker控件中（被赋予默认值或新值）更新。首先判断新的temp值和初始时从DM中取值后的profile值是否相同，不相同再更改changed状态
    if([sharedManagerPF.tempProfileWeight isEqualToString:sharedManagerPF.profileWeightString] == NO){
        if(sharedManagerPF.changed == NO){
            sharedManagerPF.changed = YES;
        }
        //确认后将临时值赋予profile，用于上传给DM做数据存储
        sharedManagerPF.profileWeightString = sharedManagerPF.tempProfileWeight;
        //点击确定后将临时值而不是profile值赋予label，使得未点击保存按钮退出profile页面，信息不会保存
        weightValueLabel.text = sharedManagerPF.tempProfileWeight;
    }
}

+ (void)bmiChangedButtonPressed
{
    NSLog(@"bmiChangedButtonPressed");
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"BMI" message:@"BMI数值会根据您输入的身高，体重信息自动计算" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)relativesSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"亲属糖尿病病史选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"兄弟姐妹中有患病" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileRelativesSituation = @"兄弟姐妹中有患病";
        if([sharedManagerPF.tempProfileRelativesSituation isEqualToString:sharedManagerPF.profileRelativesSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileRelativesSituationString = sharedManagerPF.tempProfileRelativesSituation;
            relativesSituationValueLabel.text = sharedManagerPF.tempProfileRelativesSituation;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"双亲中一人患病" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileRelativesSituation = @"双亲中一人患病";
        if([sharedManagerPF.tempProfileRelativesSituation isEqualToString:sharedManagerPF.profileRelativesSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileRelativesSituationString = sharedManagerPF.tempProfileRelativesSituation;
            relativesSituationValueLabel.text = sharedManagerPF.tempProfileRelativesSituation;
        }
        
    }];
    UIAlertAction *situation3Action = [UIAlertAction actionWithTitle:@"双亲均患病" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileRelativesSituation = @"双亲均患病";
        if([sharedManagerPF.tempProfileRelativesSituation isEqualToString:sharedManagerPF.profileRelativesSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileRelativesSituationString = sharedManagerPF.tempProfileRelativesSituation;
            relativesSituationValueLabel.text = sharedManagerPF.tempProfileRelativesSituation;
        }
    }];
    UIAlertAction *situation4Action = [UIAlertAction actionWithTitle:@"亲属无人患病" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileRelativesSituation = @"亲属无人患病";
        if([sharedManagerPF.tempProfileRelativesSituation isEqualToString:sharedManagerPF.profileRelativesSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileRelativesSituationString = sharedManagerPF.tempProfileRelativesSituation;
            relativesSituationValueLabel.text = sharedManagerPF.tempProfileRelativesSituation;
        }
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [alertController addAction:situation3Action];
    [alertController addAction:situation4Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)occupationSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"职业情况选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"无体力劳动" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileOccupationSituation = @"无体力劳动";
        if([sharedManagerPF.tempProfileOccupationSituation isEqualToString:sharedManagerPF.profileOccupationSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileOccupationSituationString = sharedManagerPF.tempProfileOccupationSituation;
            occupationSituationValueLabel.text = sharedManagerPF.tempProfileOccupationSituation;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"轻体力劳动" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileOccupationSituation = @"轻体力劳动";
        if([sharedManagerPF.tempProfileOccupationSituation isEqualToString:sharedManagerPF.profileOccupationSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileOccupationSituationString = sharedManagerPF.tempProfileOccupationSituation;
            occupationSituationValueLabel.text = sharedManagerPF.tempProfileOccupationSituation;
        }
    }];
    UIAlertAction *situation3Action = [UIAlertAction actionWithTitle:@"重体力劳动" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileOccupationSituation = @"重体力劳动";
        if([sharedManagerPF.tempProfileOccupationSituation isEqualToString:sharedManagerPF.profileOccupationSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileOccupationSituationString = sharedManagerPF.tempProfileOccupationSituation;
            occupationSituationValueLabel.text = sharedManagerPF.tempProfileOccupationSituation;
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [alertController addAction:situation3Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)sportsSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"运动状况选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"日中等强度体力活动 < 30min" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileSportsSituation = @"日中等强度体力活动 < 30min";
        if([sharedManagerPF.tempProfileSportsSituation isEqualToString:sharedManagerPF.profileSportsSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileSportsSituationString = sharedManagerPF.tempProfileSportsSituation;
            sportsSituationValueLabel.text = sharedManagerPF.tempProfileSportsSituation;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"日中等强度体力活动 > 30min" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileSportsSituation = @"日中等强度体力活动 > 30min";
        if([sharedManagerPF.tempProfileSportsSituation isEqualToString:sharedManagerPF.profileSportsSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileSportsSituationString = sharedManagerPF.tempProfileSportsSituation;
            sportsSituationValueLabel.text = sharedManagerPF.tempProfileSportsSituation;
        }
    }];
    UIAlertAction *situation3Action = [UIAlertAction actionWithTitle:@"周重体力活动 < 60min" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileSportsSituation = @"周重体力活动 < 60min";
        if([sharedManagerPF.tempProfileSportsSituation isEqualToString:sharedManagerPF.profileSportsSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileSportsSituationString = sharedManagerPF.tempProfileSportsSituation;
            sportsSituationValueLabel.text = sharedManagerPF.tempProfileSportsSituation;
        }
    }];
    UIAlertAction *situation4Action = [UIAlertAction actionWithTitle:@"周重体力活动 > 60min" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileSportsSituation = @"周重体力活动 > 60min";
        if([sharedManagerPF.tempProfileSportsSituation isEqualToString:sharedManagerPF.profileSportsSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileSportsSituationString = sharedManagerPF.tempProfileSportsSituation;
            sportsSituationValueLabel.text = sharedManagerPF.tempProfileSportsSituation;
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [alertController addAction:situation3Action];
    [alertController addAction:situation4Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)meatSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"肉类食物进食状况选择" message:@"不包括海鲜" preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"日进食 < 200g" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileMeatSituation = @"日进食 < 200g";
        if([sharedManagerPF.tempProfileMeatSituation isEqualToString:sharedManagerPF.profileMeatSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileMeatSituationString = sharedManagerPF.tempProfileMeatSituation;
            meatSituationValueLabel.text = sharedManagerPF.tempProfileMeatSituation;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"日进食 > 200g" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileMeatSituation = @"日进食 > 200g";
        if([sharedManagerPF.tempProfileMeatSituation isEqualToString:sharedManagerPF.profileMeatSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileMeatSituationString = sharedManagerPF.tempProfileMeatSituation;
            meatSituationValueLabel.text = sharedManagerPF.tempProfileMeatSituation;
        }
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)fruitSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"水果蔬菜进食状况选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"日进食 < 2次" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileFruitSituation = @"日进食 < 2次";
        if([sharedManagerPF.tempProfileFruitSituation isEqualToString:sharedManagerPF.profileFruitSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileFruitSituationString = sharedManagerPF.tempProfileFruitSituation;
            fruitSituationValueLabel.text = sharedManagerPF.tempProfileFruitSituation;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"日进食 > 2次" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileFruitSituation = @"日进食 > 2次";
        if([sharedManagerPF.tempProfileFruitSituation isEqualToString:sharedManagerPF.profileFruitSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileFruitSituationString = sharedManagerPF.tempProfileFruitSituation;
            fruitSituationValueLabel.text = sharedManagerPF.tempProfileFruitSituation;
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)drinkSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"饮酒状况选择" message:@"每杯酒指含乙醇10g的任何酒类" preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"不饮酒" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileDrinkSituationString = @"不饮酒";
        if([sharedManagerPF.tempProfileDrinkSituationString isEqualToString:sharedManagerPF.profileDrinkSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileDrinkSituationString = sharedManagerPF.tempProfileDrinkSituationString;
            drinkSituationValueLabel.text = sharedManagerPF.tempProfileDrinkSituationString;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"日饮 < 4杯" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileDrinkSituationString = @"日饮 < 4杯";
        if([sharedManagerPF.tempProfileDrinkSituationString isEqualToString:sharedManagerPF.profileDrinkSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileDrinkSituationString = sharedManagerPF.tempProfileDrinkSituationString;
            drinkSituationValueLabel.text = sharedManagerPF.tempProfileDrinkSituationString;
        }
    }];
    UIAlertAction *situation3Action = [UIAlertAction actionWithTitle:@"日饮 > 4杯" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileDrinkSituationString = @"日饮 > 4杯";
        if([sharedManagerPF.tempProfileDrinkSituationString isEqualToString:sharedManagerPF.profileDrinkSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileDrinkSituationString = sharedManagerPF.tempProfileDrinkSituationString;
            drinkSituationValueLabel.text = sharedManagerPF.tempProfileDrinkSituationString;
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [alertController addAction:situation3Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)smokeSituationChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"吸烟状况选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"不吸烟" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileSmokeSituationString = @"不吸烟";
        if([sharedManagerPF.tempProfileSmokeSituationString isEqualToString:sharedManagerPF.profileSmokeSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileSmokeSituationString = sharedManagerPF.tempProfileSmokeSituationString;
            smokeSituationValueLabel.text = sharedManagerPF.tempProfileSmokeSituationString;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"吸烟" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileSmokeSituationString = @"吸烟";
        if([sharedManagerPF.tempProfileSmokeSituationString isEqualToString:sharedManagerPF.profileSmokeSituationString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileSmokeSituationString = sharedManagerPF.tempProfileSmokeSituationString;
            smokeSituationValueLabel.text = sharedManagerPF.tempProfileSmokeSituationString;
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)bloodPressureValueChangedButtonPressed
{
    UIViewController *rootViewController;
    UIAlertController *alertController;
    
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    alertController = [UIAlertController alertControllerWithTitle:@"高血压状况选择" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *situation1Action = [UIAlertAction actionWithTitle:@"无高压病史" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileBloodPressure = @"无高压病史";
        if([sharedManagerPF.tempProfileBloodPressure isEqualToString:sharedManagerPF.profileBloodPressureString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileBloodPressureString = sharedManagerPF.tempProfileBloodPressure;
            bloodPressureValueLabel.text = sharedManagerPF.tempProfileBloodPressure;
        }
    }];
    UIAlertAction *situation2Action = [UIAlertAction actionWithTitle:@"有高压病史" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        sharedManagerPF.tempProfileBloodPressure = @"有高压病史";
        if([sharedManagerPF.tempProfileBloodPressure isEqualToString:sharedManagerPF.profileBloodPressureString] == NO)
        {
            if(sharedManagerPF.changed == NO){
                sharedManagerPF.changed = YES;
            }
            sharedManagerPF.profileBloodPressureString = sharedManagerPF.tempProfileBloodPressure;
            bloodPressureValueLabel.text = sharedManagerPF.tempProfileBloodPressure;
        }
        
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:situation1Action];
    [alertController addAction:situation2Action];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
}




@end
