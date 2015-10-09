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
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 250)];
    scrollView.backgroundColor=[UIColor redColor];
    scrollView.contentSize=CGSizeMake(320*5, 300*5);
    //是否反弹
    scrollView.bounces=NO;
    //是否分页
    scrollView.pagingEnabled=YES;
    //是否滚动
    scrollView.scrollEnabled=NO;
    //是否显示水平滑动
    scrollView.showsHorizontalScrollIndicator=NO;
    //设置indicator的风格
    scrollView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    //提示用户使用此属性
    [scrollView flashScrollIndicators];
    //设置内容的边缘和Indicators的边缘
    scrollView.contentInset=UIEdgeInsetsMake(0, 50, 50, 0);
    scrollView.scrollIndicatorInsets=UIEdgeInsetsMake(0, 50, 0, 0);
    //是否同时运动
    scrollView.directionalLockEnabled=YES;
    
    [self.view addSubview:scrollView];
    
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(320, 200, 320, 40);
    label.backgroundColor=[UIColor yellowColor];
    label.text=@"学习ScrollView";
    label.textAlignment=NSTextAlignmentCenter;
    [scrollView addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(320/2-140/2, 350, 140, 40)];
    [button setTitle:@"ScrollView" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)test{
    [scrollView setContentOffset:CGPointMake(320,0) animated:YES];
//    [scrollView scrollRectToVisible:CGRectMake(320, 0, 320, 300) animated:YES];
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
