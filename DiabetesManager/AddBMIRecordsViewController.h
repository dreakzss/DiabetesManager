//
//  AddBMIRecordsViewController.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/28.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddBMIRecordsViewController : UIViewController<UIAlertViewDelegate, UITextFieldDelegate>


@property UITextField *heightTextField;
@property UITextField *weightTextField;
@property UITextField *waistlineTextField;

@end
