//
//  main.m
//  01.06 Set_GetMethod
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p=[[Person alloc]init];
    //点语法调用的是set或get方法，且只能调用这两种方法
    //此处的点语法调用的是set设置器方法等价于[p setName:@"zhangsan"]
    p.name=@"zhangsan";
    //此处的点语法调用的是get返回器方法等价于[p name];
    NSString *name=p.name;
    NSLog(@"%@",p.name);
    
//    p.showInfo=@"xxx";[p setShowInfo:];
    //下一个方法可以调用，因为showInfo方法存在
    NSString *s=p.showInfo;//[p showInfo];
    NSLog(@"s=%@",s);
    
    p.age=23;//[p setAge:23];
    //test 方法在类中没有定义，调用时报错
    [p test]; //错误
    //[Person test]: unrecognized selector sent to instance 0x10020cb00
    
    return 0;
}
