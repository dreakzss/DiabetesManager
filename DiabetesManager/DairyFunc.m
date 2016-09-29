//
//  DairyFunc.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/4.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "DairyFunc.h"
#import "MealTypePickerViewController.h"

@implementation DairyFunc


#pragma mark - initDiabetesData
static UIButton *breakfastButton;
static UIButton *lunchButton;
static UIButton *dinnerButton;
static UIView *underLine;
static int buttonSelected = 1; //1早餐 2午餐 3晚餐

+ (void)initMealTypeButtons:(UIView *)view
{
    breakfastButton = [UIButton buttonWithType:UIButtonTypeCustom];
    breakfastButton.frame = CGRectMake(50, NAVIBARHEIGHT+3, 50, 30);
    breakfastButton.backgroundColor = [UIColor clearColor];
    breakfastButton.opaque = NO;
    [breakfastButton setTitle:@"早餐" forState:UIControlStateNormal];
    [breakfastButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [breakfastButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [breakfastButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [breakfastButton addTarget:self action:@selector(breakfastButtonPressed) forControlEvents:UIControlEventTouchDown];
    [view addSubview:breakfastButton];
    
    underLine = [[UIView alloc]initWithFrame:CGRectMake(50, NAVIBARHEIGHT+30, 50, 2)];
    underLine.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    [view addSubview:underLine];
    
    lunchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lunchButton.frame = CGRectMake(155, NAVIBARHEIGHT+3, 50, 30);
    lunchButton.backgroundColor = [UIColor clearColor];
    lunchButton.opaque = NO;
    [lunchButton setTitle:@"中餐" forState:UIControlStateNormal];
    [lunchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [lunchButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [lunchButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [lunchButton addTarget:self action:@selector(lunchButtonPressed) forControlEvents:UIControlEventTouchDown];
    [view addSubview:lunchButton];
    
    dinnerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dinnerButton.frame = CGRectMake(260, NAVIBARHEIGHT+3, 50, 30);
    dinnerButton.backgroundColor = [UIColor clearColor];
    dinnerButton.opaque = NO;
    [dinnerButton setTitle:@"晚餐" forState:UIControlStateNormal];
    [dinnerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [dinnerButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [dinnerButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [dinnerButton addTarget:self action:@selector(dinnerButtonPressed) forControlEvents:UIControlEventTouchDown];
    [view addSubview:dinnerButton];

}

+ (void)breakfastButtonPressed
{

    buttonSelected = 1;
    [DairyFunc initMealTypeButtonsStatus];
    
    NSLog(@"br");

}

+ (void)lunchButtonPressed
{
    buttonSelected = 2;
    [DairyFunc initMealTypeButtonsStatus];
    NSLog(@"lu");
    
}

+ (void)dinnerButtonPressed
{
    buttonSelected = 3;
    [DairyFunc initMealTypeButtonsStatus];
    NSLog(@"di");
    
}

+ (void)initMealTypeButtonsStatus
{
    if (buttonSelected == 1) {
        breakfastButton.enabled = NO;
        lunchButton.enabled = YES;
        dinnerButton.enabled = YES;
        [UIView animateWithDuration:0.25 animations:^{
            [underLine setFrame:CGRectMake(breakfastButton.frame.origin.x, NAVIBARHEIGHT+30, 50, 2)];
        }completion:^(BOOL finished) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeDiabetesView" object:self];
        }];
    }
    else if(buttonSelected == 2)
    {
        breakfastButton.enabled = YES;
        lunchButton.enabled = NO;
        dinnerButton.enabled = YES;
        [UIView animateWithDuration:0.25 animations:^{
            [underLine setFrame:CGRectMake(lunchButton.frame.origin.x, NAVIBARHEIGHT+30, 50, 2)];
        }completion:^(BOOL finished) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeDiabetesView" object:self];
        }];
    }
    else if(buttonSelected == 3)
    {
        breakfastButton.enabled = YES;
        lunchButton.enabled = YES;
        dinnerButton.enabled = NO;
        [UIView animateWithDuration:0.25 animations:^{
            [underLine setFrame:CGRectMake(dinnerButton.frame.origin.x, NAVIBARHEIGHT+30, 50, 2)];
        }completion:^(BOOL finished) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeDiabetesView" object:self];
        }];
    }
}

static UILabel *diabetesPickerDateLabel;
static UILabel *bmiPickerDateLabel;
UIView *diabetesBackView;
+ (void)initDiabetesDairy:(UIView *)view
{
    [DairyModel getDiabetesDairyColumeArray];
    if (diabetesBackView != NULL) {
        [diabetesBackView removeFromSuperview];
    }
    diabetesBackView = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIBARHEIGHT + BUTTONSAREAHEIGHT, WIDTH, HEIGHT - NAVIBARHEIGHT - BUTTONSAREAHEIGHT)];
    
    if (buttonSelected == 1) {
        [DairyFunc addLineChartWithView:diabetesBackView withViewName:@"RecordBreakfastDiabetesView"];
        [DairyFunc addDiabetesDataView:diabetesBackView withViewName:@"RecordBreakfastDiabetesView"];
    }
    else if(buttonSelected == 2)
    {
        [DairyFunc addLineChartWithView:diabetesBackView withViewName:@"RecordLunchDiabetesView"];
        [DairyFunc addDiabetesDataView:diabetesBackView withViewName:@"RecordLunchDiabetesView"];
    }
    else if(buttonSelected == 3)
    {
        [DairyFunc addLineChartWithView:diabetesBackView withViewName:@"RecordDinnerDiabetesView"];
        [DairyFunc addDiabetesDataView:diabetesBackView withViewName:@"RecordDinnerDiabetesView"];
    }
    
    [view addSubview:diabetesBackView];
}

#pragma mark - initAddDiabetesViewsData
static UILabel *diabetesPickerDateLabel;
static UILabel *mealTypeLabel;
+ (void)initAddDiabetesLabels:(UIView *)view
{
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    [DairyModel initNewDiabetesCellData];
    diabetesPickerDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 121, 196, 40)];
    diabetesPickerDateLabel.textColor = [UIColor grayColor];
    diabetesPickerDateLabel.font = [UIFont systemFontOfSize:20];
    diabetesPickerDateLabel.textAlignment = NSTextAlignmentCenter;
    diabetesPickerDateLabel.text = sharedManagerDM.tempDiabetesDateString;
    [view addSubview:diabetesPickerDateLabel];
    
    
    mealTypeLabel =[[UILabel alloc]initWithFrame:CGRectMake(140, 190, 196, 40)];
    mealTypeLabel.textColor = [UIColor grayColor];
    mealTypeLabel.font = [UIFont systemFontOfSize:17];
    mealTypeLabel.textAlignment = NSTextAlignmentCenter;
    mealTypeLabel.text = sharedManagerDM.tempMealTypeString;
    //_sbpTextField.delegate = self;
    [view addSubview:mealTypeLabel];
}



#pragma mark - saveAddDiabetesData
+ (void)diabetesTimeChangeButtonPressed:(UIViewController *)viewController
{
    UIView *pickerView = [DairyFunc addPickerBackground:@"addDiabetesDairyTime"];
    [DairyFunc addDatePickerWithView:pickerView withName:@"addDiabetesDairy"];
    [viewController.view addSubview:pickerView];
}

+ (Boolean)verifyAddDiabetesDataContact:(NSString *)beforeString withAfter:(NSString *)afterString
{
    Boolean isContact;
    
    //判断textfield为空必须 isequaltostring：@“”,不能=nil
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    if ([sharedManagerDM.tempDiabetesDateString isEqualToString:@"- -"] || [sharedManagerDM.tempMealTypeString isEqualToString:@"- -"] || [beforeString isEqualToString:@""] || [afterString isEqualToString:@""])
    {
        isContact = NO;
    } else {
        isContact = YES;
    }
    return isContact;
}

+ (void)saveNewDiabetesDairyCellArray:(NSString *)beforeString withAfter:(NSString *)afterString
{
    //[ReminderModel saveNewMedReminderCellArray:medName];
    [DairyModel saveNewDiabetesDairyCellArray:beforeString withAfter:afterString];
    //新添加数据后发送通知更改cell界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveDiabetesCellData" object:self];
}


+ (void)addDiabetesDairyTimeConfirmed
{
    [DairyFunc removePickerBackground];
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-M-d"];
    sharedManagerDM.tempDiabetesDateString = [dateFormatter stringFromDate:sharedManagerDM.tempDiabetesDate];
    diabetesPickerDateLabel.text = sharedManagerDM.tempDiabetesDateString;
    //NSLog(@"date:%@", sharedManagerDM.tempBMIDate);
    //NSLog(@"dateString:%@", sharedManagerDM.tempDiabetesDateString);
    
}


+(void)mealTypeChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"medUnitChangeButtonPressed");
    UIView *pickerView = [DairyFunc addPickerBackground:@"mealType"];
    
    UIViewController *pickerViewController = [[MealTypePickerViewController alloc]init];
    //保障控件可以添加到页面当中
    [viewController addChildViewController:pickerViewController];
    [pickerView addSubview:pickerViewController.view];
    [pickerViewController didMoveToParentViewController:viewController];
    
    [viewController.view addSubview:pickerView];
}

