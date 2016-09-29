//
//  GlucosePickerViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/19.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "GlucosePickerViewController.h"

@implementation GlucosePickerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 194, WIDTH, 195);
    self.view.backgroundColor = [UIColor clearColor];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
    //[self.pickerView reloadAllComponents];
    
    array1 = @[@"0",@"1"];
    array2 = @[@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    array3 = @[@".0",@".1",@".2",@".3",@".4",@".5",@".6",@".7",@".8",@".9",];
    string1 = @"0";
    string2 = @"6";
    string3 = @".5";
    
    [self.pickerView selectRow:0 inComponent:0 animated:NO];
    [self.pickerView selectRow:4 inComponent:1 animated:NO];
    [self.pickerView selectRow:5 inComponent:2 animated:NO];
}

- (NSString *)getString
{
    return _glucose;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0){
        //NSLog(@"array1 : %lu", (unsigned long)[array1 count]);
        return [array1 count];
    }
    else if(component == 1){
        //NSLog(@"array2 : %lu", (unsigned long)[array2 count]);
        return [array2 count];
    }
    else{
        return [array3 count];
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
    }
    else if(component == 1){
        valueString = [array2 objectAtIndex:row];
    }
    else{
        valueString = [array3 objectAtIndex:row];
    }
    return  valueString;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0){
        string1 = [array1 objectAtIndex:row];
        //NSLog(@"array1S : %@", string1);
    }else if(component == 1){
        string2 = [array2 objectAtIndex:row];
        //NSLog(@"array2S : %@", string2);
    }
    else{
        string3 = [array3 objectAtIndex:row];
    }
    NSString *string0;
    string0 = [string1 stringByAppendingString:string2];
    _glucose = [string0 stringByAppendingString:string3];
    
    //NSLog(@"_height: %@", a);
}

@end
