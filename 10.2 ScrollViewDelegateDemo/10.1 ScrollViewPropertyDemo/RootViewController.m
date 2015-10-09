//
//  RootViewController.m
//  10.1 ScrollViewPropertyDemo
//
//  Created by wangx on 15/6/28.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(void)loadView{
    [super loadView];
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    scrollView.backgroundColor=[UIColor redColor];
    scrollView.contentSize=CGSizeMake(320, 460*5);
//    是否支持滑动到最顶端
//    scrollView.scrollsToTop=NO;
    
    scrollView.delegate=self;
    scrollView.pagingEnabled=YES;
    [self.view addSubview:scrollView];
    
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(0, 200, 320, 40);
    label.backgroundColor=[UIColor yellowColor];
    label.text=@"学习ScrollView";
    label.textAlignment=NSTextAlignmentCenter;
    [scrollView addSubview:label];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
////返回一个放大或者缩小的视图
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView; {
//    return nil;
//}
////开始放大或缩小
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    
//}
////结束放大或缩小
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
//    
//}
// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}
//
// 滑动到顶部时调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrollToTop");
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

// scrollView 开始减速（以下两个方法注意与以上两个方法加以区别）
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

// scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
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
