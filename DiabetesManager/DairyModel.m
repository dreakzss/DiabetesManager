//
//  DairyModel.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/4.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "DairyModel.h"

@implementation DairyModel

static DairyModel *sharedManager = nil;

+ (DairyModel *)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

#pragma mark - Diabetes

+ (void)getDiabetesDairyColumeArray
{
    
    //从数据库获取信息
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    //初始为nil才初始化, 删除后不为nil
    if (sharedManagerDM.diabetesDairyColumeArray1 == nil) {
        
        sharedManagerDM.diabetesDairyColumeArray1 = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [dateFormatter dateFromString:@"2016-05-04"];
        NSDate *date2 = [dateFormatter dateFromString:@"2016-05-07"];
        NSDate *date3 = [dateFormatter dateFromString:@"2016-05-09"];
        NSDate *date4 = [dateFormatter dateFromString:@"2016-05-11"];
        NSDate *date5 = [dateFormatter dateFromString:@"2016-05-13"];
        
        NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:date1,@"7.3",@"11.4", nil];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:date2,@"8.4",@"12.4", nil];
        NSMutableArray *array3 = [[NSMutableArray alloc] initWithObjects:date3,@"9.2",@"13.5", nil];
        NSMutableArray *array4 = [[NSMutableArray alloc] initWithObjects:date4,@"6.9",@"10.8", nil];
        NSMutableArray *array5 = [[NSMutableArray alloc] initWithObjects:date5,@"7.7",@"12.7", nil];
        
        [sharedManagerDM.diabetesDairyColumeArray1 addObject:array1];
        [sharedManagerDM.diabetesDairyColumeArray1 addObject:array2];
        [sharedManagerDM.diabetesDairyColumeArray1 addObject:array3];
        [sharedManagerDM.diabetesDairyColumeArray1 addObject:array4];
        [sharedManagerDM.diabetesDairyColumeArray1 addObject:array5];
    }
    
    if (sharedManagerDM.diabetesDairyColumeArray2 == nil) {
        
        sharedManagerDM.diabetesDairyColumeArray2 = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [dateFormatter dateFromString:@"2016-05-04"];
        NSDate *date2 = [dateFormatter dateFromString:@"2016-05-07"];
        NSDate *date3 = [dateFormatter dateFromString:@"2016-05-09"];
        NSDate *date4 = [dateFormatter dateFromString:@"2016-05-11"];
        NSDate *date5 = [dateFormatter dateFromString:@"2016-05-13"];
        
        NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:date1,@"8.3",@"12.3", nil];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:date2,@"9.1",@"13.4", nil];
        NSMutableArray *array3 = [[NSMutableArray alloc] initWithObjects:date3,@"9.8",@"14.1", nil];
        NSMutableArray *array4 = [[NSMutableArray alloc] initWithObjects:date4,@"7.2",@"12.6", nil];
        NSMutableArray *array5 = [[NSMutableArray alloc] initWithObjects:date5,@"7.6",@"13.2", nil];
        
        [sharedManagerDM.diabetesDairyColumeArray2 addObject:array1];
        [sharedManagerDM.diabetesDairyColumeArray2 addObject:array2];
        [sharedManagerDM.diabetesDairyColumeArray2 addObject:array3];
        [sharedManagerDM.diabetesDairyColumeArray2 addObject:array4];
        [sharedManagerDM.diabetesDairyColumeArray2 addObject:array5];
    }
    
    if (sharedManagerDM.diabetesDairyColumeArray3 == nil) {
        
        sharedManagerDM.diabetesDairyColumeArray3 = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [dateFormatter dateFromString:@"2016-05-04"];
        NSDate *date2 = [dateFormatter dateFromString:@"2016-05-07"];
        NSDate *date3 = [dateFormatter dateFromString:@"2016-05-09"];
        NSDate *date4 = [dateFormatter dateFromString:@"2016-05-11"];
        NSDate *date5 = [dateFormatter dateFromString:@"2016-05-13"];
        
        NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:date1,@"7.5",@"12.8", nil];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:date2,@"8.7",@"13.1", nil];
        NSMutableArray *array3 = [[NSMutableArray alloc] initWithObjects:date3,@"9.1",@"14.6", nil];
        NSMutableArray *array4 = [[NSMutableArray alloc] initWithObjects:date4,@"7.6",@"13.5", nil];
        NSMutableArray *array5 = [[NSMutableArray alloc] initWithObjects:date5,@"7.1",@"12.5", nil];
        
        [sharedManagerDM.diabetesDairyColumeArray3 addObject:array1];
        [sharedManagerDM.diabetesDairyColumeArray3 addObject:array2];
        [sharedManagerDM.diabetesDairyColumeArray3 addObject:array3];
        [sharedManagerDM.diabetesDairyColumeArray3 addObject:array4];
        [sharedManagerDM.diabetesDairyColumeArray3 addObject:array5];
    }
    
}

+ (void)initNewDiabetesCellData
{
    //每次通过加号进入addview时都用重新赋值
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    sharedManagerDM.tempDiabetesDateString = @"- -";
    sharedManagerDM.tempMealTypeString = @"- -";
}

