//
//  MenuDetailViewController.h
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/30.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocialControllerService.h"

@interface MenuDetailViewController : UIViewController<UIActionSheetDelegate, UMSocialUIDelegate>

@property (nonatomic, retain) NSURL *detailURL;
@property (nonatomic, copy) NSString *detailImage;  // 分享菜单主图
@property (nonatomic, copy) NSString *detailDesc;  // 分享菜单标题
@property (nonatomic, retain) UIWebView *detailWebView;

@end
