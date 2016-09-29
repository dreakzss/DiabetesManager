//
//  ProfileFunc.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/7/23.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "ProfileModel.h"
#import "AgePickerViewController.h"
#import "WaistlinePickerViewController.h"
#import "HeightPickerViewController.h"
#import "WeightPickerViewController.h"
#import "GlucosePickerViewController.h"
#import "CholesterolPickerViewController.h"
#import "TriglyceridePickerViewController.h"
#import "TriangleGrayView.h"
#import "TriangleBlueView.h"

@interface ProfileFunc : NSObject

#pragma mark - Profile  Variable
@property NSString *profileUsernameString;
@property NSString *profilePhoneNumString;
@property NSString *profileGenderString;
@property NSString *profileAgeString;
@property NSString *profileWaistlineString;
@property NSString *profileHeightString;
@property NSString *profileWeightString;
@property NSString *profileBMIString;
@property NSString *profileRelativesSituationString;
@property NSString *profileOccupationSituationString;
@property NSString *profileSportsSituationString;
@property NSString *profileMeatSituationString;
@property NSString *profileFruitSituationString;
@property NSString *profileDrinkSituationString;
@property NSString *profileSmokeSituationString;
@property NSString *profileGlucoseString;
@property NSString *profileBloodPressureString;
@property NSString *profileCholesterolString;
@property NSString *profileTriglycerideString;

//调用picker时会将picker中的数值存储到temp中，点击确认后将temp赋予profile各值中
@property NSString *tempUsernameString;
@property NSString *tempPhoneNumString;
@property NSString *tempProfileGender;
@property NSString *tempProfileAge;
@property NSString *tempProfileWaistline;
@property NSString *tempProfileHeight;
@property NSString *tempProfileWeight;
@property NSString *tempProfileBMI;
@property NSString *tempProfileRelativesSituation;
@property NSString *tempProfileOccupationSituation;
@property NSString *tempProfileSportsSituation;
@property NSString *tempProfileMeatSituation;
@property NSString *tempProfileFruitSituation;
@property NSString *tempProfileDrinkSituationString;
@property NSString *tempProfileSmokeSituationString;
@property NSString *tempProfileGlucose;
@property NSString *tempProfileBloodPressure;
@property NSString *tempProfileCholesterol;
@property NSString *tempProfileTriglyceride;

@property BOOL saved;
@property BOOL changed;

+ (ProfileFunc *)sharedManager;

#pragma mark - Profile
+ (void)moveBackFromProfile:(UIView *)fromView
             moveBackToView:(UIView *)toView;

+ (void)initProfileElements:(UIView *)view;

+ (void)changeProfileElements:(UIView *)view;

+ (void)saveProfileElements:(UIView *)view;

+ (void)getProfileDataFromDM;

+ (void)genderChangedButtonPressed;

+ (void)ageChangedButtonPressed:(UIViewController *)viewController;

+ (void)waistlineChangedButtonPressed:(UIViewController *)viewController;

+ (void)heightChangedButtonPressed:(UIViewController *)viewController;

+ (void)weightChangedButtonPressed:(UIViewController *)viewController;

+ (void)bmiChangedButtonPressed;

+ (void)relativesSituationChangedButtonPressed;

+ (void)occupationSituationChangedButtonPressed;

+ (void)sportsSituationChangedButtonPressed;

+ (void)meatSituationChangedButtonPressed;

+ (void)fruitSituationChangedButtonPressed;

+ (void)drinkSituationChangedButtonPressed;

+ (void)smokeSituationChangedButtonPressed;

+ (void)bloodPressureValueChangedButtonPressed;

//+ (void)glucoseValueChangedButtonPressed:(UIViewController *)viewController;

//+ (void)cholesterolValueChangedButtonPressed:(UIViewController *)viewController;

//+ (void)triglycerideValueChangedButtonPressed:(UIViewController *)viewController;

@end
