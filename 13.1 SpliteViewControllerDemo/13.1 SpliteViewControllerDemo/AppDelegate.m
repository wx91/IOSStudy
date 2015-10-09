//
//  AppDelegate.m
//  13.1 SpliteViewControllerDemo
//
//  Created by wangx on 15/7/1.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
  
    MasterViewController *masterCtrl=[[MasterViewController alloc]init];
    UINavigationController *masterNav=[[UINavigationController alloc]initWithRootViewController:masterCtrl];
    
    DetailViewController *detailCtrl=[[DetailViewController alloc]init];
    UINavigationController *detailNav=[[UINavigationController alloc]initWithRootViewController:detailCtrl];
    
    UISplitViewController *splitViewController=[[UISplitViewController alloc]init];
    //是否通过手势，浮动显示master窗口
    splitViewController.presentsWithGesture=YES;
    splitViewController.delegate=self;
    splitViewController.viewControllers=@[masterNav,detailNav];
    
    self.window.rootViewController=splitViewController;
    return YES;
}
//隐藏Master窗口
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    
}
//显示master窗口调用
- (void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
    invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
}
//master窗口作为浮动窗口显示
- (void)splitViewController:(UISplitViewController *)svc
        popoverController:(UIPopoverController *)pc
        willPresentViewController:(UIViewController *)aViewController{
    
}
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation{
    return YES;
}
//返回NO：显示master窗口，YES隐藏master窗口
//如果此协议方法不事先，则横屏Master窗口显示，竖排隐藏
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