+ (void)saveNewDiabetesDairyCellArray:(NSString *)beforeString withAfter:(NSString *)afterString
{
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    NSMutableArray *newdiabetesCellArray = [NSMutableArray array];
    [newdiabetesCellArray addObject:sharedManagerDM.tempDiabetesDate];
    [newdiabetesCellArray addObject:beforeString];
    [newdiabetesCellArray addObject:afterString];
    NSLog(@"mealType: %@", sharedManagerDM.tempMealTypeString);
    
    if ([sharedManagerDM.tempMealTypeString isEqualToString:@"早餐"]) {
        [sharedManagerDM.diabetesDairyColumeArray1 addObject:newdiabetesCellArray];
        NSLog(@"1count:%lu",(unsigned long)[sharedManagerDM.diabetesDairyColumeArray1 count]);
        NSLog(@"2count:%lu",(unsigned long)[sharedManagerDM.diabetesDairyColumeArray2 count]);
        NSLog(@"3count:%lu",(unsigned long)[sharedManagerDM.diabetesDairyColumeArray3 count]);
    }
    else if([sharedManagerDM.tempMealTypeString isEqualToString:@"中餐"]){
        [sharedManagerDM.diabetesDairyColumeArray2 addObject:newdiabetesCellArray];
        NSLog(@"2count:%lu",(unsigned long)[sharedManagerDM.diabetesDairyColumeArray2 count]);
    }
    else if([sharedManagerDM.tempMealTypeString isEqualToString:@"晚餐"]){
        [sharedManagerDM.diabetesDairyColumeArray3 addObject:newdiabetesCellArray];
        NSLog(@"3count:%lu",(unsigned long)[sharedManagerDM.diabetesDairyColumeArray3 count]);
    }
    
    //[sharedManagerDM.diabetesDairyColumeArray1 addObject:newdiabetesCellArray];
    //NSLog(@"Diabetestime:%@",sharedManagerDM.tempDiabetesDate);
    //NSLog(@"afterString:%@",afterString);
    //NSLog(@"count:%lu",(unsigned long)[sharedManagerDM.diabetesDairyColumeArray1 count]);
    
}









#pragma mark - BMI
+ (void)getBMIDairyColumeArray
{
    
    //从数据库获取信息
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    //初始为nil才初始化, 删除后不为nil
    if (sharedManagerDM.bmiDairyColumeArray == nil) {
        
        sharedManagerDM.bmiDairyColumeArray = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [dateFormatter dateFromString:@"2016-05-04"];
        NSDate *date2 = [dateFormatter dateFromString:@"2016-05-07"];
        NSDate *date3 = [dateFormatter dateFromString:@"2016-05-09"];
        NSDate *date4 = [dateFormatter dateFromString:@"2016-05-11"];
        NSDate *date5 = [dateFormatter dateFromString:@"2016-05-13"];
        
        NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:date1, @"174",@"72",@"77", @"23.78", nil];
        NSMutableArray *array2 = [[NSMutableArray alloc] initWithObjects:date2, @"174",@"76",@"78", @"25.10", nil];
        NSMutableArray *array3 = [[NSMutableArray alloc] initWithObjects:date3, @"174",@"82",@"84", @"27.08", nil];
        NSMutableArray *array4 = [[NSMutableArray alloc] initWithObjects:date4, @"174",@"86",@"87", @"28.41", nil];
        NSMutableArray *array5 = [[NSMutableArray alloc] initWithObjects:date5, @"174",@"74",@"75", @"24.44", nil];
        
        [sharedManagerDM.bmiDairyColumeArray addObject:array1];
        [sharedManagerDM.bmiDairyColumeArray addObject:array2];
        [sharedManagerDM.bmiDairyColumeArray addObject:array3];
        [sharedManagerDM.bmiDairyColumeArray addObject:array4];
        [sharedManagerDM.bmiDairyColumeArray addObject:array5];
    
    }
}

+ (void)initNewBMICellData
{
    //每次通过加号进入addview时都用重新赋值
     DairyModel *sharedManagerDM = [DairyModel sharedManager];
    sharedManagerDM.tempBMIDateString = @"- -";
    //sharedManagerDM.tempHeightString = @"- -";
    //sharedManagerDM.tempWeightString = @"- -";
    //sharedManagerDM.tempWaistlineString = @"- -";
}

+ (void)saveNewBMIDairyCellArray:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString
{
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    NSString *bmiString = [DairyModel calculteBMI:heightString withWeight:weightString withWaistline:waistlineString];
    
    NSMutableArray *newBMIDairyCellArray = [NSMutableArray array];
    [newBMIDairyCellArray addObject:sharedManagerDM.tempBMIDate];
    [newBMIDairyCellArray addObject:heightString];
    [newBMIDairyCellArray addObject:weightString];
    [newBMIDairyCellArray addObject:waistlineString];
    [newBMIDairyCellArray addObject:bmiString];
    
    [sharedManagerDM.bmiDairyColumeArray addObject:newBMIDairyCellArray];
    NSLog(@"time:%@",sharedManagerDM.tempBMIDate);
    NSLog(@"time:%@",sharedManagerDM.tempWaistlineString);
    NSLog(@"heightString:%@",bmiString);
    NSLog(@"count:%lu",(unsigned long)[sharedManagerDM.bmiDairyColumeArray count]);

}

+ (NSString *)calculteBMI:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString
{
    NSString *bmiString;
    
    //计算bmi
    float bmiValue1;
    float bmiValue2;
    bmiValue1 = [heightString floatValue] * [heightString floatValue];
    bmiValue1 = bmiValue1 / 10000; //厘米转米
    bmiValue2 = [weightString floatValue] / bmiValue1;
    bmiValue2 = round(bmiValue2*100)/100;
    bmiString = [NSString stringWithFormat:@"%.2f",bmiValue2];

    return bmiString;
}

@end
