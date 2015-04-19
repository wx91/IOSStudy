//
//  AppDelegate.m
//  CheckLists
//
//  Created by wangx on 15/3/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import "DataModel.h"
#import "AllListsViewController.h"

@implementation AppDelegate{
    DataModel *_dataModel;
}

-(void)saveData{
    [_dataModel saveChecklists];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _dataModel =[[DataModel alloc]init];
    
    UINavigationController *navigationController=(UINavigationController *)self.window.rootViewController;
    
    AllListsViewController *controller=navigationController.viewControllers[0];
    
    controller.dataModel=_dataModel;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [self saveData];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveData];
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"didReceivedLocalNotification %@",notification);
}

@end
