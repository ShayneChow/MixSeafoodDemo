//
//  FoodInfoViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/28.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//  菜单详情页

#import "FoodInfoViewController.h"
#import "SeaFood.h"
#import "HotViewController.h"

#define foodImageWidth [UIScreen mainScreen].applicationFrame.size.width // 主图宽度
#define foodImageHeight (foodImageWidth / 1.8)                 // 主图高度
#define coverViewHeight 36.0
#define coverViewWidth foodImageWidth
#define buttonHeight coverViewHeight
#define buttonWidth buttonHeight
#define foodTitleWidth (coverViewWidth - buttonWidth*2 - 10.0)    // title的宽度 = cover的宽度 - 2个button的宽度
#define foodTitleHeight coverViewHeight

@interface FoodInfoViewController (){
    UIImageView *_foodDetailImage;    // 主图
    UILabel     *_foodDetailTitle;    // 标题
    UILabel     *_foodDetailPrice;    // 价格
    UIButton    *_likeDetailBtn;      // 收藏按钮
    UIButton    *_shareDetailBtn;     // 分享按钮
    UIWebView   *_foodDetailInfo;     // 详情介绍
}

@end

@implementation FoodInfoViewController
#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"详情介绍";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubView];
    [self setFood];
}

#pragma mark 初始化视图
-(void)initSubView{
    // 初始化主图控件
    _foodDetailImage = [[UIImageView alloc] init];
    [self.view addSubview:_foodDetailImage];
    
    // 初始化菜单标题
    _foodDetailTitle = [[UILabel alloc] init];
    _foodDetailTitle.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_foodDetailTitle];
    
    // 初始化价格
    _foodDetailPrice = [[UILabel alloc] init];
    _foodDetailPrice.textColor = [UIColor redColor];
    _foodDetailPrice.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_foodDetailPrice];
    
    // 初始化收藏按钮
    _likeDetailBtn = [[UIButton alloc] init];
    [self.view addSubview:_likeDetailBtn];
    
    // 初始化分享按钮
    _shareDetailBtn = [[UIButton alloc] init];
    [self.view addSubview:_shareDetailBtn];
    
    // 初始化详情介绍
    _foodDetailInfo = [[UIWebView alloc] init];
    [self.view addSubview:_foodDetailInfo];
    
    NSLog(@"初始化详情页视图");
}

#pragma mark 设置菜单大小位置
- (void)setFood{
    // 设置主图frame
    CGFloat foodImageX = 0, foodImageY = 44 + 20;
    CGRect foodImageRect = CGRectMake(foodImageX, foodImageY, foodImageWidth, foodImageHeight);
    _foodDetailImage.image = [UIImage imageNamed:@"mixseafood"];
    _foodDetailImage.frame = foodImageRect;
    
    // 设置菜单标题frame
    CGFloat foodTitleX = 10.0, foodTitleY = foodImageHeight - coverViewHeight;
    CGRect foodTitleRect = CGRectMake(foodTitleX, foodTitleY, foodTitleWidth, foodTitleHeight);
    _foodDetailTitle.text = @"测试数据";
    _foodDetailTitle.frame = foodTitleRect;
    
    // 设置价格frame
    
    // 设置按钮的frame
    CGFloat likeBtnX = foodTitleWidth + 10.0, likeBtnY = foodTitleY;
    CGRect likeBtnRect = CGRectMake(likeBtnX, likeBtnY, buttonWidth, buttonHeight);
    [_likeDetailBtn setBackgroundImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    [_likeDetailBtn addTarget:self action:@selector(likeBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    _likeDetailBtn.frame = likeBtnRect;
    
    CGFloat shareBtnX = buttonWidth + likeBtnX, shareBtnY = foodTitleY;
    CGRect shareBtnRect = CGRectMake(shareBtnX, shareBtnY, buttonWidth, buttonHeight);
    [_shareDetailBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [_shareDetailBtn addTarget:self action:@selector(shareBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    _shareDetailBtn.frame = shareBtnRect;
    
    // 设置介绍frame
    
    NSLog(@"设置详情页视图frame");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 收藏和分享按钮实现
- (void)likeBtnPressed{
    NSLog(@"收藏这个美食");
    // 1.创建弹框
    UIAlertView *alertLike = [[UIAlertView alloc] initWithTitle:@"收藏" message:@"敬请期待……" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 2.显示弹框
    [alertLike show];
}

- (void)shareBtnPressed{
    NSLog(@"分享这个美食到微博/朋友圈");
    // 1.创建弹框
    UIAlertView *alertShare = [[UIAlertView alloc] initWithTitle:@"分享到微博/朋友圈" message:@"敬请期待……" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 2.显示弹框
    [alertShare show];
}



@end
