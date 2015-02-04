//
//  MenuDetailViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/30.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "MenuDetailViewController.h"

#define webViewWidth [UIScreen mainScreen].bounds.size.width // 获取屏幕宽度
#define webViewHeight [UIScreen mainScreen].bounds.size.height// 定义WebView的高度

@interface MenuDetailViewController ()

@end

@implementation MenuDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share"] style:UIBarButtonItemStylePlain target:self action:@selector(shareBtnPressed)];
    
    [self initSubView];
    [self setSubView];
    [_detailWebView loadRequest:[NSURLRequest requestWithURL:_detailURL]];
}

#pragma mark 初始化视图
- (void)initSubView{
    // 初始化UIWebView
    _detailWebView = [[UIWebView alloc] init];
    [self.view addSubview:_detailWebView];
}

#pragma mark 设置视图frame
- (void)setSubView{
    // 设置UIWebView的frame
    CGFloat webViewX = 0, webViewY = 0;
    CGRect webViewRect = CGRectMake(webViewX, webViewY, webViewWidth, webViewHeight);
    _detailWebView.frame = webViewRect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)shareBtnPressed{
    NSLog(@"分享这个美食到微博/朋友圈");
    // 1.创建弹框
    UIAlertView *alertShare = [[UIAlertView alloc] initWithTitle:@"分享到微博/朋友圈" message:@"敬请期待……" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 2.显示弹框
    [alertShare show];
}

@end
