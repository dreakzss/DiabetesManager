//
//  MedCell.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/2.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "MedCellView.h"
#import "GlobalFunc.h"
#import "ReminderFunc.h"


@implementation MedCellView

-(id)initCellView:(NSInteger)indexNum
    withCellArray:(NSMutableArray *)medReminderCellArray
{
    self = [super init];
    
    if (self) {
        NSInteger yOffSet = 0;
        yOffSet = indexNum * 85;
        self.frame = CGRectMake(0, NAVIBARHEIGHT + yOffSet, WIDTH, 85);
        
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            self.backgroundColor = [UIColor clearColor];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            self.backgroundColor = [UIColor blueColor];
        }
        
        //medCellNum(nsintger),date,medicineName, unit
        //NSDate *date = [NSDate date];
        _tempCellArray = medReminderCellArray;
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
        
        timeLabel.text = timeString;
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            timeLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            timeLabel.textColor = [UIColor blackColor];
        }

        [self addSubview:timeLabel];
        //myLabel.adjustsFontSizeToFitWidth = YES;
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 55, 100, 20)];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.opaque = NO;
        //dateLabel.textColor = [UIColor blackColor];
        dateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        dateLabel.textAlignment = NSTextAlignmentLeft;
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            dateLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            dateLabel.textColor = [UIColor blackColor];
        }
        dateLabel.text = @"闹钟";
        
        [self addSubview:dateLabel];
        
        UISwitch *onSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(308, 25, 0, 0)];
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            [onSwitch setOn:NO];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            [onSwitch setOn:YES];
        }
        onSwitch.tintColor = [UIColor grayColor];
        [onSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:onSwitch];
        
        UILabel *medNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 23, 141, 20)];
        //medNameLabel.textColor = [UIColor blackColor];
        medNameLabel.font = [UIFont systemFontOfSize:18];
        medNameLabel.textAlignment = NSTextAlignmentCenter;
        medNameLabel.text = _tempCellArray[2];
        medNameLabel.adjustsFontSizeToFitWidth = YES;
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            medNameLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            medNameLabel.textColor = [UIColor blackColor];
        }
        [self addSubview:medNameLabel];
        
        UILabel *dosageLabel = [[UILabel alloc] initWithFrame:CGRectMake(174, 53, 20, 15)];
        dosageLabel.backgroundColor = [UIColor clearColor];
        dosageLabel.opaque = NO;
        //dosageLabel.textColor = [UIColor blackColor];
        dosageLabel.font = [UIFont systemFontOfSize:16];
        dosageLabel.textAlignment = NSTextAlignmentLeft;
        dosageLabel.text = _tempCellArray[3];
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            dosageLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            dosageLabel.textColor = [UIColor blackColor];
        }
        [self addSubview:dosageLabel];
        
        UILabel *unitTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(194, 53, 20, 15)];
        unitTypeLabel.backgroundColor = [UIColor clearColor];
        unitTypeLabel.opaque = NO;
        //unitTypeLabel.textColor = [UIColor blackColor];
        unitTypeLabel.font = [UIFont systemFontOfSize:16];
        unitTypeLabel.textAlignment = NSTextAlignmentLeft;
        unitTypeLabel.text = _tempCellArray[4];
        if (_tempCellArray[5] == [NSNumber numberWithInt:0]) {
            unitTypeLabel.textColor = [UIColor grayColor];
        }
        else if (_tempCellArray[5] == [NSNumber numberWithInt:1]){
            unitTypeLabel.textColor = [UIColor blackColor];
        }
        [self addSubview:unitTypeLabel];
        
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
        [ReminderFunc medSwitchSelected:_tempIndex withStatus:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"saveMedReCellData" object:self];
        //application.applicationIconBadgeNumber += 1;
        
    }else{
        NSLog(@"Off");
        [ReminderFunc medSwitchSelected:_tempIndex withStatus:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"saveMedReCellData" object:self];
        //application.applicationIconBadgeNumber -= 1;
    }
}


-(void)editButtonPressed
{
    [ReminderFunc medEditButtonPressed:_tempIndex];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
