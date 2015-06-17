//
//  SecondViewController.m
//  5.1SimpleNavigationDemo
//
//  Created by wangx on 15/6/16.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


-(void)loadView{
    UIView *baseView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor=[UIColor orangeColor];
    self.view=baseView;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"isHidden" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 150, 140, 35)];
    [button addTarget:self action:@selector(HiddenOrShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [back setTitle:@"BckRoot" forState:UIControlStateNormal];
    [back setFrame:CGRectMake(90, 200, 140, 35)];
    [back addTarget:self action:@selector(backRootVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIView *testView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    testView.backgroundColor=[UIColor orangeColor];
    self.navigationItem.titleView=testView;
//   self.navigationItem.title=@"第一个";
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"自定义" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem=rightItem;
//    self.navigationItem.prompt=@"加载";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //默认是隐藏的
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -Target action
-(void)HiddenOrShow{
    //显示navigation和toolbar
    if (self.navigationController.toolbarHidden) {
        [self.navigationController setToolbarHidden:NO animated:YES];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else{
        [self.navigationController setToolbarHidden:YES animated:YES];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

-(void)backRootVC{
    //返回上一层视图控制器
    [self.navigationController popViewControllerAnimated:YES];
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
