//
//  ReminderFunc.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/1.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "ReminderFunc.h"
#import "ReminderModel.h"
#import "MedCellView.h"
#import "SportsCellView.h"
#import "DosagePickerViewController.h"
#import "UnitPickerViewController.h"
#import "ExerciseTimePickerViewController.h"


@implementation ReminderFunc

#pragma mark - initMed
static MedCellView *medCell1;
static MedCellView *medCell2;
static MedCellView *medCell3;
static MedCellView *medCell4;
static MedCellView *medCell5;
static MedCellView *medCell6;
static MedCellView *medCell7;
static MedCellView *medCell8;
static UILocalNotification *medNoti1;
static UILocalNotification *medNoti2;
static UILocalNotification *medNoti3;
static UILocalNotification *medNoti4;
static UILocalNotification *medNoti5;
static UILocalNotification *medNoti6;
static UILocalNotification *medNoti7;
static UILocalNotification *medNoti8;

+ (void)initMedicineReminder:(UIView *)view
                    isReload:(NSInteger)reload
{

    //获取数组中有几组数据，然后初始界面
    if (reload == 0) {
        [ReminderModel getMedReminderColumeArray];
    }
    
    
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    NSMutableArray *tempColumeArray = shareManagerRM.medReminderColumeArray;
    
    NSInteger num = [tempColumeArray count];
    //NSLog(@"totalCellNum: %ld",(long)num);
    NSInteger i = 0;
    
    //删除上次添加的界面
    if (medCell1 != NULL) {
        [medCell1 removeFromSuperview];
    }
    if (medCell2 != NULL) {
        [medCell2 removeFromSuperview];
    }
    if (medCell3 != NULL) {
        [medCell3 removeFromSuperview];
    }
    if (medCell4 != NULL) {
        [medCell4 removeFromSuperview];
    }
    if (medCell5 != NULL) {
        [medCell5 removeFromSuperview];
    }
    if (medCell6 != NULL) {
        [medCell6 removeFromSuperview];
    }
    if (medCell7 != NULL) {
        [medCell7 removeFromSuperview];
    }
    if (medCell8 != NULL) {
        [medCell8 removeFromSuperview];
    }

    //刷新cell的同时，重新定一遍通知
    for (i = 0; i < num; i++) {
        if (i == 0) {
            //如果现在是12分，提醒时间为12分，则不会提醒，因为一天只提醒一次，过去不再提醒
            medCell1 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell1];
            [view sendSubviewToBack:medCell1];   //防止更新时覆盖addview
        }
        else if (i == 1){
            medCell2 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell2];
            [view sendSubviewToBack:medCell2];
        }
        else if (i == 2){
            medCell3 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell3];
            [view sendSubviewToBack:medCell3];
        }
        else if (i == 3){
            medCell4 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell4];
            [view sendSubviewToBack:medCell4];
        }
        else if (i == 5){
            medCell5 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell5];
            [view sendSubviewToBack:medCell5];
        }
        else if (i == 6){
            medCell6 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell6];
            [view sendSubviewToBack:medCell6];
        }
        else if (i == 6){
            medCell7 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell7];
            [view sendSubviewToBack:medCell7];
        }
        else{
            medCell8 = [[MedCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:medCell8];
            [view sendSubviewToBack:medCell8];
        
        }
    }
    [ReminderFunc reloadMedNotification];
}

