//
//  ReminderModel.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/1.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "ReminderModel.h"

@implementation ReminderModel

//声明全局
static ReminderModel *sharedManager = nil;

+ (ReminderModel *)sharedManager
{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}


#pragma mark - Med
+ (void)getMedReminderColumeArray
{
    //从数据库获取信息
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    //初始为nil才初始化, 删除后不为nil
    if (sharedManagerRM.medReminderColumeArray == nil) {
        
        sharedManagerRM.medReminderColumeArray = [NSMutableArray array];
        
        /*
        //必须用nsnumber存储信息
        NSNumber *medCellNum1 = [NSNumber numberWithInt: 0];
        NSDate *date = [NSDate date];
        NSString *medicineName1 = @"瑞罗宁";//迪沙、依吡达、优哒灵\达美康\克糖利
        NSString *dosage1 = @"1";
        NSString *unit1 = @"片";
        
        NSNumber *medCellNum2 = [NSNumber numberWithInt: 1];
        NSString *medicineName2 = @"迪沙";//迪沙、依吡达、优哒灵\达美康\克糖利
        NSString *dosage2 = @"2";
        NSString *unit2 = @"粒";
        
        //nsarray只能存nsnumber,nsinteger,int不行
        NSArray *medReminderCellArray1 = [NSArray arrayWithObjects:medCellNum1,date,medicineName1,dosage1,unit1,nil];
        NSArray *medReminderCellArray2 = [NSArray arrayWithObjects:medCellNum2,date,medicineName2,dosage2,unit2,nil];
        
        // @60, @66, @83, @73, @58
        [sharedManagerRM.medReminderColumeArray addObject:medReminderCellArray1];
        [sharedManagerRM.medReminderColumeArray addObject:medReminderCellArray2];
         */
    }
}

+ (void)initNewMedCellData
{
    //每次通过加号进入addview时都用重新赋值
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.tempMedDateString = @"- -";
    sharedManagerRM.tempDosageString = @"- -";
    sharedManagerRM.tempUnitString = @"- -";
}

+ (void)initEditMedCellData
{
    //每次通过edit进入addview时都用重新赋值,text值在add中页面收到通知后更改
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    //取出值显示到页面中
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    sharedManagerRM.tempMedDateString = [dateFormatter stringFromDate:sharedManagerRM.editmedReminderCellArray[1]];
    sharedManagerRM.tempMedNameString = sharedManagerRM.editmedReminderCellArray[2];
    sharedManagerRM.tempDosageString = sharedManagerRM.editmedReminderCellArray[3];
    sharedManagerRM.tempUnitString = sharedManagerRM.editmedReminderCellArray[4];
    NSLog(@"editMedNum: %@", sharedManagerRM.editmedReminderCellArray[0]);
    //NSLog(@"editMedName: %@", sharedManagerRM.editmedReminderCellArray[2]);

}

//点击保存按钮后将所有信息保存到新cell数组中并添加到总colume数组中,此处生成新的medCellNum
//medcellnum从0开始
+ (void)saveNewMedReminderCellArray:(NSString *)medName
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    NSUInteger j = [sharedManagerRM.medReminderColumeArray count];
    int i;
    NSMutableArray *medCellNumArray;
    medCellNumArray = [NSMutableArray array];

    for (i = 0; i < j; i++) {
        //保存后获取medCellNum最大值然后+1；
        [medCellNumArray addObject:sharedManagerRM.medReminderColumeArray[i][0]];
    }
    
    //medReminderColumeArray为0时maxNumAddded会为1
    NSLog(@"medCellNumArray:%lu",(unsigned long)[medCellNumArray count]);
    NSNumber *maxNum = [medCellNumArray valueForKeyPath:@"@max.self"];
    int value = [maxNum intValue];
    //NSLog(@"maxNum:%@",maxNum);
    value = value + 1;
    NSNumber *maxNumAdded = [NSNumber numberWithInt:value];
    NSLog(@"maxNumAdded:%@",maxNumAdded);
    
    //NSMutableArray *newMedReminderCellArray = []
    NSNumber *isON = [NSNumber numberWithInt: 1];
    NSMutableArray *newMedReminderCellArray = [NSMutableArray array];
    [newMedReminderCellArray addObject:maxNumAdded];
    [newMedReminderCellArray addObject:sharedManagerRM.tempMedDate];
    [newMedReminderCellArray addObject:medName];
    [newMedReminderCellArray addObject:sharedManagerRM.tempDosageString];
    [newMedReminderCellArray addObject:sharedManagerRM.tempUnitString];
    [newMedReminderCellArray addObject:isON];

    [sharedManagerRM.medReminderColumeArray addObject:newMedReminderCellArray];
    
    NSLog(@"count:%lu",(unsigned long)[sharedManagerRM.medReminderColumeArray count]);
    
}

