//
//  main.m
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"
#import "Student.h"

/**
 *  1.多release，导致调用野指针
 *  2.少release，内存泄露，对象不会被销毁掉
 */

int main(int argc, const char * argv[]) {
    
    Dog *dog1=[[Dog alloc]init];//引用计数为1
    dog1.name=@"小黑";
    NSLog(@"dog1计数:%ld",dog1.retainCount);
//    [dog1 release];
//    NSLog(@"dog1计数:%ld",dog1.retainCount);
    
//    
//    Person *p=[[Person alloc]initwithDog:dog1];//应用计数为1
//    [p playDog];
//    [dog1 release];
//    [p release];
    
    
    
//    Person *p=[[Person alloc]init]; //引用计数为1
//    p.name=@"张三";
//    [p setDog:dog1];    //dog的引用计数为:1
    
//    [dog1 release];     //dog的引用计数为:1
//    [p  release];       //person应用计数为:0
    
//    [p setDog:dog1];
//    [p setDog:dog1];
    
    
//    Dog *dog2=[[Dog alloc]init];
//    dog2.name=@"大黄";
//    [p setDog:dog2];
    
//    Person *p2=[[Person alloc]init];
//    p2.name=@"；李四";
//    [p2 setDog:dog1];
    
//    NSLog(@"dog1计数:%ld",dog1.retainCount);
    
    Student *stu=[[Student alloc]init];
    [stu setDog:dog1];
    [stu playDog];
    [stu release];
    [dog1 release];
    
    return 0;
}
