//
//  SeaFood.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/27.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//  创建菜单模型

#import <Foundation/Foundation.h>

@interface SeaFood : NSObject

#pragma mark - 模型属性
@property (nonatomic, strong) NSString *foodImage;  // 菜单主图
@property (nonatomic, strong) NSNumber *foodPrice;  // 菜单价格
@property (nonatomic, strong) NSString *foodTitle;  // 菜单标题
@property (nonatomic, strong) NSString *foodInfo;   // 菜单介绍

@end
