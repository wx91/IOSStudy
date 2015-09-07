//
//  main.m
//  03.01 NSObjectDemo
//
//  Created by wangx on 15/9/7.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#include <objc/objc.h>
#include <objc/runtime.h>
int main(int argc, const char * argv[]) {
    NSObject *obj1=[[NSObject alloc]init];
    NSObject *obj2=[[NSObject alloc]init];
    
    if (![obj1 isEqualTo:obj2]) {
        NSLog(@"两个对象不相同");
    }
    if(obj1!=obj2){
        NSLog(@"两个对象不相同");
    }
    
    Person *p=[[Person alloc]init];
    [p invoke];
    
    //isKindOfClass和isMemberOfClass
    
    //创建一个Person对象
    Person *rose=[[Person alloc]init];
    //1.isMemberOfClass判断对象是否是某一类创建的
    //判断rose对象是否属于Person
    if ([rose isMemberOfClass:[Person class]]) {
        NSLog(@"Rose 是 Person类创建的");
    }
   
    if ([rose isMemberOfClass:[NSObject class]]) {
        NSLog(@"Rose 是 Person类创建的");
    }
    //2.isKindOfClass 判断一个对象是否为一个类的本类和子类创建派生类
    if([rose isKindOfClass:[Person class]]){
        NSLog(@"rose 是 Person类创建的");
    }
    if ([rose isKindOfClass:[NSObject class]]) {
        NSLog(@"Rose 是 NSObject子类创建的");
    }
    
    //respondsToSelector
    //respondsToSelector判断某一个对象中是否实现了某个方法
    
    Person *jack=[[Person alloc]init];
    if ([jack respondsToSelector:@selector(invoke)]) {
        NSLog(@"有 invoke 方法");
    }
    
    if([jack respondsToSelector:@selector(isKindOfClass:)]){
        NSLog(@"Person类 有isKindOfClass: 方法");
    }
    if ([jack respondsToSelector:@selector(demo3:withName:)]) {
        NSLog(@"Person类 有 demo3:withName: 方法");
    }
    if ([jack respondsToSelector:@selector(wxhl)]) {
        NSLog(@"Person类 有 wxhl 方法");
    }
    //如果不确定某一个方法是否在类中实现，先利用respondsToSelector判断此方法是否实现，满足条件再调用，这样更加严谨
//    if([jack respondsToSelector:@selector(demo3:withName:)]){
//        [jack demo3:@"wxhl" withName:@"zhagnsan"];
//    }
//    [jack demo3:@"wxhl" withName:@"zhagnsan"];
    
    //简单理解，以下代码让执行过程停在此处2秒
    [[NSRunLoop currentRunLoop]run];
    return 0;
}
