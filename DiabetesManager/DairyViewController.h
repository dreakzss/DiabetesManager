//
//  DairyViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DairyViewController : UIViewController
{
    UIView *recordDiabetesView;
    UIView *recordBMIView;
    UIView *recordDietsView;
    
    UIViewController *recordDiabetesViewController;
    UIViewController *recordBMIViewController;
    UIViewController *recordDietsViewController;
    
};

@end
