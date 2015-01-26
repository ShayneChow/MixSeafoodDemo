//
//  BaseNavigationViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/26.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置全局导航条风格和颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
