//
//  AppDelegate.m
//  4.3 UITextFieldDemo
//
//  Created by wangx on 15/6/22.
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
    button.frame=CGRectMake(90, 80, 140, 35);
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    UITextField *tf=[[UITextField alloc]initWithFrame:CGRectMake(60, 180, 200, 35)];
    tf.tag=101;
    tf.delegate=self;//设置代理
    tf.textColor=[UIColor redColor];
    tf.placeholder=@"用来提示用户";
    tf.adjustsFontSizeToFitWidth=YES;
    tf.clearsOnBeginEditing=YES;
    tf.clearButtonMode=UITextFieldViewModeWhileEditing;
//    tf.background=[UIImage imageNamed:@"navigation"];
    tf.borderStyle=UITextBorderStyleRoundedRect;
    [self.window addSubview:tf];
    
    //称为第一响应者
//    [tf becomeFirstResponder];
    
    //自定义clear按钮
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    view.backgroundColor=[UIColor yellowColor];
//    tf.rightView=view;
//    tf.rightViewMode=UITextFieldViewModeUnlessEditing;
    
    //自定义系统键盘
//    UIView *csView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
//    csView.backgroundColor=[UIColor yellowColor];
//    tf.inputView=csView;
    
    
    //共用
//    UIView *csView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    csView.backgroundColor=[UIColor yellowColor];
//    tf.inputAccessoryView=csView;
//    
//    tf.secureTextEntry=YES;
//    tf.keyboardType=UIKeyboardTypeNumberPad;
//    tf.returnKeyType=UIReturnKeyDone;
//    tf.autocapitalizationType=UITextAutocapitalizationTypeNone;
    
    return YES;
}
-(void)test{
    UITextField *tf=(UITextField *)[self.window viewWithTag:101];
    //将见键盘移除
    [tf resignFirstResponder];//取消第一响应者
}
#pragma mark TextField Delegate
//textField becomeFirstResponder
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
//[tf resignFirstResponder]
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    return YES;
}
//每次增加的字符串
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"shouldChangeCharactersInRange:%@",string);
    return YES;
}
-(BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"textFieldShouldClear");
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
