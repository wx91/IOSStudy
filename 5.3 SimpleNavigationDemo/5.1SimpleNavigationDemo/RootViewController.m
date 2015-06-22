//
//  RootViewController.m
//  5.1SimpleNavigationDemo
//
//  Created by wangx on 15/6/16.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"
@interface RootViewController()

@end

@implementation RootViewController

-(void)loadView{
    UIView *baseView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    baseView.backgroundColor=[UIColor purpleColor];
    self.view=baseView;
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(90, 100, 140, 40)];
    [button addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(study)];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *item=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [item setTitle:@"test" forState:UIControlStateNormal];
    [item setFrame:CGRectMake(0, 0, 60, 35)];
    [item addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:item];
    self.navigationItem.rightBarButtonItem=rightItem;
    
    
    
    /*
     *一个导航控制器控制着若干个视图控制器
     *一个导航控制器包含一个NavigationBar和一个toolBar
     *NavigationBar中的“按钮”是一个UINavigationItem（only one）
     *通过设置它（UINavigationItem）的属性，显示Item（UINavigationBar）
     *UINavigationItem不是有NavigationBar控制，更不是有UINavigationController来控制
     *而是由当前的视图控制器控制
     */
    //错误的写法
//    self.navigationController.navigationItem.leftBarButtonItem=leftItem;
    
    
    NSLog(@"root %p",self.navigationController);
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
-(void)pushVC{
    //secondVC进入 navigation 的栈中 self.navigationController返回的时 navigation
    SecondViewController *secondVC=[[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

-(void)study{
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"study" message:@"恭喜" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}
-(void)test{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"study" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定", nil];
    [actionSheet showInView:self.view];
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
