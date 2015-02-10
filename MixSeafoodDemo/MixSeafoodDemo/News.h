//
//  News.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/2/6.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

#pragma mark - 模型属性
@property (nonatomic, copy) NSString *newsImage;  // 资讯主图
@property (nonatomic, copy) NSString *newsTitle;  // 资讯标题
@property (nonatomic, copy) NSString *newsDesc;   // 资讯介绍
@property (nonatomic, copy) NSString *newsDate;   // 资讯日期
@property (nonatomic, copy) NSString *newslURL;   // 资讯消息介绍页面web链接

@end
