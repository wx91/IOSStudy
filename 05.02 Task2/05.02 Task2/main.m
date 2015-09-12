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

int main(int argc, const char * argv[]) {
    Dog *dog1=[[Dog alloc]init];
    dog1.name=@"小黑";
    
    
    Person *p=[[Person alloc]init];
    p.name=@"张三";
    [p setDog:dog1];    //dog的引用计数为:1
    [dog1 release];     //dog的引用计数为:1
//    [p setDog:dog1];
    [p setDog:dog1];
    
    
//    Dog *dog2=[[Dog alloc]init];
//    dog2.name=@"大黄";
//    [p setDog:dog2];
    
//    Person *p2=[[Person alloc]init];
//    p2.name=@"；李四";
//    [p2 setDog:dog1];
    
    NSLog(@"dog1计数:%ld",dog1.retainCount);
    
    return 0;
}
