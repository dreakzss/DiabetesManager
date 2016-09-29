//
//  TriangleGrayView.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/14.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "TriangleGrayView.h"

@implementation TriangleGrayView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //[self drawLine];
    
    //1.获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制三角形
    CGContextMoveToPoint(context, 0, 15);
    CGContextAddLineToPoint(context, 15, 15);
    CGContextAddLineToPoint(context, 15, 0);
    //关闭路径，闭环，（连接起点和最后一个点）
    
    //自定义颜色
    //UIColor *color = [UIColor grayColor];
    //CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextSetLineWidth(context, 1);
    CGContextClosePath(context);
    [[UIColor grayColor] set];
    [[UIColor grayColor] setFill];
    
    //显示在view上
    //CGContextStrokePath(context);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

@end
