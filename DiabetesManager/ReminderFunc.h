//
//  ReminderFunc.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/1.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalFunc.h"
#import "GlobalDef.h"
#import "MedCellView.h"
#import <UIKit/UIKit.h>
@interface ReminderFunc : NSObject

#pragma mark - Med
+ (void)initMedicineReminder:(UIView *)view isReload:(NSInteger)reload;

+ (void)medEditButtonPressed:(NSInteger)index;

+ (void)medSwitchSelected:(NSInteger)index withStatus:(bool)isOn;

+ (void)medTimeChangeButtonPressed:(UIViewController *)viewController;

+ (void)medDosageChangeButtonPressed:(UIViewController *)viewController;

+ (void)medUnitChangeButtonPressed:(UIViewController *)viewController;

+ (void)saveNewMedReminderCellArray:(NSString *)medName;

+ (void)saveEditMedReminderCellArray:(NSString *)medName;

+ (void)initAddMedLabels:(UIView *)view;

+(void)isMedEditYes;

+(void)isMedEditNo;

+(Boolean)medEditStatus;

+(NSString *)getMedName;

//+ (void)initTempMedCellData;

+ (Boolean)verifyMedDataContact:(NSString *)medName;



#pragma mark - Sports
+ (void)initSportsReminder:(UIView *)view isReload:(NSInteger)reload;

+ (void)sportsEditButtonPressed:(NSInteger)index;

+ (void)sportsSwitchSelected:(NSInteger)index withStatus:(bool)isOn;

+ (void)sportsTimeChangeButtonPressed:(UIViewController *)viewController;

+ (void)exerciseTimeChangeButtonPressed:(UIViewController *)viewController;

+ (void)saveNewSportsReminderCellArray:(NSString *)sportsName;

+ (void)saveEditSportsReminderCellArray:(NSString *)sportsName;

+ (void)initAddSportsLabels:(UIView *)view;

+(void)isSportsEditYes;

+(void)isSportsEditNo;

+(Boolean)sportsEditStatus;

+(NSString *)getSportsName;

//+ (void)initTempMedCellData;

+ (Boolean)verifySportsDataContact:(NSString *)sportsName;




#pragma mark - Global
+ (void)moveForwardFromView:(UIView *)fromView
      moveForwardToEditView:(UIView *)toView;

+ (void)moveBackFromAddView:(UIView *)fromView
             moveBackToView:(UIView *)toView;

@end
