//
//  FoodInfoViewController.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/28.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SeaFood;

@interface FoodInfoViewController : UIViewController

#pragma mark 菜单对象
@property (nonatomic,strong) SeaFood *food;

@end
