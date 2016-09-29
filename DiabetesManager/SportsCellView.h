//
//  SportsCellView.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/5.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportsCellView : UIView

-(id)initCellView:(NSInteger)indexNum
    withCellArray:(NSMutableArray *)sportsReminderCellArray;

@property NSMutableArray *tempCellArray;

@property NSInteger tempIndex;

@end
