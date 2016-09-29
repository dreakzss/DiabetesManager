//
//  ViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    UIView *dairyView;
    
    UIView *profileView;
    UIView *reminderView;
    UIView *evaluteView;
    
    UIView *setView;
    UIView *evaluteResultView;
    UIView *commonKnowledgeView;
    UIView *loginView;
    
    
    UIViewController *setViewController;
    
    UIViewController *evaluteResultViewController;
    
    UIViewController *dairyViewController;
    UIViewController *profileViewController;
    UIViewController *reminderViewController;
    UIViewController *evaluteViewController;
    
    UIViewController *commonKnowledgeViewController;
    UIViewController *loginViewController;
};


@end

