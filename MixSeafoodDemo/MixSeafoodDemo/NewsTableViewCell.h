//
//  NewsTableViewCell.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/2/6.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface NewsTableViewCell : UITableViewCell

#pragma mark 微博对象
@property (nonatomic,strong) News *news;

@end
