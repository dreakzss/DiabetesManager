//
//  DairyModel.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/4.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DairyModel : NSObject

+ (DairyModel *)sharedManager;

+ (void)getDiabetesDairyColumeArray;

+ (void)initNewDiabetesCellData;

+ (void)saveNewDiabetesDairyCellArray:(NSString *)beforeString withAfter:(NSString *)afterString;

//早中晚餐
@property NSMutableArray *diabetesDairyColumeArray1;
@property NSMutableArray *diabetesDairyColumeArray2;
@property NSMutableArray *diabetesDairyColumeArray3;

@property NSMutableArray *newdiabetesCellArray;

@property NSDate *tempDiabetesDate;
@property NSString *tempDiabetesDateString;
@property NSString *tempMealTypeString;

@property NSString *tempBeforeString;
@property NSString *tempAfterString;



+ (void)getBMIDairyColumeArray;

+ (void)initNewBMICellData;

+ (void)saveNewBMIDairyCellArray:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString;


@property NSMutableArray *bmiDairyColumeArray;
@property NSMutableArray *newbmiCellArray;

@property NSDate *tempBMIDate;
@property NSString *tempBMIDateString;
@property NSString *tempHeightString;
@property NSString *tempWeightString;
@property NSString *tempWaistlineString;
@property NSString *tempBMIString;

@end