+ (void)reloadMedNotification
{
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    NSMutableArray *tempColumeArray = shareManagerRM.medReminderColumeArray;
    
    //MedCellView *medcellView1 = [[MedCellView alloc]init];
    //MedCellView *medcellView2 = [[MedCellView alloc]init];
    
    NSInteger num = [tempColumeArray count];
    //NSLog(@"totalCellNum: %ld",(long)num);
    NSInteger i = 0;
    
    //先设置BadgeNumber为其他值再设置为0,固定写法，有bug，否则无效
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:21];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //cancelLocalNotification命令不管用
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    for (i = 0; i < num; i++) {
        if (i == 0) {
            if (tempColumeArray[0][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti1 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 1){
            if (tempColumeArray[1][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti2 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 2){
            if (tempColumeArray[2][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti3 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 3){
            if (tempColumeArray[3][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti4 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 4){
            if (tempColumeArray[4][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti5 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 5){
            if (tempColumeArray[5][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti6 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 6){
            if (tempColumeArray[6][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti7 withIndex:i withArray:tempColumeArray];
            }
        }
        else{
            if (tempColumeArray[7][5] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addMedNotification:medNoti8 withIndex:i withArray:tempColumeArray];
            }
        }
    }
}

+ (void)addMedNotification:(UILocalNotification *)medNoti withIndex:(NSInteger)index withArray:(NSMutableArray *)tempColumeArray
{
    NSString *medName;
    NSString *dosage;
    NSString *unit;
    NSString *alertContent;
    NSString *tempString;
    
    medNoti = [[UILocalNotification alloc] init];
    medNoti.timeZone = [NSTimeZone systemTimeZone];
    medNoti.fireDate = tempColumeArray[index][1];
    medName = tempColumeArray[index][2];
    dosage = tempColumeArray[index][3];
    unit = tempColumeArray[index][4];
    tempString = [medName stringByAppendingString:@"  "];
    tempString = [tempString stringByAppendingString:dosage];
    tempString = [tempString stringByAppendingString:@"  "];
    alertContent = [tempString stringByAppendingString:unit];
    medNoti.alertBody = alertContent;
    medNoti.soundName = UILocalNotificationDefaultSoundName;
    medNoti.repeatInterval = kCFCalendarUnitDay; //一天只提醒一次，不会多余提醒
    //[UIApplication sharedApplication].applicationIconBadgeNumber += 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:medNoti];
}

//index用作删除
+(void)medEditButtonPressed:(NSInteger)index
{
     ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    
    UIViewController *rootViewController;
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"更改" message:@"更改闹铃信息" preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除闹铃" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
    
        [shareManagerRM.medReminderColumeArray removeObjectAtIndex:index];
        NSLog(@"totalCellNumAfterDelete:%lu",(unsigned long)[shareManagerRM.medReminderColumeArray count]);
        
        //cell数量有变化时发出通知,接受方RemindMedicine，更新页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"saveMedReCellData" object:self];
    }];
    UIAlertAction *editAction = [UIAlertAction actionWithTitle:@"编辑闹铃" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        shareManagerRM.editmedReminderCellArray = shareManagerRM.medReminderColumeArray[index];
        //接受方RemindMedicine，跳转页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"editMedReCellData" object:self];
        //接受方AddMedicine，更新textfield.text
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMedReText" object:self];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:editAction];
    //[alertController addAction:addRemarkAction];
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
    
}

+(void)medSwitchSelected:(NSInteger)index withStatus:(bool)isOn
{
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    
    if (index == 0) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[0][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[0][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 1) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[1][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[1][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 2) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[2][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[2][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 3) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[3][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[3][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 4) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[4][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[4][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 5) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[5][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[5][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 6) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[6][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[6][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 7) {
        if (isOn == NO) {
            shareManagerRM.medReminderColumeArray[7][5] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.medReminderColumeArray[7][5] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadMedNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
}



#pragma mark - initAddMedViewsData
static UILabel *medPickerDateLabel;
static UILabel *dosageValueLabel;
static UILabel *unitTypeValueLabel;

//从edit进入add页面时调用
+(void)isMedEditYes
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.isMedEdit = 1;
}
//从加号进入add页面时调用
+(void)isMedEditNo
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.isMedEdit = 0;
}

+(NSString *)getMedName
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    return sharedManagerRM.editmedReminderCellArray[2];
}

+(Boolean)medEditStatus
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    return sharedManagerRM.isMedEdit;
}


//进入add界面时调用
//第一次进入add页面将个数据初始化，从而在前端显示，否则结果都为null
//edit进入add页面从editarray中读取数据
+ (void)initAddMedLabels:(UIView *)view
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    if (sharedManagerRM.isMedEdit == 0) {
        //第一次进入add页面将个数据初始化，从而在前端显示
        [ReminderModel initNewMedCellData];
    }
    else if (sharedManagerRM.isMedEdit == 1)
    {
        //从edit进入add页面将个数据初始化，从而在前端显示
        //[ReminderModel initNewMedCellData];
        [ReminderModel initEditMedCellData];
    }
    
    medPickerDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 193, 196, 40)];
    medPickerDateLabel.textColor = [UIColor grayColor];
    medPickerDateLabel.font = [UIFont systemFontOfSize:20];
    medPickerDateLabel.textAlignment = NSTextAlignmentCenter;
    medPickerDateLabel.text = sharedManagerRM.tempMedDateString;
    [view addSubview:medPickerDateLabel];
    
    dosageValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 263, 196, 40)];
    dosageValueLabel.textColor = [UIColor grayColor];
    dosageValueLabel.font = [UIFont systemFontOfSize:20];
    dosageValueLabel.textAlignment = NSTextAlignmentCenter;
    dosageValueLabel.text = sharedManagerRM.tempDosageString;
    [view addSubview:dosageValueLabel];
    
    
    unitTypeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 333, 196, 40)];
    unitTypeValueLabel.textColor = [UIColor grayColor];
    unitTypeValueLabel.font = [UIFont systemFontOfSize:18];
    unitTypeValueLabel.textAlignment = NSTextAlignmentCenter;
    unitTypeValueLabel.text = sharedManagerRM.tempUnitString;
    [view addSubview:unitTypeValueLabel];

}


#pragma mark - saveMedAddViewsData
+ (void)medTimeChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"ageChangedButtonPressed");
    UIView *pickerView = [ReminderFunc addPickerBackground:@"medTime"];
    [ReminderFunc addDatePickerWithView:pickerView withName:@"AddMedReminder"];
    [viewController.view addSubview:pickerView];
}

+(void)medDosageChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"medDosageChangeButtonPressed");
    UIView *pickerView = [ReminderFunc addPickerBackground:@"medDosage"];
    
    UIViewController *pickerViewController = [[DosagePickerViewController alloc]init];
    //保障控件可以添加到页面当中
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+(void)medUnitChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"medUnitChangeButtonPressed");
    UIView *pickerView = [ReminderFunc addPickerBackground:@"medUnit"];
    
    UIViewController *pickerViewController = [[UnitPickerViewController alloc]init];
    //保障控件可以添加到页面当中
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+ (void)medTimeChangeConfirmed
{
    [ReminderFunc removePickerBackground];
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    sharedManagerRM.tempMedDateString = [dateFormatter stringFromDate:sharedManagerRM.tempMedDate];
    medPickerDateLabel.text = sharedManagerRM.tempMedDateString;
    //NSLog(@"time1: %@", sharedManagerRM.tempMedDate);
}


+ (void)medDosageChangeConfirmed
{
    [ReminderFunc removePickerBackground];
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    dosageValueLabel.text = sharedManagerRM.tempDosageString;
}

+ (void)medUnitChangeConfirmed
{
    [ReminderFunc removePickerBackground];
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    unitTypeValueLabel.text = sharedManagerRM.tempUnitString;
}

+ (Boolean)verifyMedDataContact:(NSString *)medName
{
    Boolean isContact;
    
    //判断textfield为空必须 isequaltostring：@“”,不能=nil
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    if ([sharedManagerRM.tempMedDateString isEqualToString:@"- -"] || [sharedManagerRM.tempDosageString isEqualToString:@"- -"] || [sharedManagerRM.tempUnitString isEqualToString:@"- -"] || [medName isEqualToString:@""]) {
        isContact = NO;
    } else {
        isContact = YES;
    }
    return isContact;
}

+ (void)saveNewMedReminderCellArray:(NSString *)medName
{
    [ReminderModel saveNewMedReminderCellArray:medName];
    //新添加数据后发送通知更改cell界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveMedReCellData" object:self];
}

+ (void)saveEditMedReminderCellArray:(NSString *)medName
{
    [ReminderModel saveEditMedReminderCellArray:medName];
    //新添加数据后发送通知更改cell界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveMedReCellData" object:self];
}






#pragma mark - initSports
static SportsCellView *sportsCell1;
static SportsCellView *sportsCell2;
static SportsCellView *sportsCell3;
static SportsCellView *sportsCell4;
static SportsCellView *sportsCell5;
static SportsCellView *sportsCell6;
static SportsCellView *sportsCell7;
static SportsCellView *sportsCell8;
static UILocalNotification *sportsNoti1;
static UILocalNotification *sportsNoti2;
static UILocalNotification *sportsNoti3;
static UILocalNotification *sportsNoti4;
static UILocalNotification *sportsNoti5;
static UILocalNotification *sportsNoti6;
static UILocalNotification *sportsNoti7;
static UILocalNotification *sportsNoti8;

+ (void)initSportsReminder:(UIView *)view
                    isReload:(NSInteger)reload
{
    
    //获取数组中有几组数据，然后初始界面
    if (reload == 0) {
        [ReminderModel getSportsReminderColumeArray];
    }
    
    
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    NSMutableArray *tempColumeArray = shareManagerRM.sportsReminderColumeArray;
    
    NSInteger num = [tempColumeArray count];
    //NSLog(@"totalCellNum: %ld",(long)num);
    NSInteger i = 0;
    
    //删除上次添加的界面
    if (sportsCell1 != NULL) {
        [sportsCell1 removeFromSuperview];
    }
    if (sportsCell2 != NULL) {
        [sportsCell2 removeFromSuperview];
    }
    if (sportsCell3 != NULL) {
        [sportsCell3 removeFromSuperview];
    }
    if (sportsCell4 != NULL) {
        [sportsCell4 removeFromSuperview];
    }
    if (sportsCell5 != NULL) {
        [sportsCell5 removeFromSuperview];
    }
    if (sportsCell6 != NULL) {
        [sportsCell6 removeFromSuperview];
    }
    if (sportsCell7 != NULL) {
        [sportsCell7 removeFromSuperview];
    }
    if (sportsCell8 != NULL) {
        [sportsCell8 removeFromSuperview];
    }
    
    //刷新cell的同时，重新定一遍通知
    for (i = 0; i < num; i++) {
        if (i == 0) {
            //如果现在是12分，提醒时间为12分，则不会提醒，因为一天只提醒一次，过去不再提醒
            sportsCell1 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell1];
            [view sendSubviewToBack:sportsCell1];   //防止更新时覆盖addview
        }
        else if (i == 1){
            sportsCell2 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell2];
            [view sendSubviewToBack:sportsCell2];
        }
        else if (i == 2){
            sportsCell3 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell3];
            [view sendSubviewToBack:sportsCell3];
        }
        else if (i == 3){
            sportsCell4 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell4];
            [view sendSubviewToBack:sportsCell4];
        }
        else if (i == 5){
            sportsCell5 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell5];
            [view sendSubviewToBack:sportsCell5];
        }
        else if (i == 6){
            sportsCell6 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell6];
            [view sendSubviewToBack:sportsCell6];
        }
        else if (i == 6){
            sportsCell7 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell7];
            [view sendSubviewToBack:sportsCell7];
        }
        else{
            sportsCell8 = [[SportsCellView alloc]initCellView:i withCellArray:[tempColumeArray objectAtIndex:i]];
            [view addSubview:sportsCell8];
            [view sendSubviewToBack:sportsCell8];
            
        }
    }
    [ReminderFunc reloadSportsNotification];
}

