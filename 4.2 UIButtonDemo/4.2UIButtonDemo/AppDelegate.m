//
//  AppDelegate.m
//  4.2UIButtonDemo
//
//  Created by wangx on 15/6/15.
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
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //禁用按钮
//    button.enabled=NO;
//    //按钮选中
//    button.selected=YES;
//    //设置标题，状态正常
    [button setTitle:@"Normal" forState:UIControlStateNormal];
//    //设置标题，状态高亮
//    [button setTitle:@"Highlighted" forState:UIControlStateHighlighted];
//    //设置标题，状态禁用
//    [button setTitle:@"disabled" forState:UIControlStateDisabled];
//    //设置标题，状态选中
//    [button setTitle:@"selected" forState:UIControlStateSelected];
//    //设置title颜色
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    //设置背景图片
//    [button setBackgroundImage:[UIImage imageNamed:@"love_normal"] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:@"love_select"] forState:UIControlStateHighlighted];
//    [button setBackgroundImage:[UIImage imageNamed:@"love_select"] forState:UIControlStateSelected];
    
    //设置图片
//    [button setImage:[UIImage imageNamed:@"love_normal"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"love_select"] forState:UIControlStateSelected];
    
    //用户在空间内按下抬起时
    [button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    //用户按下去时
    [button addTarget:self action:@selector(down) forControlEvents:UIControlEventTouchDown];
    //用户按下时
    [button addTarget:self action:@selector(outside) forControlEvents:UIControlEventTouchUpOutside];
    //记录用户多次按下
    [button addTarget:self action:@selector(repeat) forControlEvents:UIControlEventTouchDownRepeat];
    // 用户由内向外
    [button addTarget:self action:@selector(dragExit) forControlEvents:UIControlEventTouchDragExit];
    //用户由外向内
    [button addTarget:self action:@selector(dragEnter) forControlEvents:UIControlEventTouchDragEnter];
    // 事件的取消
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchCancel];
    //设置frame，与按钮类型有关
    button.frame=CGRectMake(90,100,100,60);
    [self.window addSubview:button];
    return YES;
}
-(void)touchUpInside:(UIButton *)button{
    if (button.selected) {
        button.selected=NO;
    }else{
        button.selected=YES;
    }
    NSLog(@"touchUpInside");
}

- (void)down
{
    NSLog(@"down");
}

- (void)outside
{
    NSLog(@"outside");
}

- (void)repeat
{
    NSLog(@"repeat");
}

- (void)dragExit
{
    NSLog(@"dragExit");
}

- (void)dragEnter
{
    NSLog(@"dragEnter");
}

- (void)cancel
{
    NSLog(@"cancel");
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
