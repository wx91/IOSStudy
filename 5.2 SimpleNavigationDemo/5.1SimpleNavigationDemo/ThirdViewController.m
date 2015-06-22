//
//  ThirdViewController.m
//  5.1SimpleNavigationDemo
//
//  Created by wangx on 15/6/16.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThirdViewController.h"
#import "SecondViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
static int vcTag=3;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *title=[NSString stringWithFormat:@"第%d视图控制器",vcTag];
        self.title=title;
        self.viewControllerTag=vcTag;
        vcTag++;
    }
    return self;
}

-(void)loadView{
    UIView *baseView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor=[UIColor blueColor];
    self.view=baseView;
    
    UIButton *push=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [push setTitle:@"push" forState:UIControlStateNormal];
    [push setFrame:CGRectMake(90, 60, 140, 35)];
    [push addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
    
    
    UIButton *pop=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pop setTitle:@"pop" forState:UIControlStateNormal];
    [pop setFrame:CGRectMake(90, 150, 140, 35)];
    [pop addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pop];
    
    UIButton *root=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [root setTitle:@"root" forState:UIControlStateNormal];
    [root setFrame:CGRectMake(90,240, 140, 35)];
    [root addTarget:self action:@selector(root) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:root];
    
    UIButton *index=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [index setTitle:@"index" forState:UIControlStateNormal];
    [index setFrame:CGRectMake(90, 330, 140, 35)];
    [index addTarget:self action:@selector(index) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:index];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark
-(void)push{
    ThirdViewController *thirdVC=[[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdVC animated:YES];
    NSLog(@" third navigationController %p",self.navigationController);
}
//push到一个新的视图控制器

-(void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}
//返回上一级视图控制器

-(void)root{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//返回到根视图控制器

-(void)index{
    UIViewController * secondVC=[[self.navigationController viewControllers]objectAtIndex:1];
    [self.navigationController popToViewController:secondVC animated:YES];
}
//返回到指定的根视图控制器
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
