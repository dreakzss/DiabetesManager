//
//  WaistlinePickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "ProfileFunc.h"
@interface WaistlinePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSString *waistlineString1;
    NSString *waistlineString2;
}

@property UIPickerView *pickerView;
@property NSString *waistline;
@end
