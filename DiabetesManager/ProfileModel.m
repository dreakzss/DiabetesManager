//
//  ProfileModel.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/7/24.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "ProfileModel.h"

@implementation ProfileModel

//声明全局
static ProfileModel *sharedManager = nil;

+ (ProfileModel *)sharedManager
{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        
    });
    return sharedManager;
}

- (void)initProfileData
{
    //如果数据没有赋值，默认显示 - -
    if (sharedManager.usernameString == nil) {
        //NSLog(@"string is null");
        sharedManager.usernameString = @"TA";
    }
    if (sharedManager.phoneNumString == nil) {
        //NSLog(@"string is null");
        sharedManager.phoneNumString = @"- -";
    }
    if (sharedManager.genderString == nil) {
        //NSLog(@"string is null");
        sharedManager.genderString = @"- -";
    }
    if (sharedManager.ageString == nil) {
        //NSLog(@"string is null");
        sharedManager.ageString = @"- -";
    }
    if (sharedManager.waistlineString == nil) {
        //NSLog(@"string is null");
        sharedManager.waistlineString = @"- -";
    }
    if (sharedManager.heightString == nil) {
        //NSLog(@"string is null");
        sharedManager.heightString = @"- -";
    }
    if (sharedManager.weightString == nil) {
        //NSLog(@"string is null");
        sharedManager.weightString = @"- -";
    }
    if (sharedManager.bmiString == nil) {
        //NSLog(@"string is null");
        sharedManager.bmiString = @"- -";
    }
    if (sharedManager.relativesSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.relativesSituationString = @"- -";
    }
    if (sharedManager.occupationSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.occupationSituationString = @"- -";
    }
    if (sharedManager.sportsSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.sportsSituationString = @"- -";
    }
    if (sharedManager.meatSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.meatSituationString = @"- -";
    }
    if (sharedManager.fruitSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.fruitSituationString = @"- -";
    }
    if (sharedManager.drinkSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.drinkSituationString = @"- -";
    }
    if (sharedManager.smokeSituationString == nil) {
        //NSLog(@"string is null");
        sharedManager.smokeSituationString = @"- -";
    }
    if (sharedManager.glucoseString == nil) {
        //NSLog(@"string is null");
        sharedManager.glucoseString = @"- -";
    }
    if (sharedManager.bloodPressureString == nil) {
        //NSLog(@"string is null");
        sharedManager.bloodPressureString = @"- -";
    }
    if (sharedManager.cholesterolString == nil) {
        //NSLog(@"string is null");
        sharedManager.cholesterolString = @"- -";
    }
    if (sharedManager.triglycerideSttring == nil) {
        //NSLog(@"string is null");
        sharedManager.triglycerideSttring = @"- -";
    }
    
    //sharedManager.ageString = @"age12";
    //NSLog(@"%@",sharedManager.ageString);
    
}

@end
