//
//  AppDelegate.m
//  16.7 ASIDownloadFile
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import "ASIHttpRequest.h"
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(150, 30, 80, 30);
    [button setTitle:@"下载" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(downloadAction) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    //kReachabilityChangedNotification 网络状态改变时触发通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeNetwork:) name:kReachabilityChangedNotification object:nil];
    self.reachability=[Reachability reachabilityForInternetConnection];
    //开始监听网络
    [self.reachability startNotifier];
    //获取当前的网络状态
    NetworkStatus status=[self.reachability currentReachabilityStatus];
    [self checkNetWork:status];
    return YES;
}

-(void)downloadAction{
    //ASI下载
    UIProgressView *progressView=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.frame=CGRectMake(50, 100, 200, 20);
    [self.window addSubview:progressView];
    //通过KVO检查progress，达到监听进度的目的
    [progressView addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    
    NSString *urlstring=@"http://scrivener.s3.amazonaws.com/Scapple.dmg";
    NSString *document=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName=[urlstring lastPathComponent];
    NSString *path=[document stringByAppendingPathComponent:fileName];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlstring]];
    //响应头
    [request setHeadersReceivedBlock:^(NSDictionary *responseHeaders) {
        NSDictionary *responseHeader=request.responseHeaders;
        NSLog(@"%@",responseHeader);
        NSNumber *contentSize=[responseHeaders objectForKey:@"Content-Length"];
        NSLog(@"%f",[contentSize floatValue]);
    }];
    
    //设置文件下载存放的路径
    [request setDownloadDestinationPath:path];
    //设置进度条
    request.downloadProgressDelegate=progressView;
    [request startAsynchronous];
}
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    NSNumber *value=[change objectForKey:@"new"];
    float progress=[value floatValue];
    NSLog(@"%.1f",progress*100);
    NSLog(@"%.1f%%",progress);
    
}

-(void)changeNetwork:(NSNotification *)notification{
    NetworkStatus status=self.reachability.currentReachabilityStatus;
    [self checkNetWork:status];
    
}

-(void)checkNetWork:(NetworkStatus )status{
    if (status== kNotReachable) {
        NSLog(@"没有网络");
    }else if(status==kReachableViaWWAN){
        NSLog(@"使用3G移动网络");
    }else{
        NSLog(@"使用wifi进行开发");
    }
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
