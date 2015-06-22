//
//  AppDelegate.m
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
#import "OtherViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
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
//    msgItem.badgeValue=@"new";
//    [UIApplication sharedApplication]applicationIconBadgeNumber=8
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
    
    OtherViewController *vc6=[[OtherViewController alloc]init];
    UINavigationController *otherNav2=[[UINavigationController alloc]initWithRootViewController:vc6];
    UITabBarItem *otherItem2=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:6];
    vc6.tabBarItem=otherItem2;
    
    OtherViewController *vc7=[[OtherViewController alloc]init];
    UINavigationController *otherNav3=[[UINavigationController alloc]initWithRootViewController:vc7];
    UITabBarItem *otherItem3=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemRecents tag:6];
    vc7.tabBarItem=otherItem3;
    
    
    
    NSArray *viewControllers=@[homeNav,msgNav,searchNav,setNav,otherNav1,otherNav2,otherNav3];
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    tabBarController.delegate=self;
    [tabBarController setViewControllers:viewControllers animated:YES];
    [self.window setRootViewController:tabBarController];
    
    return YES;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    //视图将要切换时调用，viewController为将要显示的控制器
    NSLog(@"shouldSelectViewController");
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //视图已经切换后调用，viewController是切换后的控制器
    NSLog(@"didSelectViewController");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
