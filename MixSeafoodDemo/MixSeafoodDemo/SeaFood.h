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
@property (nonatomic, copy) NSString *foodImage;  // 菜单主图
@property (nonatomic, assign) NSNumber *foodPrice;  // 菜单价格
@property (nonatomic, copy) NSString *foodTitle;  // 菜单标题
@property (nonatomic, copy) NSString *foodInfo;   // 菜单介绍

#pragma mark - 静态方法（类方法）初始化菜单对象
- (id)initWithDictionary:(NSDictionary *)dic;

#pragma mark - 静态方法（类方法）初始化菜单对象
+ (id)seafoodWithDictionary:(NSDictionary *)dic;

@end
