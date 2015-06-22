//
//  AppDelegate.m
//  6.1 UITabBarControllerDemo
//
//  Created by wangx on 15/6/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"

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
     * 2.创建一个数组，将以创建的子视图控制器，添加到数组中
     * 3.创建UITabBarController实例控制器，添加到数组中
     * 4.tabBarController.viewControllers=viewControllers;
     * 5.添加到window的rootViewController中
     */
    UIViewController *vc1=[[UIViewController alloc]init];
    vc1.title=@"首页";
    vc1.view.backgroundColor=[UIColor redColor];
    
    UIViewController *vc2=[[UIViewController alloc]init];
    vc2.title=@"新闻";
    vc2.view.backgroundColor=[UIColor yellowColor];
    
    UIViewController *vc3=[[UIViewController alloc]init];
    vc3.title=@"历史";
    vc3.view.backgroundColor=[UIColor blueColor];
    
    UIViewController *vc4=[[UIViewController alloc]init];
    vc4.title=@"搜索";
    vc4.view.backgroundColor=[UIColor purpleColor];
    
    UIViewController *vc5=[[UIViewController alloc]init];
    vc5.title=@"设置";
    vc5.view.backgroundColor=[UIColor orangeColor];
    
    NSArray *viewControllers=@[vc1,vc2,vc3,vc4,vc5];
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
