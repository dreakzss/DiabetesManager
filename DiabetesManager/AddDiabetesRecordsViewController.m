//
//  AddDiabetesRecordsViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/4/28.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "AddDiabetesRecordsViewController.h"
#import "GlobalFunc.h"
#import "DairyFunc.h"

@interface AddDiabetesRecordsViewController ()

@property UITextField *textField;
@property UITextField *sbpTextField;

@end

@implementation AddDiabetesRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, WIDTH+120, HEIGHT);
    self.view.backgroundColor = [GlobalFunc colorFromHexRGB:@"EAEAEA"];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH+120, NAVIBARHEIGHT)];
    topBarView.backgroundColor = [GlobalFunc colorFromHexRGB:@"66CC99"];
    
    UILabel *topBarTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.5, 30, 140, 40)];
    topBarTitleLabel.backgroundColor = [UIColor clearColor];
    topBarTitleLabel.opaque = NO;
    topBarTitleLabel.textColor = [UIColor whiteColor];
    topBarTitleLabel.font = [UIFont systemFontOfSize:27];
    topBarTitleLabel.textAlignment = NSTextAlignmentCenter;
    topBarTitleLabel.text = @"记录血糖";
    
    UIButton *returnButton;
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);
    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    //自定义键盘控件，添加单位和done按钮
    UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 2, 290, 25)];
    unitLabel.font = [UIFont systemFontOfSize:17];
    unitLabel.backgroundColor = [UIColor clearColor];
    unitLabel.textAlignment = NSTextAlignmentLeft;
    unitLabel.textColor = [UIColor blackColor];
    unitLabel.text  = @"单位：mmol/L";
    UIBarButtonItem *myButtonItem = [[UIBarButtonItem alloc]initWithCustomView:unitLabel];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                       target:self.view action:@selector(endEditing:)];
    keyboardToolbar.items = @[myButtonItem, doneBarButton];
    
    
    // *****************************************************************
    // Data Area
    UIView *dateFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 115, WIDTH-50, 50)];
    dateFieldView.backgroundColor = [UIColor whiteColor];
    dateFieldView.layer.cornerRadius = 10.0;
    //dateFieldView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:dateFieldView];
    
    UILabel *dateTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 90, 40)];
    dateTextLabel.textColor = [UIColor blackColor];
    dateTextLabel.font = [UIFont systemFontOfSize:17];
    dateTextLabel.textAlignment = NSTextAlignmentCenter;
    dateTextLabel.text = @"记录日期";
    [self.view addSubview:dateTextLabel];
    
    UIButton *dateChangedButton;
    dateChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dateChangedButton addTarget:self action:@selector(diabetesTimeChangeButtonPressed) forControlEvents:UIControlEventTouchDown];
    dateChangedButton.frame = CGRectMake(140, 121, 196, 40);
    [self.view addSubview:dateChangedButton];
    
    //*******************************************************************
    UIView *mealTypeFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 185, WIDTH-50, 50)];
    mealTypeFieldView.backgroundColor = [UIColor whiteColor];
    mealTypeFieldView.layer.cornerRadius = 10.0;
    //mealTypeFieldView.layer.masksToBounds = NO; //防止子元素溢出
    
    [self.view addSubview:mealTypeFieldView];
    
    UILabel *mealTypeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, 190,90, 40)];
    mealTypeTextLabel.textColor = [UIColor blackColor];
    mealTypeTextLabel.font = [UIFont systemFontOfSize:17];
    mealTypeTextLabel.textAlignment = NSTextAlignmentCenter;
    mealTypeTextLabel.text = @"用餐时间";
    [self.view addSubview:mealTypeTextLabel];
    
    UIButton *mealTypeChangedButton;
    mealTypeChangedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [mealTypeChangedButton addTarget:self action:@selector(mealTypeChangeButtonPressed) forControlEvents:UIControlEventTouchDown];
    mealTypeChangedButton.frame = CGRectMake(140, 190, 196, 40);
    [self.view addSubview:mealTypeChangedButton];
    
    //*******************************************************************
    //space:70
    UIView *beforeFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 255, WIDTH-50, 50)];
    beforeFieldView.backgroundColor = [UIColor whiteColor];
    beforeFieldView.layer.cornerRadius = 10.0;
    beforeFieldView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:beforeFieldView];
    
    UILabel *beforeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, 260,90, 40)];
    beforeTextLabel.textColor = [UIColor blackColor];
    beforeTextLabel.font = [UIFont systemFontOfSize:17];
    beforeTextLabel.textAlignment = NSTextAlignmentCenter;
    beforeTextLabel.text = @"饭前血糖";
    [self.view addSubview:beforeTextLabel];
    
    _beforeTextField=[[UITextField alloc]initWithFrame:CGRectMake(140, 261, 196, 40)];
    _beforeTextField.backgroundColor = [UIColor whiteColor];
    _beforeTextField.placeholder = @"请输入饭前血糖值";
    _beforeTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _beforeTextField.textAlignment = NSTextAlignmentCenter;
    _beforeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _beforeTextField.inputAccessoryView = keyboardToolbar;
    [self.view addSubview:_beforeTextField];
    
    UIView *afterFieldView = [[UIView alloc]initWithFrame:CGRectMake(25, 325, WIDTH-50, 50)];
    afterFieldView.backgroundColor = [UIColor whiteColor];
    afterFieldView.layer.cornerRadius = 10.0;
    afterFieldView.layer.masksToBounds = NO; //防止子元素溢出
    [self.view addSubview:afterFieldView];
    
    UILabel *afterTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, 330, 90, 40)];
    afterTextLabel.textColor = [UIColor blackColor];
    afterTextLabel.font = [UIFont systemFontOfSize:17];
    afterTextLabel.textAlignment = NSTextAlignmentCenter;
    afterTextLabel.text = @"饭后血糖";
    [self.view addSubview:afterTextLabel];
    
    _afterTextField = [[UITextField alloc]initWithFrame:CGRectMake(140, 331, 196, 40)];
    _afterTextField.backgroundColor = [UIColor whiteColor];
    _afterTextField.placeholder = @"请输入饭后血糖值";
    _afterTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _afterTextField.textAlignment = NSTextAlignmentCenter;
    _afterTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _afterTextField.inputAccessoryView = keyboardToolbar;
    [self.view addSubview:_afterTextField];
    
    UIButton *saveButton;
    saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchDown];
    saveButton.frame = CGRectMake(25, 415, WIDTH-50, 40);
    [saveButton.layer setMasksToBounds:YES];
    [saveButton.layer setCornerRadius:10.0];
    //[saveButton.layer setBorderWidth:1.0];
    CGColorRef colorref4 = [GlobalFunc colorFromHexRGB:@"66CC99"].CGColor;
    [saveButton.layer setBackgroundColor:colorref4];//边框颜色
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    
    [self.view addSubview:saveButton];
    
    [DairyFunc initAddDiabetesLabels:self.view];
    
}


