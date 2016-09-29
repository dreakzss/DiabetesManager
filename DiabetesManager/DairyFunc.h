//
//  DairyFunc.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/4.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalFunc.h"
#import "GlobalDef.h"
#import <UIKit/UIKit.h>
#import "DairyModel.h"

@interface DairyFunc : NSObject

+ (void)initMealTypeButtonsStatus;

+ (void)initMealTypeButtons:(UIView *)view;

+ (void)initDiabetesDairy:(UIView *)view;

+ (void)initAddDiabetesLabels:(UIView *)view;

+ (void)diabetesTimeChangeButtonPressed:(UIViewController *)viewController;

+ (void)mealTypeChangeButtonPressed:(UIViewController *)viewController;

+ (Boolean)verifyAddDiabetesDataContact:(NSString *)beforeString withAfter:(NSString *)afterString;

+ (void)saveNewDiabetesDairyCellArray:(NSString *)beforeString withAfter:(NSString *)afterString;



+ (void)initBMIDairy:(UIView *)view;

+ (void)initAddBMILabels:(UIView *)view;

+ (void)bmiTimeChangeButtonPressed:(UIViewController *)viewController;


+ (Boolean)verifyAddBMIDataContact:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString;

+ (void)saveNewBMIDairyCellArray:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString;

@end
