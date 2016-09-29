//
//  MedCell.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/2.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedCellView : UIView

-(id)initCellView:(NSInteger)indexNum
    withCellArray:(NSMutableArray *)medReminderCellArray;

@property NSMutableArray *tempCellArray;

@property NSInteger tempIndex;

@end
