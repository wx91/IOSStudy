//
//  RootViewController.m
//  4.AnimationDemo
//
//  Created by wangx on 15/6/13.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self=[super initWithStyle:style];
    if (self) {
        self.title=@"IOS动画";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    viewAnimationArray=[NSArray arrayWithObjects:@"淡入，淡出",@"位置变换",@"缩放变换",@"选择转动画",@"代理动画",@"过渡动画",@"block动画", nil];
    transitionArray=[NSArray arrayWithObjects:@"trainsition 1",@"trainsition 2",@"trainsition 3",@"trainsition 4" ,nil]
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