#pragma mark - ButtonPressed

-(void)saveButtonPressed{
    
    UIViewController *rootViewController;
    UIAlertController *alertController;
    UIAlertAction *okAction;
    Boolean isConact;
    
    rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    //验证是否全填完信息
    isConact = [DairyFunc verifyAddDiabetesDataContact:_beforeTextField.text withAfter:_afterTextField.text];
    if (isConact == NO) {
        alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"尚有信息未填写" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [rootViewController presentViewController:alertController animated:YES completion:nil];
    } else {
        alertController = [UIAlertController alertControllerWithTitle:@"血糖记录" message:@"保存成功" preferredStyle:UIAlertControllerStyleAlert];
        okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            //通知
            //NSLog(@"waistline1: %@",_waistlineTextField.text);
            [DairyFunc saveNewDiabetesDairyCellArray:_beforeTextField.text withAfter:_afterTextField.text];
            //NSLog(@"_heightTextField%@",_heightTextField.text);
            [GlobalFunc moveBackFromAddView:self.view moveBackToView:self.view.superview];
            
        }];
        [alertController addAction:okAction];
        //用root不用self是防止warning: detach..
        [rootViewController presentViewController:alertController animated:YES completion:nil];
        
    }
}


-(void)diabetesTimeChangeButtonPressed{
    
    [DairyFunc diabetesTimeChangeButtonPressed:self];
}

-(void)mealTypeChangeButtonPressed
{
    [DairyFunc mealTypeChangeButtonPressed:self];
}


-(void)returnButtonPressed{
    
    [self.view endEditing:YES];
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
