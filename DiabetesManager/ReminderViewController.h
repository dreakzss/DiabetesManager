//
//  ReminderViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/14.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderViewController : UIViewController
{
    UIView *remindMedicineView;
    UIView *remindSportsView;
    UIView *remindMeasurementView;
    
    UIViewController *remindMedicineViewController;
    UIViewController *remindSportsViewController;
    UIViewController *remindMeasurementViewController;
    
};

@end
