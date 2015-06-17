//
//  MainViewController.m
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
#import "OtherViewController.h"

@implementation MainViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName: nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


-(void)loadCustomTabBarView{
    
    //层次：背景（最下）、选中图片（中间）、按钮（最上层）
    //初始化自定义TabBar背景
     _tabBarBG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 431, 320, 49)];
    _tabBarBG.image=[UIImage imageNamed:@"tabBar"];
    _tabBarBG.userInteractionEnabled=YES;
    [self.view addSubview:_tabBarBG];
    
    //初始化自定义的选中背
    _selectView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 49.0/2-45.0/2, 53, 45)];
    _selectView.image=[UIImage imageNamed:@"select"];
    [_tabBarBG addSubview:_selectView];
    
    //初始化自定义TabBarItem->UIButton
    float coordinateX=0;
    for (int index=0; index<5; index++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag=index;
        button.frame=CGRectMake(14+coordinateX, 49.0/2, 40, 42);
        NSString *imageName=[NSString stringWithFormat:@"%d",index+1];
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [_tabBarBG addSubview:button];
        [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        coordinateX+=62;
    }
}

-(void)changeViewController:(UIButton *)button{
    self.selectedIndex=button.tag;
}


-(void)loadView{
    
}


-(void)viewDidLoad{
    [super viewDidLoad];
    /*
     * 1.创建若干个子视图控制器（他们是并列的关系）
     * 1.1 创建UITabBarItem实例，赋值给相应的子视图控制器（2中方法）
     * 2.创建一个数组，将以创建的子视图控制器，添加到数组中
     * 3.创建UITabBarController实例控制器，添加到数组中
     * 4.tabBarController.viewControllers=viewControllers;
     * 5.添加到window的rootViewController中
     */
    
    HomeViewController *vc1=[[HomeViewController alloc]init];
    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:vc1];
    UITabBarItem *homeItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    vc1.tabBarItem=homeItem;
    
    MessageViewController *vc2=[[MessageViewController alloc]init];
    UINavigationController *msgNav=[[UINavigationController alloc]initWithRootViewController:vc2];
    UITabBarItem *msgItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    vc2.tabBarItem=msgItem;
    
    SearchViewController *vc3=[[SearchViewController alloc]init];
    UINavigationController *searchNav=[[UINavigationController alloc]initWithRootViewController:vc3];
    UITabBarItem *searchItem=[[UITabBarItem alloc]initWithTitle:@"搜索" image:[UIImage imageNamed:@"alarm" ] tag:3];
    
    vc3.tabBarItem=searchItem;
    
    SettingViewController *vc4=[[SettingViewController alloc]init];
    UINavigationController *setNav=[[UINavigationController alloc]initWithRootViewController:vc4];
    UITabBarItem *settingItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:4];
    vc4.tabBarItem=settingItem;
    
    OtherViewController *vc5=[[OtherViewController alloc]init];
    UINavigationController *otherNav1=[[UINavigationController alloc]initWithRootViewController:vc5];
    UITabBarItem *otherItem1=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemHistory tag:5];
    vc5.tabBarItem=otherItem1;
    
    
    NSArray *viewControllers=@[homeNav,msgNav,searchNav,setNav,otherNav1];
    [self setViewControllers:viewControllers animated:YES];
    
    self.tabBarController.selectedIndex=2;
}

-(void)showTabBar{
    _tabBarBG.hidden=NO;
}

-(void)hiddenTabBar{
    _tabBarBG.hidden=YES;
}

@end
