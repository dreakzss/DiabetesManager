//
//  ReminderModel.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/1.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReminderModel : NSObject

+ (ReminderModel *)sharedManager;

#pragma mark - Med

+ (void)getMedReminderColumeArray;

+ (void)initNewMedCellData;

+ (void)initEditMedCellData;

+ (void)saveNewMedReminderCellArray:(NSString *)medName;

+ (void)saveEditMedReminderCellArray:(NSString *)medName;


@property NSMutableArray *medReminderColumeArray;

@property NSMutableArray *editmedReminderCellArray;

@property NSDate *tempMedDate;
@property NSString *tempMedDateString;
@property NSString *tempMedNameString;
@property NSString *tempDosageString;
@property NSString *tempUnitString;

@property bool isMedEdit;


#pragma mark - Sports

+ (void)getSportsReminderColumeArray;

+ (void)initNewSportsCellData;

+ (void)initEditSportsCellData;

+ (void)saveNewSportsReminderCellArray:(NSString *)sportsName;

+ (void)saveEditSportsReminderCellArray:(NSString *)sportsName;


@property NSMutableArray *sportsReminderColumeArray;

@property NSMutableArray *editSportsReminderCellArray;

@property NSDate *tempSportsDate;
@property NSString *tempSportsDateString;
@property NSString *tempSportsNameString;
@property NSString *tempExceriseTimeString;

@property bool isSportsEdit;



@end