+ (void)reloadSportsNotification
{
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    NSMutableArray *tempColumeArray = shareManagerRM.sportsReminderColumeArray;
    
    //MedCellView *medcellView1 = [[MedCellView alloc]init];
    //MedCellView *medcellView2 = [[MedCellView alloc]init];
    
    NSInteger num = [tempColumeArray count];
    //NSLog(@"totalCellNum: %ld",(long)num);
    NSInteger i = 0;
    
    //先设置BadgeNumber为其他值再设置为0,固定写法，有bug，否则无效
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:21];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //cancelLocalNotification命令不管用
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    for (i = 0; i < num; i++) {
        if (i == 0) {
            if (tempColumeArray[0][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti1 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 1){
            if (tempColumeArray[1][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti2 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 2){
            if (tempColumeArray[2][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti3 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 3){
            if (tempColumeArray[3][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti4 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 4){
            if (tempColumeArray[4][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti5 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 5){
            if (tempColumeArray[5][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti6 withIndex:i withArray:tempColumeArray];
            }
        }
        else if (i == 6){
            if (tempColumeArray[6][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti7 withIndex:i withArray:tempColumeArray];
            }
        }
        else{
            if (tempColumeArray[7][4] == [NSNumber numberWithInt:1]) {
                [ReminderFunc addSportsNotification:sportsNoti8 withIndex:i withArray:tempColumeArray];
            }
        }
    }
}


+ (void)addSportsNotification:(UILocalNotification *)sportsNoti withIndex:(NSInteger)index withArray:(NSMutableArray *)tempColumeArray
{
    NSString *sportsNameString;
    NSString *exerciseTimeString;
    NSString *alertContentString;
    NSString *tempString;
    
    sportsNoti = [[UILocalNotification alloc] init];
    sportsNoti.timeZone = [NSTimeZone systemTimeZone];
    sportsNoti.fireDate = tempColumeArray[index][1];
    sportsNameString = tempColumeArray[index][2];
    exerciseTimeString = tempColumeArray[index][3];
    //unit = tempColumeArray[index][4];
    tempString = [sportsNameString stringByAppendingString:@"  "];
    tempString = [tempString stringByAppendingString:exerciseTimeString];
    alertContentString = [tempString stringByAppendingString:@"  分钟"];
    //alertContent = [tempString stringByAppendingString:unit];
    sportsNoti.alertBody = alertContentString;
    sportsNoti.soundName = UILocalNotificationDefaultSoundName;
    sportsNoti.repeatInterval = kCFCalendarUnitDay; //一天只提醒一次，不会多余提醒
    //[UIApplication sharedApplication].applicationIconBadgeNumber += 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:sportsNoti];
}


//index用作删除
+(void)sportsEditButtonPressed:(NSInteger)index
{
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    
    UIViewController *rootViewController;
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"更改" message:@"更改闹铃信息" preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除闹铃" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        
        [shareManagerRM.sportsReminderColumeArray removeObjectAtIndex:index];
        NSLog(@"totalSportsCellNumAfterDelete:%lu",(unsigned long)[shareManagerRM.sportsReminderColumeArray count]);
        
        //cell数量有变化时发出通知,接受方RemindMedicine，更新页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"saveSportsReCellData" object:self];
    }];
    UIAlertAction *editAction = [UIAlertAction actionWithTitle:@"编辑闹铃" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        shareManagerRM.editSportsReminderCellArray = shareManagerRM.sportsReminderColumeArray[index];
        //接受方RemindMedicine，跳转页面
        [[NSNotificationCenter defaultCenter] postNotificationName:@"editSportsReCellData" object:self];
        //接受方AddMedicine，更新textfield.text
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeSportsReText" object:self];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:editAction];
    //[alertController addAction:addRemarkAction];
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootViewController presentViewController:alertController animated:YES completion:nil];
    
}

+(void)sportsSwitchSelected:(NSInteger)index withStatus:(bool)isOn
{
    ReminderModel *shareManagerRM = [ReminderModel sharedManager];
    
    if (index == 0) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[0][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            NSLog(@"isOn: %@", shareManagerRM.sportsReminderColumeArray[0][4]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[0][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            NSLog(@"isOn: %@", shareManagerRM.sportsReminderColumeArray[0][4]);
        }
    }
    else if (index == 1) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[1][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[1][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 2) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[2][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[2][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 3) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[3][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[3][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 4) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[4][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[4][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 5) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[5][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[5][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 6) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[6][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[6][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
    else if (index == 7) {
        if (isOn == NO) {
            shareManagerRM.sportsReminderColumeArray[7][4] = [NSNumber numberWithInt:0];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
        else if (isOn == YES)
        {
            shareManagerRM.sportsReminderColumeArray[7][4] = [NSNumber numberWithInt:1];
            [ReminderFunc reloadSportsNotification];
            //NSLog(@"isOn: %@", shareManagerRM.medReminderColumeArray[0][5]);
        }
    }
}


#pragma mark - initAddSportsViewsData
static UILabel *sportsPickerDateLabel;
static UILabel *exerciseTimeValueLabel;

//从edit进入add页面时调用
+(void)isSportsEditYes
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.isSportsEdit = 1;
}
//从加号进入add页面时调用
+(void)isSportsEditNo
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.isSportsEdit = 0;
}

+(NSString *)getSportsName
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    return sharedManagerRM.editSportsReminderCellArray[2];
}

+(Boolean)sportsEditStatus
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    return sharedManagerRM.isSportsEdit;
}


//进入add界面时调用
//第一次进入add页面将个数据初始化，从而在前端显示，否则结果都为null
//edit进入add页面从editarray中读取数据
+ (void)initAddSportsLabels:(UIView *)view
{
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    
    if (sharedManagerRM.isSportsEdit == 0) {
        //第一次进入add页面将个数据初始化，从而在前端显示
        [ReminderModel initNewSportsCellData];
    }
    else if (sharedManagerRM.isSportsEdit == 1)
    {
        //从edit进入add页面将个数据初始化，从而在前端显示
        //[ReminderModel initNewMedCellData];
        [ReminderModel initEditSportsCellData];
    }
    
    sportsPickerDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 193, 196, 40)];
    sportsPickerDateLabel.textColor = [UIColor grayColor];
    sportsPickerDateLabel.font = [UIFont systemFontOfSize:20];
    sportsPickerDateLabel.textAlignment = NSTextAlignmentCenter;
    sportsPickerDateLabel.text = sharedManagerRM.tempSportsDateString;
    [view addSubview:sportsPickerDateLabel];
    
    exerciseTimeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 263, 196, 40)];
    exerciseTimeValueLabel.textColor = [UIColor grayColor];
    exerciseTimeValueLabel.font = [UIFont systemFontOfSize:20];
    exerciseTimeValueLabel.textAlignment = NSTextAlignmentCenter;
    exerciseTimeValueLabel.text = sharedManagerRM.tempExceriseTimeString;
    [view addSubview:exerciseTimeValueLabel];
    
    //unitTypeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 333, 196, 40)];
    //unitTypeValueLabel.textColor = [UIColor grayColor];
    //unitTypeValueLabel.font = [UIFont systemFontOfSize:18];
    //unitTypeValueLabel.textAlignment = NSTextAlignmentCenter;
    //unitTypeValueLabel.text = sharedManagerRM.tempUnitString;
    //[view addSubview:unitTypeValueLabel];
    
}

#pragma mark - saveMedAddViewsData
+ (void)sportsTimeChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"ageChangedButtonPressed");
    UIView *pickerView = [ReminderFunc addPickerBackground:@"sportsTime"];
    [ReminderFunc addDatePickerWithView:pickerView withName:@"AddSportsReminder"];
    [viewController.view addSubview:pickerView];
}

+(void)exerciseTimeChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"medDosageChangeButtonPressed");
    UIView *pickerView = [ReminderFunc addPickerBackground:@"exerciseTime"];
    
    UIViewController *pickerViewController = [[ExerciseTimePickerViewController alloc]init];
    //保障控件可以添加到页面当中
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+ (void)sportsTimeChangeConfirmed
{
    [ReminderFunc removePickerBackground];
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    //sharedManagerRM.tempMedDateString = [dateFormatter stringFromDate:sharedManagerRM.tempMedDate];
    sharedManagerRM.tempSportsDateString = [dateFormatter stringFromDate:sharedManagerRM.tempSportsDate];
    //medPickerDateLabel.text = sharedManagerRM.tempMedDateString;
    sportsPickerDateLabel.text = sharedManagerRM.tempSportsDateString;
    //NSLog(@"time1: %@", sharedManagerRM.tempMedDate);
}

+ (void)exerciseTimeChangeConfirmed
{
    [ReminderFunc removePickerBackground];
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    //dosageValueLabel.text = sharedManagerRM.tempDosageString;
    exerciseTimeValueLabel.text = sharedManagerRM.tempExceriseTimeString;
}

+ (Boolean)verifySportsDataContact:(NSString *)sportsName
{
    Boolean isContact;
    
    //判断textfield为空必须 isequaltostring：@“”,不能=nil
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    if ([sharedManagerRM.tempSportsDateString isEqualToString:@"- -"] || [sharedManagerRM.tempExceriseTimeString isEqualToString:@"- -"] || [sportsName isEqualToString:@""]) {
        isContact = NO;
    } else {
        isContact = YES;
    }
    return isContact;
}

+ (void)saveNewSportsReminderCellArray:(NSString *)sportsName
{
    [ReminderModel saveNewSportsReminderCellArray:sportsName];
    //新添加数据后发送通知更改cell界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveSportsReCellData" object:self];
}

+ (void)saveEditSportsReminderCellArray:(NSString *)sportsName
{
    [ReminderModel saveEditSportsReminderCellArray:sportsName];
    //新添加数据后发送通知更改cell界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveSportsReCellData" object:self];
}








#pragma mark - DatePickerView （datePickerScrolled: tag:>=300）
static UIDatePicker *datePicker;
+(void)addDatePickerWithView:(UIView *)view
                    withName:(NSString *)viewNameString
{
    //0, HEIGHT - NAVIBARHEIGHT - 194, WIDTH, 195
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 194,WIDTH,195)];
    datePicker.datePickerMode = UIDatePickerModeTime;
    //datePicker.datePickerMode = UIDatePickerModeTime;
    //datePicker.minuteInterval = 60;
    datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [datePicker addTarget:self action:@selector(datePickerScrolled:) forControlEvents:UIControlEventValueChanged];
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    if ([viewNameString isEqual:@"AddMedReminder"]) {
        [datePicker setTag:300];
        //设定默认值，不旋转pickerview时有值显示,放到if里
        sharedManagerRM.tempMedDate = datePicker.date;
    }
    else if([viewNameString isEqual:@"AddSportsReminder"]){
        [datePicker setTag:301];
        sharedManagerRM.tempSportsDate = datePicker.date;
    }
    else if([viewNameString isEqual:@"AddMeasureReminder"]){
        [datePicker setTag:302];
    }
    
    [view addSubview:datePicker];
}


+ (void)datePickerScrolled:(id)sender
{
    
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    if ([sender tag] == 300) {
        sharedManagerRM.tempMedDate = datePicker.date;
    }
    else if ([sender tag] == 301){
        sharedManagerRM.tempSportsDate = datePicker.date;
    }
    else if ([sender tag] == 302){
        //sharedManagerRM.tempMedDate = datePicker.date;
    }
}


#pragma mark - PickerBackground
static UIView *pickerView;
+ (UIView *)addPickerBackground:(NSString *)buttonString
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
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(WIDTH - 60, 5, 50, 25);
    [confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    confirmButton.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    [confirmButton setTitleColor:[UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1] forState:UIControlStateNormal];
    if ([buttonString isEqualToString:@"medTime"]) {
        [confirmButton addTarget:self action:@selector(medTimeChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if ([buttonString isEqualToString:@"medDosage"]) {
        [confirmButton addTarget:self action:@selector(medDosageChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"medUnit"]){
        [confirmButton addTarget:self action:@selector(medUnitChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"sportsTime"]){
        [confirmButton addTarget:self action:@selector(sportsTimeChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"exerciseTime"]){
        [confirmButton addTarget:self action:@selector(exerciseTimeChangeConfirmed) forControlEvents:UIControlEventTouchDown];
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

+ (void)moveForwardFromView:(UIView *)fromView
          moveForwardToEditView:(UIView *)toView
{
    //NSLog(@"f1");
    [UIView animateWithDuration:0.30
                          delay:0.14
                        options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                     animations:^{
                         //开始动画
                         [fromView addSubview:toView];
                         //NSLog(@"f2");
                         fromView.transform = CGAffineTransformMakeTranslation(-60, 0);
                         toView.transform = CGAffineTransformMakeTranslation(60-WIDTH, 0);
                         //NSLog(@"f3");
                         
                     }
                     completion:^(BOOL finished){
                         //[self.view removeFromSuperview];
                     }];
    //NSLog(@"f4");
}

+ (void)moveBackFromAddView:(UIView *)fromView
             moveBackToView:(UIView *)toView
{

    [toView bringSubviewToFront:fromView];
    [UIView animateWithDuration:0.30
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                     animations:^{
                         //开始动画
                         //[fromView.superview bringSubviewToFront:fromView];
                         toView.superview.transform = CGAffineTransformMakeTranslation(0, 0);
                         toView.transform = CGAffineTransformMakeTranslation(WIDTH-40, 0);
                         //[self MoveBack:self.view.superview];
                         
                     }
                     completion:^(BOOL finished){
                         [fromView removeFromSuperview];
                     }];

}


@end
