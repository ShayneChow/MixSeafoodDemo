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
@property (nonatomic, retain) UIWebView *detailWebView;

@end
