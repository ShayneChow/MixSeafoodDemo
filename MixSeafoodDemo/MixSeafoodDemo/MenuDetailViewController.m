//
//  MenuDetailViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/30.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "MenuDetailViewController.h"
#import "AppDelegate.h"
#import "UMSocial.h"

#define webViewWidth [UIScreen mainScreen].bounds.size.width // 获取屏幕宽度
#define webViewHeight [UIScreen mainScreen].bounds.size.height// 定义WebView的高度

#define kTagShareEdit 101
#define kTagSharePost 102

@interface MenuDetailViewController ()<UMSocialUIDelegate>

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

-(void)didCloseUIViewController:(UMSViewControllerType)fromViewControllerType
{
    NSLog(@"didClose is %d",fromViewControllerType);
}

- (void)shareBtnPressed{
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    NSString *shareText = @"来自MixSeafood测试项目的分享，powered by 友盟，@ShayneChow http://shaynechow.github.io/"; //分享内嵌文字
    UIImage *shareImage = [UIImage imageNamed:@"icon"];  // 分享内嵌图片
    NSString *urlString = [_detailURL absoluteString];   // 分享URL
    
    //调用快速分享接口
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UmengAppkey
                                      shareText:shareText
                                     shareImage:shareImage
                                shareToSnsNames:@[UMShareToSina, UMShareToWechatSession, UMShareToWechatTimeline, UMShareToWechatFavorite, UMShareToQQ, UMShareToQzone]
                                       delegate:self];
    [UMSocialSnsService handleOpenURL:_detailURL];
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = urlString;
}

//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

/*
 在自定义分享样式中，根据点击不同的点击来处理不同的的动作
 

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex + 1 >= actionSheet.numberOfButtons ) {
        return;
    }
    NSLog(@"click button index is %d",buttonIndex);
    //分享编辑页面的接口,snsName可以换成你想要的任意平台，例如UMShareToSina,UMShareToWechatTimeline
    NSString *snsName = [[UMSocialSnsPlatformManager sharedInstance].allSnsValuesArray objectAtIndex:buttonIndex];
    NSString *shareText = @"友盟社会化组件可以让移动应用快速具备社会化分享、登录、评论、喜欢等功能，并提供实时、全面的社会化数据统计分析服务。 http://www.umeng.com/social";
    UIImage *shareImage = [UIImage imageNamed:@"UMS_social_demo"];
    
    if (actionSheet.tag == kTagShareEdit) {
        //设置分享内容，和回调对象
        [[UMSocialControllerService defaultControllerService] setShareText:shareText shareImage:shareImage socialUIDelegate:self];
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:snsName];
        snsPlatform.snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
    } else if (actionSheet.tag == kTagSharePost){
        [[UMSocialDataService defaultDataService] postSNSWithTypes:@[snsName] content:shareText image:shareImage location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity * response){
            if (response.responseCode == UMSResponseCodeSuccess) {
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"成功" message:@"分享成功" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alertView show];
            } else if(response.responseCode != UMSResponseCodeCancel) {
                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"失败" message:@"分享失败" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alertView show];
            }
        }];
    }
}
  */

@end
