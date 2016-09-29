//
//  ProfileViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/5.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIScrollViewDelegate, UITextFieldDelegate>
{
    UIView *drinkDataView;
    UIView *smokeDataView;
    UIScrollView *scrollView;
    UIView *backView;
    
    float offSet;
    
    UIViewController *drinkDataViewController;
    UIViewController *smokeDataViewController;
    
    UIButton *changeButton;
    UIButton *saveButton;
    
    UITextField *usernameTextField;
    UITextField *phoneNumTextField;
    UILabel *phoneNumLabel;
    
    UIButton *genderChangedButton;
    UIButton *ageChangedButton;
    UIButton *waistlineChangedButton;
    UIButton *heightValueChangedButton;
    UIButton *weightValueChangedButton;
    UIButton *bmiValueChangedButton;
    
    UIButton *relativesSituationChangedButton;
    UIButton *occupationSituationChangedButton;
    UIButton *sportsSituationChangedButton;
    UIButton *meatSituationChangedButton;
    UIButton *fruitSituationChangedButton;
    UIButton *drinkSituationChangedButton;
    UIButton *smokeSituationChangedButton;
    UIButton *glucoseValueChangedButton;
    UIButton *bloodPressureValueChangedButton;
    UIButton *cholesterolValueChangedButton;
    UIButton *triglycerideValueChangedButton;
    
}

@end
