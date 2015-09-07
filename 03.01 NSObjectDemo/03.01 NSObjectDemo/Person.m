//
//  Person.m
//  03.01 NSObjectDemo
//
//  Created by wangx on 15/9/7.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)invoke{
    /*
     //1.调用demo1方法
    [self demo1];
    //2.调用不带参数的方法demo1
    BOOL ret=[self performSelector:@selector(demo1)];
    //调用带参数的方法demo2:,将@"wxhl"传给demo2的形参
    [self performSelector:@selector(demo2:) withObject:@"wxhl"];
    //调用带2个参数的方法demo3:withName:
    [self performSelector:@selector(demo3:withName:) withObject:@"wxhl" withObject:@"zhangsan"];
    */
    //延迟调用一个方法
    NSLog(@"准备延迟调用");
    //此处的延迟调用，代码不会停留在此处
    [self performSelector:@selector(demo1) withObject:NULL afterDelay:1];
    //简单理解，以下代码让执行过程停在此处2秒
//    [[NSRunLoop currentRunLoop]run];
}

-(BOOL)demo1{
    NSLog(@"demo1");
    return YES;
}
-(void)demo2:(NSString *)str{
    NSLog(@"%@",str);
}
-(void)demo3:(NSString *)str withName:(NSString *)name{
    NSLog(@"str=%@,name=%@",str,name);
}

@end
