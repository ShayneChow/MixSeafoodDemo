//
//  MainTabBarViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/26.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "HomeViewController.h"
#import "MenuViewController.h"
#import "HotViewController.h"
#import "ProfileViewController.h"

@interface MainTabBarViewController (){
    NSArray *aryImage;    //未选中时的图片
    NSArray *arySelImage; //选中时的图片
    NSArray *aryTitle;    //所有标题
    int num;   //按钮的数量
}

@property (nonatomic,strong) UIButton *selectedBtn;

- (void)loadCustomTabBar;   // 自定义TabBar

- (void)loadViewControllers;    //定义私有方法装载子视图控制器

@end

@implementation MainTabBarViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.tabBar.hidden = YES;   //隐藏系统自带tabBarView
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadCustomTabBar];
    [self loadViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCustomTabBar{
    //添加数据
    num = 4;
    aryImage = [[NSArray alloc] initWithObjects:@"home",@"tags",@"light",@"profile", nil];
    arySelImage = [[NSArray alloc] initWithObjects:@"home",@"tags",@"light",@"profile",nil];
    aryTitle = [[NSArray alloc] initWithObjects:@"首 页",@"菜 单",@"热 卖",@"我 的",nil];
    
    //删除现有的tabBar
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    
    //测试添加自己的视图
    UIImageView *myView = [[UIImageView alloc] init];
    myView.userInteractionEnabled = YES;
    myView.frame = rect;
    myView.image = [UIImage imageNamed:@"TabBar-BG"];
    [self.view addSubview:myView];
    
    for (int i = 0; i < num; i++) {
        
        //添加按钮
        UIButton *btn = [[UIButton alloc] init];
        CGFloat x = i * myView.frame.size.width / num;
        btn.frame = CGRectMake(x, 0, myView.frame.size.width / num, myView.frame.size.height);
        [myView addSubview:btn];
        
        //添加图标
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((btn.bounds.size.width-30)/2, 3, 30, 30)];
        imageView.tag = 200+i;
        imageView.image = [UIImage imageNamed:aryImage[i]];
        [btn addSubview:imageView];
        
        //标题
        UILabel *labTitle = [[UILabel alloc] init];
        labTitle.tag = 100+i;
        labTitle.frame = CGRectMake(0, 33, btn.bounds.size.width, 12);
        labTitle.textColor = [UIColor brownColor];
        labTitle.backgroundColor = [UIColor clearColor];
        labTitle.font = [UIFont systemFontOfSize:11];
        labTitle.textAlignment = NSTextAlignmentCenter;
        labTitle.text = aryTitle[i];
        [btn addSubview:labTitle];
        
        
        btn.tag = i;//设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
        //带参数的监听方法记得加"冒号"
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置刚进入时,第一个按钮为选中状态
        if (0 == i) {
            imageView.image = [UIImage imageNamed:arySelImage[i]];
            labTitle.textColor = [UIColor blueColor];
            btn.selected = YES;
            self.selectedBtn = btn;  //设置该按钮为选中的按钮
        }
    }
}

/* 自定义TabBar的按钮点击事件 */
- (void)clickBtn:(UIButton *)button {
    
    //设置所有按钮的状态
    for (int i=0; i<num; i++) {
        UILabel *labTitle = (UILabel *)[self.view viewWithTag:100+i];
        UIImageView *imgView = (UIImageView *)[self.view viewWithTag:200+i];
        if(i == button.tag){
            imgView.image = [UIImage imageNamed:arySelImage[i]];
            labTitle.textColor = [UIColor blueColor];
        }else{
            imgView.image = [UIImage imageNamed:aryImage[i]];
            labTitle.textColor = [UIColor brownColor];
        }
    }
    
    //1.先将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    button.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = button;
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    self.selectedIndex = button.tag;
}

#pragma mark - Private Method
- (void)loadViewControllers{
    // 首页
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    BaseNavigationViewController *homeNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:homeViewController];
    
    // 菜单
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    BaseNavigationViewController *menuNavigaton = [[BaseNavigationViewController alloc] initWithRootViewController:menuViewController];
    
    // 热卖
    HotViewController *hotViewController = [[HotViewController alloc] init];
    BaseNavigationViewController *hotNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:hotViewController];
    
    // 个人中心
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    BaseNavigationViewController *profileNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:profileViewController];
    
    //创建数组，将以上视图的导航控制器添加到导航栏中
    NSArray *viewControllers = @[homeNavigation, menuNavigaton, hotNavigation, profileNavigation];
    [self setViewControllers:viewControllers animated:YES];
}//定义私有方法装载子视图控制器

@end
