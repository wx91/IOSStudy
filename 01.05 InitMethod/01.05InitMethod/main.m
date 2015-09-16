//
//  main.m
//  01.05InitMethod
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
//    Person *p=[[Person alloc]initWithName:@"张三"];
    Person *person1=[[Person alloc]initWithName:@"张三" withAge:11];
    //初始化方法只能调用一次
//    [p initWithName:@"lisi"];
    [person1 showInfo];
    
    Person *person2=[[Person alloc]initWithName:@"李四" withAge:12];
    [person2 setName:@"王五"];
    [person2 showInfo];
    
    //id类型是个通用的类型，类似于void *，可以声明任何类型的指针变量
    //void *p;
    
    return 0;
}