+ (void)mealTypeChangeConfirmed
{
    [DairyFunc removePickerBackground];
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    mealTypeLabel.text = sharedManagerDM.tempMealTypeString;
}




#pragma mark - initBMIData
static UILabel *diabetesPickerDateLabel;
static UILabel *bmiPickerDateLabel;

UIView *bmiBackView;
+ (void)initBMIDairy:(UIView *)view
{
    [DairyModel getBMIDairyColumeArray];
    
    if (bmiBackView != NULL) {
        [bmiBackView removeFromSuperview];
    }
    bmiBackView = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIBARHEIGHT, WIDTH, HEIGHT - NAVIBARHEIGHT)];
    [DairyFunc addLineChartWithView:bmiBackView withViewName:@"RecordBMIView"];
    [DairyFunc addBMIDataView:bmiBackView];
    
    [view addSubview:bmiBackView];
    
}

#pragma mark - initAddBMIViewsData
static UILabel *bmiPickerDateLabel;
+ (void)initAddBMILabels:(UIView *)view
{
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    [DairyModel initNewBMICellData];
    
    bmiPickerDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 121, 196, 40)];
    bmiPickerDateLabel.textColor = [UIColor grayColor];
    bmiPickerDateLabel.font = [UIFont systemFontOfSize:20];
    bmiPickerDateLabel.textAlignment = NSTextAlignmentCenter;
    bmiPickerDateLabel.text = sharedManagerDM.tempBMIDateString;
    [view addSubview:bmiPickerDateLabel];
    
}


#pragma mark - saveAddBMIData
+ (void)bmiTimeChangeButtonPressed:(UIViewController *)viewController
{
    //NSLog(@"ageChangedButtonPressed");
    UIView *pickerView = [DairyFunc addPickerBackground:@"addBMIDairyTime"];
    [DairyFunc addDatePickerWithView:pickerView withName:@"addBMIDairy"];
    [viewController.view addSubview:pickerView];
}

+ (Boolean)verifyAddBMIDataContact:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString
{
    Boolean isContact;
    
    //判断textfield为空必须 isequaltostring：@“”,不能=nil
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    if ([sharedManagerDM.tempBMIDateString isEqualToString:@"- -"] || [heightString isEqualToString:@""] || [weightString isEqualToString:@""] || [waistlineString isEqualToString:@""]) {
        isContact = NO;
    } else {
        isContact = YES;
    }
    return isContact;
}

+ (void)saveNewBMIDairyCellArray:(NSString *)heightString withWeight:(NSString *)weightString withWaistline:(NSString *)waistlineString
{

    //[ReminderModel saveNewMedReminderCellArray:medName];
    [DairyModel saveNewBMIDairyCellArray:heightString withWeight:weightString withWaistline:waistlineString];
    //新添加数据后发送通知更改cell界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveBMICellData" object:self];

}

