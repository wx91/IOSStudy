//
//  HomeViewController.m
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"

@implementation HomeViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"首页";
    }
    return self;
}
-(void)loadView{
    [super loadView];
    UIView *view=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    view.backgroundColor=[UIColor redColor];
    self.view=view;
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(90, 100, 140, 40)];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)push{
    DetailViewController *detailVC=[[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end
