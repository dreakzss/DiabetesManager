//
//  HeightPickerViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "ProfileFunc.h"
@interface HeightPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    NSString *heightString1;
    NSString *heightString2;
    NSString *heightString3;
}

@property UIPickerView *pickerView;
@property NSString *height;

@end
