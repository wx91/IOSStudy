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

@interface AppDelegate (){
    DataModel *_dataModel;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _dataModel =[[DataModel alloc]init];
    UINavigationController *navigationController=(UINavigationController *)self.window.rootViewController;
    AllListsViewController *controller=navigationController.viewControllers[0];
    controller.dataModel=_dataModel;
    //local notification
    NSDate *date =[NSDate dateWithTimeIntervalSinceNow:10];
    UILocalNotification *localNotification=[[UILocalNotification alloc]init];
    localNotification.fireDate=date;
    localNotification.timeZone=[NSTimeZone defaultTimeZone];
    localNotification.alertBody=@"2015年，马上有钱！";
    localNotification.soundName=UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}
-(void)saveData{
    [_dataModel saveChecklists];
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
