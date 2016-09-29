//
//  GlobalFunc.h
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height

#define NAVIBARHEIGHT 75
#define BUTTONSAREAHEIGHT 35 //dairy按钮区高度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GlobalDef.h"
#import "PNChart.h"
#import "AgePickerViewController.h"
#import "WaistlinePickerViewController.h"
#import "HeightPickerViewController.h"
#import "WeightPickerViewController.h"
#import "GlucosePickerViewController.h"
#import "CholesterolPickerViewController.h"
#import "TriglyceridePickerViewController.h"
#import "TriangleGrayView.h"
#import "TriangleBlueView.h"


@interface GlobalFunc : NSObject<UITextFieldDelegate>

+ (GlobalFunc *)sharedManager;

+ (UIColor *)colorFromHexRGB:(NSString *)ColorString;

+ (void)moveForwardFromView:(UIView *)fromView
          moveForwardToView:(UIView *)toView;

+ (void)moveBackFromView:(UIView *)fromView
          moveBackToView:(UIView *)toView;

+ (void)moveBackFromAddView:(UIView *)fromView
             moveBackToView:(UIView *)toView;


@end
