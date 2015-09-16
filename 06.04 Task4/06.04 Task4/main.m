//
//  main.m
//  06.04 Task4
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p=[[Person alloc]init];
        NSMutableString *name=[NSMutableString stringWithString:@"jack"];
        p.name=name;
        
        //如果Person是name是retain，则此处的name与person对象的name指向的是同一个字符串
        //此处的name修改之后，会导致person的name也会修改，破坏person对象的封装性
//        [name appendString:@"-tom"];
        [name setString:@"tom"];
        //面向对象的封装性，只能通过set方法去修改属性
        //[p setName:@"tom"];
        NSLog(@"%@",p.name);
        /**
         ** Foundation框架中可复制对象，当我们copy的是一个不可变对象，
         ** 它的作用想打嫆retain（系统做的内存优化）
         **/
        //不可变对象的copy相当于retain，而不是真正的拷贝
        NSArray *array1=[NSArray array];
        NSArray *array2=[array1 mutableCopy];
        if (array1==array2) {
            NSLog(@"array1==array2");
        }
        //mutablecopy不管什么对象都是真实的深拷贝
    }
    return 0;
}
