//
//  AppDelegate.m
//  2.UIViewDemo
//
//  Created by wangx on 15/6/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import "SubView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    /*
    view1=[[UIView alloc]initWithFrame:CGRectMake(60, 100, 200, 100)];
    view1.backgroundColor=[UIColor redColor];
    view1.tag=1;
    [self.window addSubview:view1];
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor=[UIColor yellowColor];
    view2.tag=2;
    [view1 addSubview:view2];
    
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    view3.backgroundColor=[UIColor blueColor];
    view3.tag=3;
    [view2 addSubview:view3];
    */
    
    /*
    NSLog(@"view1 superview: %@",view1.superview);
    NSLog(@"view2 superview: %@",view2.superview);
    NSLog(@"self.window subviews:%@",self.window.subviews);
    NSLog(@"view1 subviews:%@",view1.subviews);
         NSLog(@"subview array:%@",self.window.subviews);
    */
    
    SubView *subview=[[SubView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    subview.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    subview.tag=101;
    [self.window addSubview:subview];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(90, 400, 140, 35);
    [button setTitle:@"change" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeView) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];

    
    return YES;
}

-(void)changeView{
    /*
    [self.window bringSubviewToFront:view1];
     */
    /*hidden和alpha的属性设置会连带影响子视图。
    UIView *view=[ self.window viewWithTag:3];
    view.backgroundColor= [UIColor greenColor];
    NSLog(@"%@",view);
    */
    UIView *view=[self.window viewWithTag:101];
    [view removeFromSuperview];
    
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
