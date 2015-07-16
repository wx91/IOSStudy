//
//  AppDelegate.m
//  2.Hello World_Code
//
//  Created by wangx on 15/6/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(60, 70, 140, 40)];
    label.text=@"Hello World";
    label.backgroundColor=[UIColor cyanColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.window addSubview:label];
    UIView *backView=[[UIView alloc]init];
    UIView *bView=[[UIView alloc]init];
    UIView *cView=[[UIView alloc]init];
    UIView *aView=[[UIView alloc]init];

    

    
    
    [[aView layer]addAnimation:animation forKey:@"animation"];
    //子类型
    animation.subtype=kCATransitionFromLeft;
    NSInteger bIndex=[backView.subviews indexOfObject:bView];
    NSInteger cIndex=[backView.subviews indexOfObject:cView];
    [backView exchangeSubviewAtIndex:bIndex withSubviewAtIndex:cIndex];
    [[backView layer]addAnimation:animation forKey:@"animation"];
    
    animation.type=@"cube";                 //立方体效果
    animation.type=@"suckEffect";           //收缩效果，如一块布被抽走
    animation.type=@"oglFlip";              //上下翻转效果
    animation.type=@"rippleEfect";          //滴水效果
    animation.type=@"pageCurl";             //向上翻一页
    animation.type=@"pageUnCurl";           //向下翻一页
    CATransition *animation =[CATransition animation];
    

    return YES;
}

-(void)animationDidStop{
    NSLog(@"动画结束");
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