+ (void)saveEditMedReminderCellArray:(NSString *)medName
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    int i;
    //获取更改的cell的编号
    for (i = 0; i < [sharedManagerRM.medReminderColumeArray count]; i++) {
        if (sharedManagerRM.medReminderColumeArray[i][0] == sharedManagerRM.editmedReminderCellArray[0]) {
            break;
        }
    }
    NSNumber *editNum = [NSNumber numberWithInt:i];
    NSNumber *isON = [NSNumber numberWithInt: 1];
    NSMutableArray *editMedReminderCellArray = [NSMutableArray array];
    
    [editMedReminderCellArray addObject:editNum];
    [editMedReminderCellArray addObject:sharedManagerRM.tempMedDate];
    [editMedReminderCellArray addObject:medName];
    [editMedReminderCellArray addObject:sharedManagerRM.tempDosageString];
    [editMedReminderCellArray addObject:sharedManagerRM.tempUnitString];
    [editMedReminderCellArray addObject:isON];
    
    //NSMutableArray *editMedReminderCellArray = [NSMutableArray array];
    //editMedReminderCellArray = [NSMutableArray arrayWithObjects:editNum,sharedManagerRM.tempMedDate,medName,sharedManagerRM.tempDosageString,sharedManagerRM.tempUnitString,isON,nil];
    //sharedManagerRM.editmedReminderCellArray[2] = medName; nsarray不能这样赋值
    
    
    NSLog(@"findMedEditNum: %d",i);
    sharedManagerRM.medReminderColumeArray[i] = editMedReminderCellArray;
    NSLog(@"editsuccess");
    //sharedManagerRM.medReminderColumeArray[i] = editMedReminderCellArray;

}



#pragma mark - Sports

+ (void)getSportsReminderColumeArray
{
    //从数据库获取信息
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    //初始为nil才初始化, 删除后不为nil
    if (sharedManagerRM.sportsReminderColumeArray == nil) {
        
        sharedManagerRM.sportsReminderColumeArray = [NSMutableArray array];
        
        /*
         //必须用nsnumber存储信息
         NSNumber *sportsCellNum1 = [NSNumber numberWithInt: 0];
         NSDate *date = [NSDate date];
         NSString *sportsName1 = @"跑步";//迪沙、依吡达、优哒灵\达美康\克糖利
         NSString *editSportsReminderCellArraytime1 = @"30 分钟";
         
         NSNumber *sportsCellNum2 = [NSNumber numberWithInt: 1];
         NSString *sportsName2 = @"游泳";//迪沙、依吡达、优哒灵\达美康\克糖利
         NSString *dosage2 = @"2";
         NSString *unit2 = @"粒";
         
         //nsarray只能存nsnumber,nsinteger,int不行
         NSArray *medReminderCellArray1 = [NSArray arrayWithObjects:medCellNum1,date,medicineName1,dosage1,unit1,nil];
         NSArray *medReminderCellArray2 = [NSArray arrayWithObjects:medCellNum2,date,medicineName2,dosage2,unit2,nil];
         
         // @60, @66, @83, @73, @58
         [sharedManagerRM.medReminderColumeArray addObject:medReminderCellArray1];
         [sharedManagerRM.medReminderColumeArray addObject:medReminderCellArray2];
         */
    }
}

+ (void)initNewSportsCellData
{
    //每次通过加号进入addview时都用重新赋值
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.tempSportsDateString = @"- -";
    sharedManagerRM.tempSportsNameString = @"- -";
    sharedManagerRM.tempExceriseTimeString = @"- -";
}

