//
//  WeightPickerViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "WeightPickerViewController.h"

@implementation WeightPickerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 194, WIDTH, 195);
    self.view.backgroundColor = [UIColor clearColor];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
    //[self.pickerView reloadAllComponents];
    
    array1 = @[@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    array2 = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",];
    weightString1 = @"6";
    weightString2 = @"5";
    
    //设置临时初始值
    NSString *string0;
    NSString *unit = @" kg";
    string0 = [weightString1 stringByAppendingString:weightString2];
    _weight = [string0 stringByAppendingString:unit];
    //NSLog(@"tempAge:%@",_age);
    
    //存储temp数据
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    sharedManagerPF.tempProfileWeight = _weight;
    
    [self.pickerView selectRow:3 inComponent:0 animated:NO];
    [self.pickerView selectRow:5 inComponent:1 animated:NO];
}

- (NSString *)getString
{
    return _weight;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0){
        //NSLog(@"array1 : %lu", (unsigned long)[array1 count]);
        return [array1 count];
    }
    else{
        //NSLog(@"array2 : %lu", (unsigned long)[array2 count]);
        return [array2 count];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 100;
    //return self.view.frame.size.width/2;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *valueString;
    if (component == 0){
        valueString = [array1 objectAtIndex:row];
    }else{
        valueString = [array2 objectAtIndex:row];
    }
    return  valueString;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0){
        weightString1 = [array1 objectAtIndex:row];
        //NSLog(@"array1S : %@", string1);
    }else{
        weightString2 = [array2 objectAtIndex:row];
        //NSLog(@"array2S : %@", string2);
    }
    NSString *string0;
    NSString *unit = @" kg";
    string0 = [weightString1 stringByAppendingString:weightString2];
    _weight = [string0 stringByAppendingString:unit];
    //NSLog(@"_weight: %@", a);
    
    //数值发生更改后更改临时值
    ProfileFunc *sharedManagerPF = [ProfileFunc sharedManager];
    sharedManagerPF.tempProfileWeight = _weight;
}
@end
