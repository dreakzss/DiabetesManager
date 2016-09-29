//
//  GlucosePickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "GlobalFunc.h"
@interface GlucosePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    NSString *string1;
    NSString *string2;
    NSString *string3;
}

@property UIPickerView *pickerView;
@property NSString *glucose;

@end
