//
//  PagerViewController.m
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "FancyViewController.h"
#import "UIImage+ImageEffects.h"

#define SectionHeaderHeight 40.0

@interface FancyViewController ()

@end

@implementation FancyViewController
#pragma mark - ViewController-life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"edit"] style:UIBarButtonItemStylePlain target:self action:@selector(checkInToday)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pinpoint"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationTo)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.topParallaxScrollView addSubview:self.scrollContentView];
    self.topParallaxScrollView.contentSize = self.scrollContentView.frame.size;
    
    self.bluredImageView.image = [self captureScrollContentViewImageWithBlur];
    
}

- (void)navigationTo{
    NSLog(@"navigationTo()方法，打开导航页面");
}

- (void)checkInToday{
    NSLog(@"checkInToday()方法，签到页面");
}


- (UIImage *)captureScrollContentViewImageWithBlur {
    
    CGFloat previousAlpha = self.parallaxView.alpha;
    self.parallaxView.alpha = 1.f;
    
    CGRect rect = [self.parallaxContainerView bounds];
    if (rect.size.height <= 1) {
        return nil;
    }
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.parallaxContainerView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.parallaxView.alpha = previousAlpha;
    
    return [img applyBlurWithRadius:20 tintColor:nil saturationDeltaFactor:2.f maskImage:nil];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Overwrite
////////////////////////////////////////////////////////////////////////


- (void)parallaxViewContainerHeightWillChange:(CGFloat)newHeight fromOldHeight:(CGFloat)height {
    
    self.topParallaxScrollView.contentSize = CGSizeMake(self.scrollContentView.frame.size.width, newHeight);
    
    CGRect frame = self.scrollContentView.frame;
    frame.size.height = newHeight;
    self.scrollContentView.frame = frame;
    
    CGFloat r = MIN(MAX(0.f, (newHeight / 250.f) * (newHeight / 250.f) * (newHeight / 250.f)), 1.f);
    self.parallaxView.alpha = r;
    
    self.bluredImageView.alpha = MIN(MAX(0.f, (newHeight - 270.f) / 50.f ), 1.f);
    
    self.secretLabel.alpha = self.bluredImageView.alpha;
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - ScrollCell delegate
////////////////////////////////////////////////////////////////////////

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.topParallaxScrollView) {
        self.pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
        
//        if (self.pageControl.currentPage == 0) {
//            self.captionLabel.text = @"Tab1";
//        } else if (self.pageControl.currentPage == 1) {
//            self.captionLabel.text = @"Tab2";
//        } else if (self.pageControl.currentPage == 2) {
//            self.captionLabel.text = @"Tab3";
//        }
    }
    
    //!!!!!!!!!!! always call super
    [super scrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
 
    if (scrollView == self.topParallaxScrollView) {
        self.bluredImageView.image = [self captureScrollContentViewImageWithBlur];
    }
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewCell delegate
////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", @(indexPath.section), @(indexPath.row)];
    return cell;
}

#pragma mark - UITableView 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}// 设置每行行高

// 设置Header的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"APP专享--因你不同";
    else
        return @"最新资讯--新鲜速递";
}

// 设置Header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SectionHeaderHeight;
}

// 自定义Header
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
//    if (sectionTitle == nil) {
//        return nil;
//    }
//    
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(10, 0, 320, 20);
//    label.backgroundColor = [UIColor clearColor];
//    label.textColor = [UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1];
//    label.shadowColor = [UIColor grayColor];
//    label.shadowOffset = CGSizeMake(-1.0, 1.0);
//    label.font = [UIFont boldSystemFontOfSize:16];
//    label.text = sectionTitle;
//    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, SectionHeaderHeight)];
//    [view addSubview:label];
//    
//    return view;
//}

// 选中行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"您点击了第%ld分区第%ld行",(long)indexPath.section, (long)indexPath.row);
    
    // 取消选中状态
    // [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
