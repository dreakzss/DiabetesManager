//
//  WeightPickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "ProfileFunc.h"
@interface WeightPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSString *weightString1;
    NSString *weightString2;
}

@property UIPickerView *pickerView;
@property NSString *weight;
@end
