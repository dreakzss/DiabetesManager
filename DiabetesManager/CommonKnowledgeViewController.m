//
//  commonKnowledgeViewController.m
//  DiabetesManager
//
//  Created by wangHaoran on 16/5/31.
//  Copyright © 2016年 Haoran. All rights reserved.
//

#import "commonKnowledgeViewController.h"
#import "GlobalDef.h"
#import "GlobalFunc.h"

@interface CommonKnowledgeViewController ()

@end

@implementation CommonKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *returnButton;
    
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
    topBarTitleLabel.text = @"常用知识";
    
    returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.adjustsImageWhenHighlighted = NO;
    [returnButton setImage:[UIImage imageNamed:@"IconBack.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(returnButtonPressed) forControlEvents:UIControlEventTouchDown];
    returnButton.frame = CGRectMake(15, 33, 35, 35);

    
    [self.view addSubview:topBarView];
    [self.view addSubview:topBarTitleLabel];
    [self.view addSubview:returnButton];
    
    //***********************************************************
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVIBARHEIGHT, WIDTH, 667)];
    scrollView.pagingEnabled = NO; //是否翻页
    scrollView.scrollsToTop = YES;
    scrollView.bounces = YES;
    scrollView.showsVerticalScrollIndicator = YES; //垂直方向的滚动指示
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;//滚动指示的风格
    scrollView.showsHorizontalScrollIndicator = NO;//水平方向的滚动指示
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(375, 1000);
    [self.view addSubview:scrollView];
    
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 75 - NAVIBARHEIGHT, WIDTH, 50)];
    titleLable.text = @"糖尿病患者饮食注意事项";
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:24];
    [scrollView addSubview:titleLable];
    
    UILabel *timeLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 115 - NAVIBARHEIGHT, WIDTH, 30)];
    timeLable.text = @"2016-5-3";
    timeLable.textAlignment = NSTextAlignmentCenter;
    timeLable.font = [UIFont systemFontOfSize:16];
    timeLable.textColor = [UIColor grayColor];
    [scrollView addSubview:timeLable];
    
    UIView *separator = [[UIView alloc] initWithFrame: CGRectMake(15, 145 - NAVIBARHEIGHT, WIDTH - 30, 1)];
    separator.backgroundColor = [UIColor grayColor];
    [scrollView addSubview: separator];
    
    UIImage *backImage = [UIImage imageNamed:@"CommonknowledgeBackGround.png"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = CGRectMake(25, 160- NAVIBARHEIGHT, WIDTH - 50, 190);
    [scrollView addSubview:backImageView];
    
    UILabel *contentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(25, 360 - NAVIBARHEIGHT, WIDTH - 50, 120)];
    contentLabel1.text = @"  1、 主食一般以米、面为主，但是，我们比较喜欢粗杂粮，如燕麦、麦片、玉米面等，因为这些食物中有较多的无机盐、维生素，又富含膳食纤维，膳食纤维具有减低血糖作用，对控制血糖有利。";
    contentLabel1.numberOfLines = 0;
    [scrollView addSubview:contentLabel1];
    
    UILabel *contentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(25, 470 - NAVIBARHEIGHT, WIDTH - 50, 120)];
    contentLabel2.text = @"  2、 血糖高患者的蛋白质来源，大豆及其豆制品为好，一方面，其所含蛋白质量多质好；另一方面，其不含胆固醇，具有降脂作用，故可代替部分动物性食品，如肉类等。";
    contentLabel2.numberOfLines = 0;
    [scrollView addSubview:contentLabel2];
    
    UILabel *contentLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(25, 580 - NAVIBARHEIGHT, WIDTH - 50, 120)];
    contentLabel3.text = @"  3、 在控制热量期间，仍感饥饿时，可食用含糖少的蔬菜，用水煮后加一些佐料拌着吃。由于蔬菜所含膳食纤维多、水分多，供热能低、具有饱腹作用，是糖尿病患者必不可少的食物。";
    contentLabel3.numberOfLines = 0;
    [scrollView addSubview:contentLabel3];
    
    UILabel *contentLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(25, 695 - NAVIBARHEIGHT, WIDTH - 50, 120)];
    contentLabel4.text = @"  4、 禁用食物有：白糖、红糖、葡萄糖及糖制甜食，如糖果、糕点、果酱、蜜饯、冰激凌、甜饮料等。另外，含碳水化合物较多的土豆、山药、芋艿、藕、蒜苗、胡萝卜等少用或食用后减少相应的主食量。";
    contentLabel4.numberOfLines = 0;
    [scrollView addSubview:contentLabel4];
    
    UILabel *contentLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(25, 815 - NAVIBARHEIGHT, WIDTH - 50, 120)];
    contentLabel5.text = @"  5、 富含饱和脂肪酸的猪油、牛油、洋油、奶油、黄油等少用，最好不用。可用植物油代替部分动物油，花生、核桃、芝麻、瓜子中含脂肪也相当多，尽量不吃或少吃或减少油类摄入。";
    contentLabel5.numberOfLines = 0;
    [scrollView addSubview:contentLabel5];
    
    
    
    
    
}

-(void)returnButtonPressed{
    
    [GlobalFunc moveBackFromView:self.view moveBackToView:self.view.superview];
    
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
