//
//  AppDelegate.m
//  CheckListsNIB
//
//  Created by wangx on 15/4/19.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    CheckListViewController *controller = [[CheckListViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:controller];
    self.window.rootViewController=navigation;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
