//
//  TriglyceridePickerViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "TriglyceridePickerViewController.h"

@implementation TriglyceridePickerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 194, WIDTH, 195);
    self.view.backgroundColor = [UIColor clearColor];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
    //[self.pickerView reloadAllComponents];
    
    array1 = @[@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    array2 = @[@".0",@".1",@".2",@".3",@".4",@".5",@".6",@".7",@".8",@".9",];
    string1 = @"6";
    string2 = @".5";
    
    [self.pickerView selectRow:4 inComponent:0 animated:NO];
    [self.pickerView selectRow:5 inComponent:1 animated:NO];
}

- (NSString *)getString
{
    return _triglyceride;
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
        string1 = [array1 objectAtIndex:row];
        //NSLog(@"array1S : %@", string1);
    }else{
        string2 = [array2 objectAtIndex:row];
        //NSLog(@"array2S : %@", string2);
    }
    _triglyceride = [string1 stringByAppendingString:string2];
    //NSLog(@"_waistline: %@", a);
}

@end
