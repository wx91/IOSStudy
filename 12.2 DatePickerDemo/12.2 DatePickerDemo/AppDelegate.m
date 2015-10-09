//
//  AppDelegate.m
//  12.2 DatePickerDemo
//
//  Created by wangx on 15/7/1.
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
    
    UIDatePicker *datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 480-216, 0, 0)];
    datePicker.tag=100;
    datePicker.minimumDate=[NSDate dateWithTimeIntervalSinceNow:-60*60*24*365*10];
    datePicker.maximumDate=[NSDate date];
    datePicker.date=[NSDate dateWithTimeIntervalSinceNow:-60*60*24];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.window addSubview:datePicker];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(100, 100, 100, 20);
    [button setTitle:@"获取日期" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    return YES;
}

-(void)clickAction{
    UIDatePicker *datePicker=(UIDatePicker *)[self.window viewWithTag:100];
    NSDate *date=datePicker.date;
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString=[dateFormatter stringFromDate:date];
    NSLog(@"%@",dateString);
    
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
