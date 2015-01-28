//
//  HotViewController.m
//  MixSeafoodDemo
//
//  Created by choushayne on 15/1/26.
//  Copyright (c) 2015年 ShayneChow. All rights reserved.
//

#import "HotViewController.h"
#import "SeaFood.h"
#import "FoodTableViewCell.h"
#import "FoodInfoViewController.h"

#define foodImageWidth [UIScreen mainScreen].applicationFrame.size.width // 主图宽度
#define foodImageHeight (foodImageWidth / 1.8)                 // 主图高度

@interface HotViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_food;
    NSMutableArray *_foodCells;//存储cell
}

@end

@implementation HotViewController

#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"热卖推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    //设置代理
    _tableView.delegate=self;
    NSLog(@"cell");
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"SeaFoodTest" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _food = [[NSMutableArray alloc]init];
    _foodCells = [[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_food addObject:[SeaFood seafoodWithDictionary:obj]];
        FoodTableViewCell *cell = [[FoodTableViewCell alloc] init];
        [_foodCells addObject:cell];
    }];
}

#pragma mark - 数据源方法
//#pragma mark 返回分组数
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _food.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellForRow --- %d", indexPath.row);
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    FoodTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell=[[FoodTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    SeaFood *food = _food[indexPath.row];
    cell.food = food;
    
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    FoodTableViewCell *cell = _foodCells[indexPath.row];
//    cell.food = _food[indexPath.row];
    return foodImageHeight;
}

//#pragma mark 重写状态样式方法
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark 选中cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 0.获取选中的cell对象
    SeaFood *food = _food[indexPath.row];
    NSLog(@"%@", food.foodTitle);
    
    FoodInfoViewController *foodInfoViewController = [[FoodInfoViewController alloc] init];
    [self.navigationController pushViewController:foodInfoViewController animated:YES];
    
//    // 1.创建弹框
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"产品信息展示" message:food.foodTitle delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    
//    // 2.显示弹框
//    [alert show];
}

@end