+ (void)addBMIDairyTimeConfirmed
{
    [DairyFunc removePickerBackground];
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-M-d"];
    sharedManagerDM.tempBMIDateString = [dateFormatter stringFromDate:sharedManagerDM.tempBMIDate];
    bmiPickerDateLabel.text = sharedManagerDM.tempBMIDateString;
    //NSLog(@"time1: %@", sharedManagerRM.tempMedDate);
}

#pragma mark - LineChart
+ (void)addLineChartWithView:(UIView *)view
                withViewName:(NSString *)viewNameString
{

    PNLineChart *lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 20, WIDTH, 245)];
    PNLineChartData *Data1 = [PNLineChartData new];
    PNLineChartData *Data2 = [PNLineChartData new];
    UIView *legend;
    NSUInteger num;
    //int intNum;
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    if ([viewNameString isEqual:@"RecordBreakfastDiabetesView"]) {
        
        num = [sharedManagerDM.diabetesDairyColumeArray1 count];
        NSMutableArray *diabetesBeforeArray = [NSMutableArray array];
        NSMutableArray *diabetesAfterArray = [NSMutableArray array];
        //intNum = (int)num;
        NSLog(@"diabetesDairyColumeArray1 Count:%lu",(unsigned long)num);
        
        int i;
        for (i = 0; i < num; i++) {
            [diabetesBeforeArray addObject:sharedManagerDM.diabetesDairyColumeArray1[i][1]];
        }
        NSLog(@"diabetesBeforeArray Count:%lu",[diabetesBeforeArray count]);
        // Line Chart No.1
        // 饭前
        Data1.color = PNFreshGreen;
        Data1.itemCount = diabetesBeforeArray.count;
        Data1.inflexionPointStyle = PNLineChartPointStyleCircle;
        Data1.getData = ^(NSUInteger index) {
            CGFloat yValue = [diabetesBeforeArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        // Line Chart No.2
        // 饭后
        for ( i = 0; i < num; i++) {
            [diabetesAfterArray addObject:sharedManagerDM.diabetesDairyColumeArray1[i][2]];
        }
        Data2.color = PNTwitterColor;
        Data2.itemCount = diabetesAfterArray.count;
        Data2.inflexionPointStyle = PNLineChartPointStyleTriangle;
        Data2.getData = ^(NSUInteger index) {
            CGFloat yValue = [diabetesAfterArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        lineChart.chartData = @[Data1, Data2];
        
        //Add Line Titles for the Legend
        Data1.dataTitle = @"饭前血糖(mmol/L)";
        Data2.dataTitle = @"饭后血糖(mmol/L)";
        
        //Build the legend
        lineChart.legendStyle = PNLegendItemStyleStacked;
        //lineChart.delegate = self;
        
        lineChart.showCoordinateAxis = YES; //显示坐标系
        lineChart.showGenYLabels = YES;
        lineChart.showLabel = YES;
        
        legend = [lineChart getLegendWithMaxWidth:320];
        
        //Move legend to the desired position and add to view
        [legend setFrame:CGRectMake(126, 231, legend.frame.size.width, legend.frame.size.height)];
        
        [lineChart strokeChart];
        [view addSubview:lineChart];
        [view addSubview:legend];
    }
    else if ([viewNameString isEqual:@"RecordLunchDiabetesView"])
    {
        
        num = [sharedManagerDM.diabetesDairyColumeArray2 count];
        NSMutableArray *diabetesBeforeArray = [NSMutableArray array];
        NSMutableArray *diabetesAfterArray = [NSMutableArray array];
        //intNum = (int)num;
        NSLog(@"diabetesDairyColumeArray1 Count:%lu",(unsigned long)num);
        
        int i;
        for (i = 0; i < num; i++) {
            [diabetesBeforeArray addObject:sharedManagerDM.diabetesDairyColumeArray2[i][1]];
        }
        NSLog(@"diabetesBeforeArray Count:%lu",[diabetesBeforeArray count]);
        // Line Chart No.1
        // 饭前
        Data1.color = PNFreshGreen;
        Data1.itemCount = diabetesBeforeArray.count;
        Data1.inflexionPointStyle = PNLineChartPointStyleCircle;
        Data1.getData = ^(NSUInteger index) {
            CGFloat yValue = [diabetesBeforeArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        // Line Chart No.2
        // 饭后
        for ( i = 0; i < num; i++) {
            [diabetesAfterArray addObject:sharedManagerDM.diabetesDairyColumeArray2[i][2]];
        }
        Data2.color = PNTwitterColor;
        Data2.itemCount = diabetesAfterArray.count;
        Data2.inflexionPointStyle = PNLineChartPointStyleTriangle;
        Data2.getData = ^(NSUInteger index) {
            CGFloat yValue = [diabetesAfterArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        lineChart.chartData = @[Data1, Data2];
        
        //Add Line Titles for the Legend
        Data1.dataTitle = @"饭前血糖(mmol/L)";
        Data2.dataTitle = @"饭后血糖(mmol/L)";
        
        //Build the legend
        lineChart.legendStyle = PNLegendItemStyleStacked;
        //lineChart.delegate = self;
        
        lineChart.showCoordinateAxis = YES; //显示坐标系
        lineChart.showGenYLabels = YES;
        lineChart.showLabel = YES;
        
        legend = [lineChart getLegendWithMaxWidth:320];
        
        //Move legend to the desired position and add to view
        [legend setFrame:CGRectMake(126, 231, legend.frame.size.width, legend.frame.size.height)];
        
        [lineChart strokeChart];
        [view addSubview:lineChart];
        [view addSubview:legend];
    }
    else if ([viewNameString isEqual:@"RecordDinnerDiabetesView"])
    {
        
        num = [sharedManagerDM.diabetesDairyColumeArray3 count];
        NSMutableArray *diabetesBeforeArray = [NSMutableArray array];
        NSMutableArray *diabetesAfterArray = [NSMutableArray array];
        //intNum = (int)num;
        NSLog(@"diabetesDairyColumeArray1 Count:%lu",(unsigned long)num);
        
        int i;
        for (i = 0; i < num; i++) {
            [diabetesBeforeArray addObject:sharedManagerDM.diabetesDairyColumeArray3[i][1]];
        }
        NSLog(@"diabetesBeforeArray Count:%lu",[diabetesBeforeArray count]);
        // Line Chart No.1
        // 饭前
        Data1.color = PNFreshGreen;
        Data1.itemCount = diabetesBeforeArray.count;
        Data1.inflexionPointStyle = PNLineChartPointStyleCircle;
        Data1.getData = ^(NSUInteger index) {
            CGFloat yValue = [diabetesBeforeArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        // Line Chart No.2
        // 饭后
        for ( i = 0; i < num; i++) {
            [diabetesAfterArray addObject:sharedManagerDM.diabetesDairyColumeArray3[i][2]];
        }
        Data2.color = PNTwitterColor;
        Data2.itemCount = diabetesAfterArray.count;
        Data2.inflexionPointStyle = PNLineChartPointStyleTriangle;
        Data2.getData = ^(NSUInteger index) {
            CGFloat yValue = [diabetesAfterArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        lineChart.chartData = @[Data1, Data2];
        
        //Add Line Titles for the Legend
        Data1.dataTitle = @"饭前血糖(mmol/L)";
        Data2.dataTitle = @"饭后血糖(mmol/L)";
        
        //Build the legend
        lineChart.legendStyle = PNLegendItemStyleStacked;
        //lineChart.delegate = self;
        
        lineChart.showCoordinateAxis = YES; //显示坐标系
        lineChart.showGenYLabels = YES;
        lineChart.showLabel = YES;
        
        legend = [lineChart getLegendWithMaxWidth:320];
        
        //Move legend to the desired position and add to view
        [legend setFrame:CGRectMake(126, 231, legend.frame.size.width, legend.frame.size.height)];
        
        [lineChart strokeChart];
        [view addSubview:lineChart];
        [view addSubview:legend];
    }
    else if ([viewNameString isEqual:@"RecordBMIView"])
    {
        num = [sharedManagerDM.bmiDairyColumeArray count];
        NSMutableArray *bmiArray = [NSMutableArray array];
        
        int i;
        for (i = 0; i < num; i++) {
            [bmiArray addObject:sharedManagerDM.bmiDairyColumeArray[i][4]];
        }
        
        Data1.color = PNTwitterColor;
        Data1.itemCount = bmiArray.count;
        Data1.inflexionPointStyle = PNLineChartPointStyleCircle;
        Data1.getData = ^(NSUInteger index) {
            CGFloat yValue = [bmiArray[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        lineChart.chartData = @[Data1];
        
        //Add Line Titles for the Legend
        Data1.dataTitle = @"体质参数";
        
        //Build the legend
        lineChart.legendStyle = PNLegendItemStyleStacked;
        //lineChart.delegate = self;
        
        if (num == 0) {
            lineChart.showGenYLabels = NO;
            lineChart.showLabel = NO;
        }
        else
        {
            lineChart.showLabel = YES;
            lineChart.showGenYLabels = YES;
        }
        
        lineChart.showCoordinateAxis = YES; //显示坐标系
        
        //self.lineChart.fontSize = 12.0;
        legend = [lineChart getLegendWithMaxWidth:320];
        
        //Move legend to the desired position and add to view
        [legend setFrame:CGRectMake(145, 239, legend.frame.size.width, legend.frame.size.height)];
        
        [lineChart strokeChart];
        [view addSubview:lineChart];
        [view addSubview:legend];
        
    }
    
}



#pragma mark - RecordDiabetesData
// *******************************************************************
+ (void)addDiabetesDataView:(UIView *)view withViewName:(NSString *)viewNameString
{

    // ***************************************************
    // Data Area
    UIView *inforDateView = [[UIView alloc]initWithFrame:CGRectMake(0, 289,149,22)];
    inforDateView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *inforBeforeView = [[UIView alloc]initWithFrame:CGRectMake(151, 289,111,22)];
    inforBeforeView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *inforAfterView = [[UIView alloc]initWithFrame:CGRectMake(264, 289,111,22)];
    inforAfterView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *separaotrY1 = [[UIView alloc]initWithFrame:CGRectMake(150, 289, 1, 22)];
    separaotrY1.backgroundColor = [UIColor whiteColor];
    
    UIView *separaotrY2 = [[UIView alloc]initWithFrame:CGRectMake(262, 289, 1, 22)];
    separaotrY2.backgroundColor = [UIColor whiteColor];
    
    UILabel *inforDateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 149, 22)];
    inforDateLabel.backgroundColor = [UIColor clearColor];
    inforDateLabel.opaque = NO;
    inforDateLabel.textColor = [UIColor whiteColor];
    inforDateLabel.font = [UIFont systemFontOfSize:14];
    inforDateLabel.textAlignment = NSTextAlignmentCenter;
    inforDateLabel.text = @"日期";
    
    UILabel *inforSbpLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 111, 22)];
    inforSbpLabel.backgroundColor = [UIColor clearColor];
    inforSbpLabel.opaque = NO;
    inforSbpLabel.textColor = [UIColor whiteColor];
    inforSbpLabel.font = [UIFont systemFontOfSize:14];
    inforSbpLabel.textAlignment = NSTextAlignmentCenter;
    inforSbpLabel.text = @"饭前血糖";
    
    UILabel *inforDbpLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 111, 22)];
    inforDbpLabel.backgroundColor = [UIColor clearColor];
    inforDbpLabel.opaque = NO;
    inforDbpLabel.textColor = [UIColor whiteColor];
    inforDbpLabel.font = [UIFont systemFontOfSize:14];
    inforDbpLabel.textAlignment = NSTextAlignmentCenter;
    inforDbpLabel.text = @"饭后血糖";
    
    [view addSubview:inforDateView];
    [view addSubview:inforBeforeView];
    [view addSubview:inforAfterView];
    
    [view addSubview:separaotrY1];
    [view addSubview:separaotrY2];
    
    [inforDateView addSubview:inforDateLabel];
    [inforBeforeView addSubview:inforSbpLabel];
    [inforAfterView addSubview:inforDbpLabel];
    
    UILabel *inforDateValueLabel;
    UILabel *beforeValueLabel;
    UILabel *afterValueLabel;
    UIView *separaotrY3;
    UIView *separaotrY4;
    UIView *separaotrX1;
    UIView *separaotrX2;
    
    NSUInteger num;
    NSString *dateString;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    
    if ([viewNameString isEqualToString: @"RecordBreakfastDiabetesView"]) {
        
        NSMutableArray *diabetesDateArray1 = [NSMutableArray array];
        NSMutableArray *beforeArray1 = [NSMutableArray array];
        NSMutableArray *afterArray1 = [NSMutableArray array];
        
        num = [sharedManagerDM.diabetesDairyColumeArray1 count];
        
        int i;
        for (i = 0; i < num; i++) {
            [diabetesDateArray1 addObject:sharedManagerDM.diabetesDairyColumeArray1[i][0]];
            [beforeArray1 addObject:sharedManagerDM.diabetesDairyColumeArray1[i][1]];
            [afterArray1 addObject:sharedManagerDM.diabetesDairyColumeArray1[i][2]];
            
        }
        //NSLog(@"afterAray: %lu", (unsigned long)[afterArray1 count]);
        
        int initialDataLabelHeight = 317;
        int initialSeparatorHeight = 312;
        int labelHeight = 0;
        int separatorHeight = 0;
        
        for(int i = 0; i < num; i++){
            
            labelHeight = initialDataLabelHeight + i*30;
            separatorHeight = initialSeparatorHeight + i*30;
            
            // 不能在循环外设定label的格式，否则数组的第一组数据无法显示
            inforDateValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, labelHeight, 149, 22)];
            inforDateValueLabel.textColor = [UIColor blackColor];
            inforDateValueLabel.font = [UIFont systemFontOfSize:14];
            dateString = [dateFormatter stringFromDate:[diabetesDateArray1 objectAtIndex: i]];
            inforDateValueLabel.text = [NSString stringWithFormat:@"%@", dateString];
            inforDateValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:inforDateValueLabel];
            
            beforeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(151, labelHeight, 111, 22)];
            beforeValueLabel.textColor = [UIColor blackColor];
            beforeValueLabel.font = [UIFont systemFontOfSize:14];
            beforeValueLabel.text = [NSString stringWithFormat:@"%@",[beforeArray1 objectAtIndex: i]];
            beforeValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:beforeValueLabel];
            
            afterValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(264, labelHeight, 111, 22)];
            afterValueLabel.textColor = [UIColor blackColor];
            afterValueLabel.font = [UIFont systemFontOfSize:14];
            afterValueLabel.text = [NSString stringWithFormat:@"%@",[afterArray1 objectAtIndex: i]];
            afterValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:afterValueLabel];
            
            separaotrX1 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight, 375, 1)];
            separaotrX1.backgroundColor = [UIColor whiteColor];
            
            separaotrX2 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight + 30, 375, 1)];
            separaotrX2.backgroundColor = [UIColor whiteColor];
            
            separaotrY3 = [[UIView alloc]initWithFrame:CGRectMake(150, separatorHeight, 1, 30)];
            separaotrY3.backgroundColor = [UIColor whiteColor];
            
            separaotrY4 = [[UIView alloc]initWithFrame:CGRectMake(262, separatorHeight, 1, 30)];
            separaotrY4.backgroundColor = [UIColor whiteColor];
            
            [view addSubview:separaotrX1];
            [view addSubview:separaotrX2];
            [view addSubview:separaotrY3];
            [view addSubview:separaotrY4];
        }
    }
    else if([viewNameString isEqualToString: @"RecordLunchDiabetesView"])
    {
        
        NSMutableArray *diabetesDateArray2 = [NSMutableArray array];
        NSMutableArray *beforeArray2 = [NSMutableArray array];
        NSMutableArray *afterArray2 = [NSMutableArray array];
        
        num = [sharedManagerDM.diabetesDairyColumeArray2 count];
        
        int i;
        for (i = 0; i < num; i++) {
            NSLog(@"diabetesDateArray2[i][0] %@", sharedManagerDM.diabetesDairyColumeArray2[i][0]);
            
            [diabetesDateArray2 addObject:sharedManagerDM.diabetesDairyColumeArray2[i][0]];
            [beforeArray2 addObject:sharedManagerDM.diabetesDairyColumeArray2[i][1]];
            [afterArray2 addObject:sharedManagerDM.diabetesDairyColumeArray2[i][2]];
            
        }
        //NSLog(@"afterAray: %lu", (unsigned long)[afterArray count]);
        
        int initialDataLabelHeight = 317;
        int initialSeparatorHeight = 312;
        int labelHeight = 0;
        int separatorHeight = 0;
        
        for(int i = 0; i < num; i++){
            
            labelHeight = initialDataLabelHeight + i*30;
            separatorHeight = initialSeparatorHeight + i*30;
            
            // 不能在循环外设定label的格式，否则数组的第一组数据无法显示
            inforDateValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, labelHeight, 149, 22)];
            inforDateValueLabel.textColor = [UIColor blackColor];
            inforDateValueLabel.font = [UIFont systemFontOfSize:14];
            dateString = [dateFormatter stringFromDate:[diabetesDateArray2 objectAtIndex: i]];
            inforDateValueLabel.text = [NSString stringWithFormat:@"%@", dateString];
            inforDateValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:inforDateValueLabel];
            
            beforeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(151, labelHeight, 111, 22)];
            beforeValueLabel.textColor = [UIColor blackColor];
            beforeValueLabel.font = [UIFont systemFontOfSize:14];
            beforeValueLabel.text = [NSString stringWithFormat:@"%@",[beforeArray2 objectAtIndex: i]];
            beforeValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:beforeValueLabel];
            
            afterValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(264, labelHeight, 111, 22)];
            afterValueLabel.textColor = [UIColor blackColor];
            afterValueLabel.font = [UIFont systemFontOfSize:14];
            afterValueLabel.text = [NSString stringWithFormat:@"%@",[afterArray2 objectAtIndex: i]];
            afterValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:afterValueLabel];
            
            separaotrX1 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight, 375, 1)];
            separaotrX1.backgroundColor = [UIColor whiteColor];
            
            separaotrX2 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight + 30, 375, 1)];
            separaotrX2.backgroundColor = [UIColor whiteColor];
            
            separaotrY3 = [[UIView alloc]initWithFrame:CGRectMake(150, separatorHeight, 1, 30)];
            separaotrY3.backgroundColor = [UIColor whiteColor];
            
            separaotrY4 = [[UIView alloc]initWithFrame:CGRectMake(262, separatorHeight, 1, 30)];
            separaotrY4.backgroundColor = [UIColor whiteColor];
            
            [view addSubview:separaotrX1];
            [view addSubview:separaotrX2];
            [view addSubview:separaotrY3];
            [view addSubview:separaotrY4];
        }
    }
    else if([viewNameString isEqualToString: @"RecordDinnerDiabetesView"])
    {
        NSMutableArray *diabetesDateArray3 = [NSMutableArray array];
        NSMutableArray *beforeArray3 = [NSMutableArray array];
        NSMutableArray *afterArray3 = [NSMutableArray array];
        
        num = [sharedManagerDM.diabetesDairyColumeArray3 count];
        
        int i;
        for (i = 0; i < num; i++) {
            [diabetesDateArray3 addObject:sharedManagerDM.diabetesDairyColumeArray3[i][0]];
            [beforeArray3 addObject:sharedManagerDM.diabetesDairyColumeArray3[i][1]];
            [afterArray3 addObject:sharedManagerDM.diabetesDairyColumeArray3[i][2]];
            
        }
        //NSLog(@"afterAray: %lu", (unsigned long)[afterArray count]);
        
        int initialDataLabelHeight = 317;
        int initialSeparatorHeight = 312;
        int labelHeight = 0;
        int separatorHeight = 0;
        
        for(int i = 0; i < num; i++){
            
            labelHeight = initialDataLabelHeight + i*30;
            separatorHeight = initialSeparatorHeight + i*30;
            
            // 不能在循环外设定label的格式，否则数组的第一组数据无法显示
            inforDateValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, labelHeight, 149, 22)];
            inforDateValueLabel.textColor = [UIColor blackColor];
            inforDateValueLabel.font = [UIFont systemFontOfSize:14];
            dateString = [dateFormatter stringFromDate:[diabetesDateArray3 objectAtIndex: i]];
            inforDateValueLabel.text = [NSString stringWithFormat:@"%@", dateString];
            inforDateValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:inforDateValueLabel];
            
            beforeValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(151, labelHeight, 111, 22)];
            beforeValueLabel.textColor = [UIColor blackColor];
            beforeValueLabel.font = [UIFont systemFontOfSize:14];
            beforeValueLabel.text = [NSString stringWithFormat:@"%@",[beforeArray3 objectAtIndex: i]];
            beforeValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:beforeValueLabel];
            
            afterValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(264, labelHeight, 111, 22)];
            afterValueLabel.textColor = [UIColor blackColor];
            afterValueLabel.font = [UIFont systemFontOfSize:14];
            afterValueLabel.text = [NSString stringWithFormat:@"%@",[afterArray3 objectAtIndex: i]];
            afterValueLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:afterValueLabel];
            
            separaotrX1 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight, 375, 1)];
            separaotrX1.backgroundColor = [UIColor whiteColor];
            
            separaotrX2 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight + 30, 375, 1)];
            separaotrX2.backgroundColor = [UIColor whiteColor];
            
            separaotrY3 = [[UIView alloc]initWithFrame:CGRectMake(150, separatorHeight, 1, 30)];
            separaotrY3.backgroundColor = [UIColor whiteColor];
            
            separaotrY4 = [[UIView alloc]initWithFrame:CGRectMake(262, separatorHeight, 1, 30)];
            separaotrY4.backgroundColor = [UIColor whiteColor];
            
            [view addSubview:separaotrX1];
            [view addSubview:separaotrX2];
            [view addSubview:separaotrY3];
            [view addSubview:separaotrY4];
        }
    }
    
    
        //[view addSubview:separaotrY3];
        
        //dataItemButtom = [[UIButton alloc]initWithFrame:CGRectMake(0, NAVIBARHEIGHT + separatorHeight -1, 375, 28)];
        //[dataItemButtom addTarget:self action:@selector(dataItemButtomPressed:) forControlEvents:UIControlEventTouchDown];
        //[dataItemButtom setTag:i+101];
        //[view addSubview:dataItemButtom];

    

}


