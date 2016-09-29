//
//  GlobalFunc.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/27.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "GlobalFunc.h"

@implementation GlobalFunc

#pragma mark - GlobalFunctions

static GlobalFunc *sharedManager = nil;
+ (GlobalFunc *)sharedManager
{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        
    });
    return sharedManager;
}

+ (void)moveForwardFromView:(UIView *)fromView
          moveForwardToView:(UIView *)toView
{
    [UIView animateWithDuration:0.30
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                     animations:^{
                         //开始动画
                         [fromView addSubview:toView];
             
                         fromView.transform = CGAffineTransformMakeTranslation(-60, 0);
                         toView.transform = CGAffineTransformMakeTranslation(60-WIDTH, 0);
                         
                     }
                     completion:^(BOOL finished){
                         //[self.view removeFromSuperview];
                     }];


}

+ (void)moveBackFromView:(UIView *)fromView
          moveBackToView:(UIView *)toView
{

    [UIView animateWithDuration:0.30
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                     animations:^{
                         //开始动画
                         toView.superview.transform = CGAffineTransformMakeTranslation(0, 0);
                         toView.transform = CGAffineTransformMakeTranslation(WIDTH, 0);
                         //[self MoveBack:self.view.superview];
                         
                     }
                     completion:^(BOOL finished){
                         [fromView removeFromSuperview];
                     }];

}

+ (void)moveBackFromAddView:(UIView *)fromView
             moveBackToView:(UIView *)toView
{
    
    [toView bringSubviewToFront:fromView];
    [UIView animateWithDuration:0.30
                          delay:0.14
                        options:UIViewAnimationOptionCurveEaseIn//设置动画类型
                     animations:^{
                         //开始动画
                         //[fromView.superview bringSubviewToFront:fromView];
                         toView.superview.transform = CGAffineTransformMakeTranslation(0, 0);
                         toView.transform = CGAffineTransformMakeTranslation(WIDTH-40, 0);
                         //[self MoveBack:self.view.superview];
                         
                     }
                     completion:^(BOOL finished){
                         [fromView removeFromSuperview];
                     }];
    
}



+ (UIColor *)colorFromHexRGB:(NSString *)colorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != colorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:colorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