+ (void)initEditSportsCellData
{
    //每次通过edit进入addview时都用重新赋值,text值在add中页面收到通知后更改
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    //取出值显示到页面中
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    sharedManagerRM.tempSportsDateString = [dateFormatter stringFromDate:sharedManagerRM.editSportsReminderCellArray[1]];
    sharedManagerRM.tempSportsNameString = sharedManagerRM.editSportsReminderCellArray[2];
    sharedManagerRM.tempExceriseTimeString = sharedManagerRM.editSportsReminderCellArray[3];
    NSLog(@"editSportsNum: %@", sharedManagerRM.editSportsReminderCellArray[0]);
    //NSLog(@"editMedName: %@", sharedManagerRM.editmedReminderCellArray[2]);
    
}

//点击保存按钮后将所有信息保存到新cell数组中并添加到总colume数组中,此处生成新的medCellNum
//medcellnum从0开始
+ (void)saveNewSportsReminderCellArray:(NSString *)sportsName
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    NSUInteger j = [sharedManagerRM.sportsReminderColumeArray count];
    int i;
    NSMutableArray *sportsCellNumArray;
    sportsCellNumArray = [NSMutableArray array];
    
    for (i = 0; i < j; i++) {
        //保存后获取medCellNum最大值然后+1；
        [sportsCellNumArray addObject:sharedManagerRM.sportsReminderColumeArray[i][0]];
    }
    
    //medReminderColumeArray为0时maxNumAddded会为1
    NSLog(@"sportsCellNumArray:%lu",(unsigned long)[sportsCellNumArray count]);
    NSNumber *maxNum = [sportsCellNumArray valueForKeyPath:@"@max.self"];
    int value = [maxNum intValue];
    //NSLog(@"maxNum:%@",maxNum);
    value = value + 1;
    NSNumber *maxNumAdded = [NSNumber numberWithInt:value];
    NSLog(@"maxSportsNumAdded:%@",maxNumAdded);
    
    //NSMutableArray *newMedReminderCellArray = []
    NSNumber *isON = [NSNumber numberWithInt: 1];
    NSMutableArray *newSportsReminderCellArray = [NSMutableArray array];
    [newSportsReminderCellArray addObject:maxNumAdded];
    [newSportsReminderCellArray addObject:sharedManagerRM.tempSportsDate];
    [newSportsReminderCellArray addObject:sportsName];
    [newSportsReminderCellArray addObject:sharedManagerRM.tempExceriseTimeString];
    [newSportsReminderCellArray addObject:isON];
    
    [sharedManagerRM.sportsReminderColumeArray addObject:newSportsReminderCellArray];
    
    NSLog(@"count:%lu",(unsigned long)[sharedManagerRM.sportsReminderColumeArray count]);
    
}

+ (void)saveEditSportsReminderCellArray:(NSString *)sportsName
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    int i;
    //获取更改的cell的编号
    for (i = 0; i < [sharedManagerRM.sportsReminderColumeArray count]; i++) {
        if (sharedManagerRM.sportsReminderColumeArray[i][0] == sharedManagerRM.sportsReminderColumeArray[0]) {
            break;
        }
    }
    NSNumber *editNum = [NSNumber numberWithInt:i];
    NSNumber *isON = [NSNumber numberWithInt: 1];
    NSMutableArray *editSportsReminderCellArray = [NSMutableArray array];
    
    [editSportsReminderCellArray addObject:editNum];
    [editSportsReminderCellArray addObject:sharedManagerRM.tempSportsDate];
    [editSportsReminderCellArray addObject:sportsName];
    [editSportsReminderCellArray addObject:sharedManagerRM.tempExceriseTimeString];
    [editSportsReminderCellArray addObject:isON];
    
    //NSMutableArray *editMedReminderCellArray = [NSMutableArray array];
    //editMedReminderCellArray = [NSMutableArray arrayWithObjects:editNum,sharedManagerRM.tempMedDate,medName,sharedManagerRM.tempDosageString,sharedManagerRM.tempUnitString,isON,nil];
    //sharedManagerRM.editmedReminderCellArray[2] = medName; nsarray不能这样赋值
    
    
    NSLog(@"findMedEditNum: %d",i);
    sharedManagerRM.sportsReminderColumeArray[i] = editSportsReminderCellArray;
    NSLog(@"editsuccess");
    //sharedManagerRM.medReminderColumeArray[i] = editMedReminderCellArray;
    
}


@end
