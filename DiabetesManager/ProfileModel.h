//
//  ProfileModel.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/7/24.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileModel : NSObject

#pragma mark - Profile Data
@property NSString *usernameString;
@property NSString *phoneNumString;
@property NSString *genderString;
@property NSString *ageString;
@property NSString *waistlineString;
@property NSString *heightString;
@property NSString *weightString;
@property NSString *bmiString;
@property NSString *relativesSituationString;
@property NSString *occupationSituationString;
@property NSString *sportsSituationString;
@property NSString *meatSituationString;
@property NSString *fruitSituationString;
@property NSString *drinkSituationString;
@property NSString *smokeSituationString;
@property NSString *glucoseString;
@property NSString *bloodPressureString;
@property NSString *cholesterolString;
@property NSString *triglycerideSttring;

+ (ProfileModel *)sharedManager;

//不能用类方法
- (void)initProfileData;

@end