#pragma mark - RecordBMIData
// *******************************************************************
+ (void)addBMIDataView:(UIView *)view
{
    
    // ***************************************************
    // Data Area
    //62, NAVIBARHEIGHT+324,149,22
    UIView *inforDateView = [[UIView alloc]initWithFrame:CGRectMake(0, 289,149,22)];
    inforDateView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *inforStatureView = [[UIView alloc]initWithFrame:CGRectMake(150, 289,55,22)];
    inforStatureView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *inforWeightView = [[UIView alloc]initWithFrame:CGRectMake(206, 289,55,22)];
    inforWeightView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *inforWaistlineView = [[UIView alloc]initWithFrame:CGRectMake(262, 289,55,22)];
    inforWaistlineView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *inforBMIView = [[UIView alloc]initWithFrame:CGRectMake(318, 289,57,22)];
    inforBMIView.backgroundColor = [GlobalFunc colorFromHexRGB:@"99CCCC"];
    
    UIView *separaotrY1 = [[UIView alloc]initWithFrame:CGRectMake(149, 289, 1, 22)];
    separaotrY1.backgroundColor = [UIColor whiteColor];
    
    UIView *separaotrY2 = [[UIView alloc]initWithFrame:CGRectMake(205, 289, 1, 22)];
    separaotrY2.backgroundColor = [UIColor whiteColor];
    
    UIView *separaotrY3 = [[UIView alloc]initWithFrame:CGRectMake(261, 289, 1, 22)];
    separaotrY3.backgroundColor = [UIColor whiteColor];
    
    UIView *separaotrY4 = [[UIView alloc]initWithFrame:CGRectMake(317, 289, 1, 22)];
    separaotrY4.backgroundColor = [UIColor whiteColor];
    
    UILabel *inforDateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 149, 22)];
    inforDateLabel.backgroundColor = [UIColor clearColor];
    inforDateLabel.opaque = NO;
    inforDateLabel.textColor = [UIColor whiteColor];
    inforDateLabel.font = [UIFont systemFontOfSize:14];
    inforDateLabel.textAlignment = NSTextAlignmentCenter;
    inforDateLabel.text = @"日期";
    
    UILabel *inforStatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 22)];
    inforStatureLabel.backgroundColor = [UIColor clearColor];
    inforStatureLabel.opaque = NO;
    inforStatureLabel.textColor = [UIColor whiteColor];
    inforStatureLabel.font = [UIFont systemFontOfSize:14];
    inforStatureLabel.textAlignment = NSTextAlignmentCenter;
    inforStatureLabel.text = @"身高";
    
    UILabel *inforWeightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 22)];
    inforWeightLabel.backgroundColor = [UIColor clearColor];
    inforWeightLabel.opaque = NO;
    inforWeightLabel.textColor = [UIColor whiteColor];
    inforWeightLabel.font = [UIFont systemFontOfSize:14];
    inforWeightLabel.textAlignment = NSTextAlignmentCenter;
    inforWeightLabel.text = @"体重";
    
    UILabel *inforWaistlineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 22)];
    inforWaistlineLabel.backgroundColor = [UIColor clearColor];
    inforWaistlineLabel.opaque = NO;
    inforWaistlineLabel.textColor = [UIColor whiteColor];
    inforWaistlineLabel.font = [UIFont systemFontOfSize:14];
    inforWaistlineLabel.textAlignment = NSTextAlignmentCenter;
    inforWaistlineLabel.text = @"腰围";
    
    UILabel *inforBMILabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 57, 22)];
    inforBMILabel.backgroundColor = [UIColor clearColor];
    inforBMILabel.opaque = NO;
    inforBMILabel.textColor = [UIColor whiteColor];
    inforBMILabel.font = [UIFont systemFontOfSize:14];
    inforBMILabel.textAlignment = NSTextAlignmentCenter;
    inforBMILabel.text = @"BMI";
    
    [view addSubview:inforDateView];
    [view addSubview:inforStatureView];
    [view addSubview:inforWeightView];
    [view addSubview:inforWaistlineView];
    [view addSubview:inforBMIView];
    
    [view addSubview:separaotrY1];
    [view addSubview:separaotrY2];
    [view addSubview:separaotrY3];
    [view addSubview:separaotrY4];
    
    [inforDateView addSubview:inforDateLabel];
    [inforStatureView addSubview:inforStatureLabel];
    [inforWeightView addSubview:inforWeightLabel];
    [inforWaistlineView addSubview:inforWaistlineLabel];
    [inforBMIView addSubview:inforBMILabel];
    

    UILabel *inforDateValue;
    UILabel *inforStatureValue;
    UILabel *inforWeightValue;
    UILabel *inforWaistlineValue;
    UILabel *inforBMIValue;
    UIView *separaotrY5;
    UIView *separaotrY6;
    UIView *separaotrY7;
    UIView *separaotrY8;
    UIView *separaotrX1;
    UIView *separaotrX2;
    
    NSUInteger num;
    NSString *dateString;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    num = [sharedManagerDM.bmiDairyColumeArray count];
    NSMutableArray *bmiDateArray = [NSMutableArray array];
    NSMutableArray *heightArray = [NSMutableArray array];
    NSMutableArray *weightArray = [NSMutableArray array];
    NSMutableArray *waistlineArray = [NSMutableArray array];
    NSMutableArray *bmiArray = [NSMutableArray array];
    
    int i;
    for (i = 0; i < num; i++) {
        [bmiDateArray addObject:sharedManagerDM.bmiDairyColumeArray[i][0]];
        [heightArray addObject:sharedManagerDM.bmiDairyColumeArray[i][1]];
        [weightArray addObject:sharedManagerDM.bmiDairyColumeArray[i][2]];
        [waistlineArray addObject:sharedManagerDM.bmiDairyColumeArray[i][3]];
        [bmiArray addObject:sharedManagerDM.bmiDairyColumeArray[i][4]];
    }
    
    int initialDataLabelHeight = 317;
    int initialSeparatorHeight = 312;
    int labelHeight = 0;
    int separatorHeight = 0;
    
    for(int i = 0; i < num; i++){
        
        labelHeight = initialDataLabelHeight + i*30;
        separatorHeight = initialSeparatorHeight + i*30;
        
        // 不能在循环外设定label的格式，否则数组的第一组数据无法显示
        //space 2
        inforDateValue = [[UILabel alloc]initWithFrame:CGRectMake(0, labelHeight, 149, 22)];
        //inforDateValue.backgroundColor = [UIColor clearColor];
        //inforDateValue.opaque = NO;
        inforDateValue.textColor = [UIColor blackColor];
        inforDateValue.font = [UIFont systemFontOfSize:14];
        dateString = [dateFormatter stringFromDate:[bmiDateArray objectAtIndex: i]];
        inforDateValue.text = [NSString stringWithFormat:@"%@", dateString];
        inforDateValue.textAlignment = NSTextAlignmentCenter;
        [view addSubview:inforDateValue];
        
        inforStatureValue = [[UILabel alloc]initWithFrame:CGRectMake(149, labelHeight, 55, 22)];
        inforStatureValue.textColor = [UIColor blackColor];
        inforStatureValue.font = [UIFont systemFontOfSize:14];
        inforStatureValue.text = [NSString stringWithFormat:@"%@",[heightArray objectAtIndex: i]];
        inforStatureValue.textAlignment = NSTextAlignmentCenter;
        [view addSubview:inforStatureValue];
        
        inforWeightValue = [[UILabel alloc]initWithFrame:CGRectMake(205, labelHeight, 55, 22)];
        inforWeightValue.textColor = [UIColor blackColor];
        inforWeightValue.font = [UIFont systemFontOfSize:14];
        inforWeightValue.text = [NSString stringWithFormat:@"%@",[weightArray objectAtIndex: i]];
        inforWeightValue.textAlignment = NSTextAlignmentCenter;
        [view addSubview:inforWeightValue];
        
        inforWaistlineValue = [[UILabel alloc]initWithFrame:CGRectMake(262, labelHeight, 55, 22)];
        inforWaistlineValue.textColor = [UIColor blackColor];
        inforWaistlineValue.font = [UIFont systemFontOfSize:14];
        inforWaistlineValue.text = [NSString stringWithFormat:@"%@",[waistlineArray objectAtIndex: i]];
        inforWaistlineValue.textAlignment = NSTextAlignmentCenter;
        [view addSubview:inforWaistlineValue];
        
        inforBMIValue = [[UILabel alloc]initWithFrame:CGRectMake(317, labelHeight, 57, 22)];
        inforBMIValue.textColor = [UIColor blackColor];
        inforBMIValue.font = [UIFont systemFontOfSize:14];
        inforBMIValue.text = [NSString stringWithFormat:@"%@",[bmiArray objectAtIndex: i]];
        inforBMIValue.textAlignment = NSTextAlignmentCenter;
        [view addSubview:inforBMIValue];
        
        separaotrX1 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight, 375, 1)];
        separaotrX1.backgroundColor = [UIColor whiteColor];
        
        separaotrX2 = [[UIView alloc]initWithFrame:CGRectMake(0, separatorHeight + 30, 375, 1)];
        separaotrX2.backgroundColor = [UIColor whiteColor];
        
        separaotrY5 = [[UIView alloc]initWithFrame:CGRectMake(149, separatorHeight, 1, 30)];
        separaotrY5.backgroundColor = [UIColor whiteColor];
        
        separaotrY6 = [[UIView alloc]initWithFrame:CGRectMake(205, separatorHeight, 1, 30)];
        separaotrY6.backgroundColor = [UIColor whiteColor];
        
        separaotrY7 = [[UIView alloc]initWithFrame:CGRectMake(261, separatorHeight, 1, 30)];
        separaotrY7.backgroundColor = [UIColor whiteColor];
        
        separaotrY8 = [[UIView alloc]initWithFrame:CGRectMake(317, separatorHeight, 1, 30)];
        separaotrY8.backgroundColor = [UIColor whiteColor];
        
        [view addSubview:separaotrX1];
        [view addSubview:separaotrX2];
        [view addSubview:separaotrY5];
        [view addSubview:separaotrY6];
        [view addSubview:separaotrY7];
        [view addSubview:separaotrY8];
        
        //dataItemButtom = [[UIButton alloc]initWithFrame:CGRectMake(0, NAVIBARHEIGHT + separatorHeight -1, 375, 28)];
        //[dataItemButtom addTarget:self action:@selector(dataItemButtomPressed:) forControlEvents:UIControlEventTouchDown];
        //[dataItemButtom setTag:i+121];
        //[view addSubview:dataItemButtom];
        
    }
    
}








