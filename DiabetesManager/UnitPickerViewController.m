//
//  UnitPickerViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/6/3.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "UnitPickerViewController.h"

@interface UnitPickerViewController ()

@end

@implementation UnitPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, HEIGHT - NAVIBARHEIGHT - 194, WIDTH, 195);
    self.view.backgroundColor = [UIColor clearColor];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 180)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
    //[self.pickerView reloadAllComponents];
    
    array = @[@"片",@"粒",@"针"];
    //设置临时初始值
    _unit = @"粒";
    
    //存储temp数据
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.tempUnitString = _unit;
    
    [self.pickerView selectRow:1 inComponent:0 animated:NO];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [array count];
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
    return  [array objectAtIndex:row];;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _unit = [array objectAtIndex:row];
    
    //数值发生更改后更改临时值
    ReminderModel *sharedManagerRM = [ReminderModel sharedManager];
    sharedManagerRM.tempUnitString = _unit;
    
    NSLog(@"dosageValueLabel: %@",sharedManagerRM.tempUnitString);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
