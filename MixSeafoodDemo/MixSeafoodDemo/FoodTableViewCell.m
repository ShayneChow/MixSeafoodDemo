//
//  FoodTableViewCell.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/27.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "FoodTableViewCell.h"
#import "SeaFood.h"

#define foodImageWidth [UIScreen mainScreen].applicationFrame.size.width // 主图宽度
#define foodImageHeight (foodImageWidth / 1.8)                 // 主图高度
#define coverViewHeight 36.0
#define coverViewWidth foodImageWidth
#define buttonHeight coverViewHeight
#define buttonWidth buttonHeight
#define foodTitleWidth (coverViewWidth - buttonWidth*2 - 10.0)    // title的宽度 = cover的宽度 - 2个button的宽度
#define foodTitleHeight coverViewHeight


@interface FoodTableViewCell(){
    UIImageView *_foodImage;    // 主图
    UIView      *_coverView;    // 半透明层
    UILabel     *_foodTitle;    // 标题
    UIButton    *_likeBtn;      // 收藏按钮
    UIButton    *_shareBtn;     // 分享按钮
}

@end

@implementation FoodTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

/*
 *
 *一般实现自定义UITableViewCell需要分为两步：
 *    第一、初始化控件；
 *    第二、设置数据，重新设置控件frame。
 *
 *原因就是自定义Cell一般无法固定高度，很多时候高度需要随着内容改变。
 *此外由于在单元格内部是无法控制单元格高度的，因此一般会定义一个高度属性用于在UITableView的代理事件中设置每个单元格高度。
 *
 */

#pragma mark 初始化视图
-(void)initSubView{
    // 初始化主图控件
    _foodImage = [[UIImageView alloc] init];
    [self addSubview:_foodImage];
    
    // 初始化半透明层
    _coverView = [[UIView alloc] init];
    _coverView.backgroundColor = [UIColor blackColor];
    _coverView.alpha = 0.7;
    [self addSubview:_coverView];
    
    // 初始化菜单标题
    _foodTitle = [[UILabel alloc] init];
    _foodTitle.textColor = [UIColor whiteColor];
    _foodTitle.font = [UIFont systemFontOfSize:18];
    [self addSubview:_foodTitle];
    
    // 初始化收藏按钮
    _likeBtn = [[UIButton alloc] init];
    [self addSubview:_likeBtn];
    
    // 初始化分享按钮
    _shareBtn = [[UIButton alloc] init];
    [self addSubview:_shareBtn];
    
}

#pragma mark 设置菜单大小位置
- (void)setFood:(SeaFood *)food{
    // 设置主图frame
    CGFloat foodImageX = 0, foodImageY = 0;
    CGRect foodImageRect = CGRectMake(foodImageX, foodImageY, foodImageWidth, foodImageHeight);
    _foodImage.image = [UIImage imageNamed:food.foodImage];
    _foodImage.frame = foodImageRect;
    
    // 设置透明层frame
    CGFloat coverViewX = 0, coverViewY = foodImageHeight - coverViewHeight;
    CGRect coverViewRect = CGRectMake(coverViewX, coverViewY, coverViewWidth, coverViewHeight);
    _coverView.frame = coverViewRect;
    
    // 设置菜单标题frame
    CGFloat foodTitleX = 10.0, foodTitleY = coverViewY;
    CGRect foodTitleRect = CGRectMake(foodTitleX, foodTitleY, foodTitleWidth, foodTitleHeight);
    _foodTitle.text = food.foodTitle;
    _foodTitle.frame = foodTitleRect;
    
    // 设置按钮的frame
    CGFloat likeBtnX = foodTitleWidth + 10.0, likeBtnY = coverViewY;
    CGRect likeBtnRect = CGRectMake(likeBtnX, likeBtnY, buttonWidth, buttonHeight);
    [_likeBtn setBackgroundImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    [_likeBtn addTarget:self action:@selector(likeBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    _likeBtn.frame = likeBtnRect;
    
    CGFloat shareBtnX = buttonWidth + likeBtnX, shareBtnY = coverViewY;
    CGRect shareBtnRect = CGRectMake(shareBtnX, shareBtnY, buttonWidth, buttonHeight);
    [_shareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [_shareBtn addTarget:self action:@selector(shareBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    _shareBtn.frame = shareBtnRect;
}

#pragma mark 收藏和分享按钮实现
- (void)likeBtnPressed{
    NSLog(@"收藏这个美食");
}

- (void)shareBtnPressed{
    NSLog(@"分享这个美食到微博/朋友圈");
}

#pragma mark 重写选择事件，取消选中
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}

@end
