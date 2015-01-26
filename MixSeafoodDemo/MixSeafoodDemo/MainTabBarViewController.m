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

@interface MainTabBarViewController ()

- (void)loadViewControllers;    //定义私有方法装载子视图控制器

@end

@implementation MainTabBarViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.tabBar.hidden = YES;   //隐藏系统自带tabBarView
//        [[UITableView appearance] setTintColor:[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
