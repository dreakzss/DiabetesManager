//
//  User+CoreDataProperties.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/23.
//  Copyright © 2016年 Haoran. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *age;
@property (nullable, nonatomic, retain) NSString *bloodPressure;
@property (nullable, nonatomic, retain) NSString *bmi;
@property (nullable, nonatomic, retain) NSString *cholesterol;
@property (nullable, nonatomic, retain) NSData *evaluteResults;
@property (nullable, nonatomic, retain) NSString *fruitSituation;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *height;
@property (nullable, nonatomic, retain) NSString *meatSituation;
@property (nullable, nonatomic, retain) NSString *realname;
@property (nullable, nonatomic, retain) NSString *relativesSituation;
@property (nullable, nonatomic, retain) NSString *triglyceride;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *waistline;
@property (nullable, nonatomic, retain) NSString *weight;

@end

NS_ASSUME_NONNULL_END
