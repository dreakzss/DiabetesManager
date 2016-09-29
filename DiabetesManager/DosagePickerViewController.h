//
//  DosagePickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/3.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "GlobalFunc.h"
#import "ReminderModel.h"

@interface DosagePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array;
}

@property UIPickerView *pickerView;
@property NSString *dosage;

@end
