//
//  FoodInfoViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/28.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//  菜单详情页

#import "FoodInfoViewController.h"
#import "SeaFood.h"
#import "HotViewController.h"

@interface FoodInfoViewController ()

@end

@implementation FoodInfoViewController
#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"详情";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
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
