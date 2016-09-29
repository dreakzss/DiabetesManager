//
//  SportsCellView.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/5.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "SportsCellView.h"
#import "GlobalFunc.h"
#import "ReminderFunc.h"
@implementation SportsCellView

-(id)initCellView:(NSInteger)indexNum
    withCellArray:(NSMutableArray *)sportsReminderCellArray
{
    self = [super init];
    
    if (self) {
        NSInteger yOffSet = 0;
        yOffSet = indexNum * 85;
        self.frame = CGRectMake(0, NAVIBARHEIGHT + yOffSet, WIDTH, 85);
        
        //medCellNum(nsintger),date,medicineName, unit
        //NSDate *date = [NSDate date];
        _tempCellArray = sportsReminderCellArray;
        _tempIndex = indexNum;
        
        NSDate *time = _tempCellArray[1];
        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"HH:mm"];
        NSString *timeString = [dateformatter stringFromDate:time];
        //NSLog(@"%@",timeString);
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 18, 100, 30)];
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.opaque = NO;
        timeLabel.textColor = [UIColor blackColor];
        timeLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:35];
        timeLabel.textAlignment = NSTextAlignmentLeft;
        if (_tempCellArray[4] == [NSNumber numberWithInt:0]) {
            timeLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[4] == [NSNumber numberWithInt:1]){
            timeLabel.textColor = [UIColor blackColor];
        }
        timeLabel.text = timeString;
        
        [self addSubview:timeLabel];
        //myLabel.adjustsFontSizeToFitWidth = YES;
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 55, 100, 20)];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.opaque = NO;
        dateLabel.textColor = [UIColor blackColor];
        dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        dateLabel.textAlignment = NSTextAlignmentLeft;
        dateLabel.text = @"闹钟";
        if (_tempCellArray[4] == [NSNumber numberWithInt:0]) {
            dateLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[4] == [NSNumber numberWithInt:1]){
            dateLabel.textColor = [UIColor blackColor];
        }
        [self addSubview:dateLabel];
        
        UISwitch *onSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(308, 25, 0, 0)];
        if (_tempCellArray[4] == [NSNumber numberWithInt:0]) {
            [onSwitch setOn:NO];
        }
        else if (_tempCellArray[4] == [NSNumber numberWithInt:1]){
            [onSwitch setOn:YES];
        }
        onSwitch.tintColor = [UIColor grayColor];
        [onSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:onSwitch];
        
        UILabel *sportsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 23, 141, 20)];
        sportsNameLabel.textColor = [UIColor blackColor];
        sportsNameLabel.font = [UIFont systemFontOfSize:18];
        sportsNameLabel.textAlignment = NSTextAlignmentCenter;
        sportsNameLabel.text = _tempCellArray[2];
        sportsNameLabel.adjustsFontSizeToFitWidth = YES;
        if (_tempCellArray[4] == [NSNumber numberWithInt:0]) {
            sportsNameLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[4] == [NSNumber numberWithInt:1]){
            sportsNameLabel.textColor = [UIColor blackColor];
        }
        [self addSubview:sportsNameLabel];
        
        UILabel *exerciseTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 53, 141, 15)];
        exerciseTimeLabel.backgroundColor = [UIColor clearColor];
        exerciseTimeLabel.opaque = NO;
        exerciseTimeLabel.textColor = [UIColor blackColor];
        exerciseTimeLabel.font = [UIFont systemFontOfSize:16];
        exerciseTimeLabel.textAlignment = NSTextAlignmentCenter;
        NSString *tempExerciseString = _tempCellArray[3];
        tempExerciseString = [tempExerciseString stringByAppendingString:@"  分钟"];
        exerciseTimeLabel.text = tempExerciseString;
        if (_tempCellArray[4] == [NSNumber numberWithInt:0]) {
            exerciseTimeLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[4] == [NSNumber numberWithInt:1]){
            exerciseTimeLabel.textColor = [UIColor blackColor];
        }
        [self addSubview:exerciseTimeLabel];
        
        //UILabel *unitTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(194, 53, 20, 15)];
        //unitTypeLabel.backgroundColor = [UIColor clearColor];
        //unitTypeLabel.opaque = NO;
        //unitTypeLabel.textColor = [UIColor blackColor];
        //unitTypeLabel.font = [UIFont systemFontOfSize:16];
        //unitTypeLabel.textAlignment = NSTextAlignmentLeft;
        //unitTypeLabel.text = _tempCellArray[4];
        //[self addSubview:unitTypeLabel];
        
        UIView *separatorX1 = [[UIView alloc]initWithFrame:CGRectMake(15, 0, WIDTH - 30, 1)];
        separatorX1.backgroundColor = [GlobalFunc colorFromHexRGB:@"D3D3D3"];
        //[reminder1View addSubview:separatorX1];
        
        UIView *separatorX2 = [[UIView alloc]initWithFrame:CGRectMake(15, 85, WIDTH - 30, 1)];
        separatorX2.backgroundColor = [GlobalFunc colorFromHexRGB:@"D3D3D3"];
        [self addSubview:separatorX2];
        
        UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        editButton.frame = CGRectMake(265, 28, 24, 24);
        //editButton.adjustsImageWhenHighlighted = NO;
        [editButton setImage:[UIImage imageNamed:@"Edit.png"] forState:UIControlStateNormal];
        [editButton setImage:[UIImage imageNamed:@"Edit-Selected.png"] forState:UIControlStateSelected];
        [editButton addTarget:self action:@selector(editButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:editButton];
        
    }
    
    return self;
}

-(void)switchChanged:(id)sender
{
    UISwitch *swi2=(UISwitch *)sender;
    //UIApplication *application = [UIApplication sharedApplication];
    if (swi2.isOn) {
        NSLog(@"On");
        //[ReminderFunc medSwitchSelected:_tempIndex withStatus:YES];
        [ReminderFunc sportsSwitchSelected:_tempIndex withStatus:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"saveSportsReCellData" object:self];
        //application.applicationIconBadgeNumber += 1;
        
    }else{
        NSLog(@"Off");
        //[ReminderFunc medSwitchSelected:_tempIndex withStatus:NO];
        [ReminderFunc sportsSwitchSelected:_tempIndex withStatus:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"saveSportsReCellData" object:self];
        //application.applicationIconBadgeNumber -= 1;
    }
}

-(void)editButtonPressed
{
    //[ReminderFunc medEditButtonPressed:_tempIndex];
    [ReminderFunc sportsEditButtonPressed:_tempIndex];
}



@end
