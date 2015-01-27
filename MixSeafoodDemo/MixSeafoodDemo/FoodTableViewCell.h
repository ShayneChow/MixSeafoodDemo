//
//  FoodTableViewCell.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/27.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SeaFood;

@interface FoodTableViewCell : UITableViewCell

#pragma mark 菜单对象
@property (nonatomic,strong) SeaFood *food;

#pragma mark 单元格高度
@property (assign,nonatomic) CGFloat height;

@end
