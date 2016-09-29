//
//  AgePickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/18.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
//#import "GlobalFunc.h"
#import "ProfileFunc.h"
@interface AgePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSString *ageString1;
    NSString *ageString2;
}

@property UIPickerView *pickerView;
@property NSString *age;

@end
