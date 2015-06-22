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
    UITabBarItem *homeItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    vc1.tabBarItem=homeItem;
    
    MessageViewController *vc2=[[MessageViewController alloc]init];
    UITabBarItem *msgItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    vc2.tabBarItem=msgItem;
    
    SearchViewController *vc3=[[SearchViewController alloc]init];
    UITabBarItem *searchItem=[[UITabBarItem alloc]initWithTitle:@"搜索" image:[UIImage imageNamed:@"alarm" ] tag:3];
    
    vc3.tabBarItem=searchItem;
    
    SettingViewController *vc4=[[SettingViewController alloc]init];
    UITabBarItem *settingItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:4];
    vc4.tabBarItem=settingItem;
    
    
    NSArray *viewControllers=@[vc1,vc2,vc3,vc4];
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    [tabBarController setViewControllers:viewControllers animated:YES];
    [self.window setRootViewController:tabBarController];
    
    return YES;
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
