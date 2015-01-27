//
//  HomeViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/26.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"edit"] style:UIBarButtonItemStylePlain target:self action:@selector(checkInToday)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pinpoint"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationTo)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationTo{
    NSLog(@"navigationTo()方法，打开导航页面");
}

- (void)checkInToday{
    CGFloat screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    NSLog(@"checkInToday()方法，签到页面,并打印screenWidth：%f", screenWidth);
}

@end
