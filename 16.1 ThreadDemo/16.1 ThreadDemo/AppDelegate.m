//
//  AppDelegate.m
//  16.1 ThreadDemo
//
//  Created by wangx on 15/7/3.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //mutableThread是该线程的入口，方法执行完毕，则该线程结束，返回到调用它的地方。
    
    //第一种方式 创建多线程对象
//    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(mutableThread) object:@"test"];
//    [thread start];
    // 第一种方式 线程创建后立刻执行
//    [NSThread detachNewThreadSelector:@selector(mutableThread) toTarget:self withObject:nil];
    //第三种 线程创建后立刻执行
//    [self performSelectorInBackground:@selector(mutableThread) withObject:nil];
    //-------4.第四种方式block语法启动一个线程  NSOperationQueue相当于线程池或线程队列
//    NSOperationQueue *threadQueue=[[NSOperationQueue alloc]init];
//    [threadQueue addOperationWithBlock:^{
//        for (int i=0; i<100; i++) {
//            NSLog(@"--多线程--%d",i);
//        }
//    }];
    
//    //-------5.第五种方式  NSOperation开启一个线程
//    //创建一个线程队列
//    NSOperationQueue *threadQueue=[[NSOperationQueue alloc]init];
//    //设置线程执行的并发数，等线程执行完成后再次执行
//    threadQueue.maxConcurrentOperationCount=1;
//    //创建一个线程队列
//    NSInvocationOperation *operation= [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(mutableThread) object:nil];
//    
//    NSInvocationOperation *operation2= [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(mutableThread2) object:nil];
//    //设置线程的优先级
//    operation2.queuePriority=NSOperationQueuePriorityHigh;
//    
//    //线程添加到线程队列
//    [threadQueue addOperation:operation];
//    [threadQueue addOperation:operation2];
    //---------6.第六种方式 GCD
    //创建一个队列
    dispatch_queue_t queue=dispatch_queue_create("test", NULL);
    //异步多线程
    dispatch_async(queue, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"--多线程1--%d",i);
        }
        BOOL isMuliti=[NSThread isMultiThreaded];
        if (isMuliti) {
            NSLog(@"多线程");
        }
        //返回主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            BOOL isMain=[NSThread isMainThread];
            if (isMain) {
                NSLog(@"主线程!");
            }
        });
    });
    //通过此种方式，还是同步运行在当前的线程上
    dispatch_sync(queue, ^{
       //运行在当前主线程上
    });

    
//    [self mutableThread];
    
    
    for (int i=0; i<100; i++) {
        NSLog(@"--主线程--%d",i);
    }

    return YES;
}
//创建多线程
-(void)mutableThread{
    //尽量在线程开始是建立自动释放池@autoreleasepool
    for (int i=0; i<100; i++) {
        NSLog(@"--多线程1--%d",i);
    }
    //返回到主线程
    //如果waitUntilDone:YES则，定义的方法执行完成，然后回到主线程，NO则不需要等待进入主线程
    [self performSelectorOnMainThread:@selector(mainThread) withObject:nil waitUntilDone:YES];
}
-(void)mutableThread2{
    for (int i=0; i<100; i++) {
    NSLog(@"--多线程2--%d",i);
    }
}
-(void)mainThread{
    //判断当前线程是否为主线程
    BOOL isMain=[NSThread isMainThread];
    if (isMain) {
        NSLog(@"mainThread");
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
