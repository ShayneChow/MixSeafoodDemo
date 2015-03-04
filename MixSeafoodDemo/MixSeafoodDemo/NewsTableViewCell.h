//
//  NewsTableViewCell.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/2/6.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kRowHeight 100.0
#define kScreenWidth [UIScreen mainScreen].applicationFrame.size.width

@class News;

@interface NewsTableViewCell : UITableViewCell

#pragma mark 新闻对象
@property (nonatomic,strong) News *news;

@end
