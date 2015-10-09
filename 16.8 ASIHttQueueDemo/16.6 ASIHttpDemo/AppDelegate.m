//
//  AppDelegate.m
//  16.6 ASIHttpDemo
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import "WebImageView.h"
#import "ASINetworkQueue.h"
#import "ASIHTTPRequest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"test" forState:UIControlStateNormal];
    button.frame=CGRectMake(200, 100, 100, 50);
    [button addTarget:self action:@selector(loadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
//    self.queue=[ASINetworkQueue queue];
//    //设置请求的并发数
//    self.queue.maxConcurrentOperationCount=1;
    [ASIHTTPRequest sharedQueue].maxConcurrentOperationCount=1;

    return YES;
}

-(void)loadImage{
    for (int i=0; i<10; i++) {
        WebImageView *imageView=[[WebImageView alloc]initWithFrame:CGRectMake(10, i*100, 100, 100)];
        NSString *URLstr=@"http://tupian.sucaitianxia.com/images/007/pic6817.jpg";
        [imageView setImageURL:[NSURL URLWithString:URLstr]];
        [self.window addSubview:imageView];
    }
    //让队列中的请求执行
//    [self.queue go];
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
