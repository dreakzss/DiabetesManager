//
//  UnitPickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/3.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "GlobalFunc.h"
#import "ReminderModel.h"
@interface UnitPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array;
    
    //NSString *unitString;
}

@property UIPickerView *pickerView;
@property NSString *unit;

@end
