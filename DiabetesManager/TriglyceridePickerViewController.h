//
//  TriglyceridePickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "GlobalFunc.h"
@interface TriglyceridePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSString *string1;
    NSString *string2;
}
@property UIPickerView *pickerView;
@property NSString *triglyceride;

@end