#pragma mark - DatePickerView （datePickerScrolled: tag:>=300）
static UIDatePicker *datePicker;
+(void)addDatePickerWithView:(UIView *)view
                    withName:(NSString *)viewNameString
{
    //0, HEIGHT - NAVIBARHEIGHT - 194, WIDTH, 195
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 194,WIDTH,195)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    //datePicker.datePickerMode = UIDatePickerModeTime;
    //datePicker.minuteInterval = 60;
    datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [datePicker addTarget:self action:@selector(datePickerScrolled:) forControlEvents:UIControlEventValueChanged];
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    if ([viewNameString isEqual:@"addDiabetesDairy"]) {
        [datePicker setTag:1];
        sharedManagerDM.tempDiabetesDate = datePicker.date;
    }
    else if([viewNameString isEqual:@"addBMIDairy"]){
        [datePicker setTag:10];
        //设定默认值，不旋转pickerview时有值显示
        sharedManagerDM.tempBMIDate = datePicker.date;
    }
    
    [view addSubview:datePicker];
}


+ (void)datePickerScrolled:(id)sender
{
    
    DairyModel *sharedManagerDM = [DairyModel sharedManager];
    if ([sender tag] == 1) {
        sharedManagerDM.tempDiabetesDate = datePicker.date;
    }
    else if ([sender tag] == 10){
        sharedManagerDM.tempBMIDate = datePicker.date;
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
    if ([buttonString isEqualToString:@"addDiabetesDairyTime"]) {
        [confirmButton addTarget:self action:@selector(addDiabetesDairyTimeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if ([buttonString isEqualToString:@"addBMIDairyTime"]) {
        [confirmButton addTarget:self action:@selector(addBMIDairyTimeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    else if([buttonString isEqualToString:@"mealType"]){
     [confirmButton addTarget:self action:@selector(mealTypeChangeConfirmed) forControlEvents:UIControlEventTouchDown];
    }
    /*
     else if([buttonString isEqualToString:@"sportsTime"]){
     [confirmButton addTarget:self action:@selector(meausreTimeChangeConfirmed) forControlEvents:UIControlEventTouchDown];
     }
     else if([buttonString isEqualToString:@"measureTime"]){
     [confirmButton addTarget:self action:@selector(meausreTimeChangeConfirmed) forControlEvents:UIControlEventTouchDown];
     }
     */
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


@end
