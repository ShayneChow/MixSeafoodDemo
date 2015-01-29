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
    UIImageView *_foodImage;    // 主图
    UILabel     *_foodTitle;    // 标题
    UILabel     *_foodPrice;    // 价格
    UIButton    *_likeBtn;      // 收藏按钮
    UIButton    *_shareBtn;     // 分享按钮
    UITextField *_foodInfo;     // 详情介绍
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
    _foodImage = [[UIImageView alloc] init];
    [self.view addSubview:_foodImage];
    
    // 初始化菜单标题
    _foodTitle = [[UILabel alloc] init];
    _foodTitle.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_foodTitle];
    
    // 初始化价格
    _foodPrice = [[UILabel alloc] init];
    _foodPrice.textColor = [UIColor redColor];
    _foodPrice.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_foodPrice];
    
    // 初始化收藏按钮
    _likeBtn = [[UIButton alloc] init];
    [self.view addSubview:_likeBtn];
    
    // 初始化分享按钮
    _shareBtn = [[UIButton alloc] init];
    [self.view addSubview:_shareBtn];
    
    // 初始化详情介绍
    _foodInfo = [[UITextField alloc] init];
    _foodInfo.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_foodInfo];
    
    NSLog(@"初始化详情页视图");
}

#pragma mark 设置菜单大小位置
- (void)setFood{
    // 设置主图frame
    CGFloat foodImageX = 0, foodImageY = 44 + 20;
    CGRect foodImageRect = CGRectMake(foodImageX, foodImageY, foodImageWidth, foodImageHeight);
    _foodImage.image = [UIImage imageNamed:@"mixseafood"];
    _foodImage.frame = foodImageRect;
    
    // 设置菜单标题frame
    CGFloat foodTitleX = 10.0, foodTitleY = foodImageHeight - coverViewHeight;
    CGRect foodTitleRect = CGRectMake(foodTitleX, foodTitleY, foodTitleWidth, foodTitleHeight);
    _foodTitle.text = @"测试数据";
    _foodTitle.frame = foodTitleRect;
    
    // 设置价格frame
    
    // 设置按钮的frame
    CGFloat likeBtnX = foodTitleWidth + 10.0, likeBtnY = foodTitleY;
    CGRect likeBtnRect = CGRectMake(likeBtnX, likeBtnY, buttonWidth, buttonHeight);
    [_likeBtn setBackgroundImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    [_likeBtn addTarget:self action:@selector(likeBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    _likeBtn.frame = likeBtnRect;
    
    CGFloat shareBtnX = buttonWidth + likeBtnX, shareBtnY = foodTitleY;
    CGRect shareBtnRect = CGRectMake(shareBtnX, shareBtnY, buttonWidth, buttonHeight);
    [_shareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [_shareBtn addTarget:self action:@selector(shareBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    _shareBtn.frame = shareBtnRect;
    
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
