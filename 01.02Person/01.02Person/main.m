//
//  main.m
//  01.02Person
//
//  Created by wangx on 15/9/3.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //alloc是在内存中申请一块内存区域，来存储此对象信息
        //Person *person=[Person alloc];
        //调用init方法初始化一些默认数据
        //person=[person init];
        //两个步骤嵌套，创建一个person对象
        Person *person1=[[Person alloc]init];
        //设置名字
        [person1 setName:@"张三"];
        [person1 setAge:22];
//        [person1 setName:@"张三" setAge:22];
        
        
        //不推荐使用new关键字创建一个对象
//        Person *person2=[Person new];
        //调用了shopping这个实例方法，实例方法必须使用对象才能调用
        [person1 shoping:200];
        
        Person *person2=[[Person alloc]init];
        [person2 setName:@"李四"];
        [person2 setAge:23];
        [person2 shoping:300];
        
        NSString *name1=[person1 name];
        NSString *name2=[person2 name];
        NSLog(@"person1的名字%@,person2的名字:%@",name1,name2);
        
        //newPerson是类方法，使用类名调用此方法
//        Person *person3=[Person newPerson];
//        [Person testClass];
        //给指针变量person4设置为空指针地址
        Person *person4=nil;
        [person4 shoping:400];
        
        
        
        
    }
    return 0;
}
