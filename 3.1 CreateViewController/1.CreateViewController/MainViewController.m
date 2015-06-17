//
//  MainViewController.m
//  1.CreateViewController
//
//  Created by wangx on 15/6/13.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void)loadView{
    //第一种，调用父类的loadview
//    [super loadView];
    //第二种方法
    UIView *view=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    view.backgroundColor=[UIColor orangeColor];
    self.view=view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
