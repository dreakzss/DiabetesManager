//
//  EvaluteFunc.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalFunc.h"
#import "GlobalDef.h"
#import <UIKit/UIKit.h>
@interface EvaluteFunc : NSObject

+ (void)addEvaluteView:(UIViewController *)viewController;

+ (void)moveBackFromEvalute:(UIView *)fromView
             moveBackToView:(UIView *)toView;
@end
