//
//  ExerciseTimePickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/6.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "GlobalFunc.h"
#import "ReminderModel.h"
@interface ExerciseTimePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSString *exerciseTimeString1;
    NSString *exerciseTimeString2;
}

@property UIPickerView *pickerView;
@property NSString *exerciseTime;

@end
