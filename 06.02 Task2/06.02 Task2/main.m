//
//  main.m
//  06.02 Task2
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*
 * 浅拷贝：只复制对象本身，此对象所持有的对象不做复制
 * 深拷贝：不仅仅复制对象本身，所有持有对象也会复制给副本对象
 */
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        NSMutableArray *array1=[NSMutableArray arrayWithCapacity:2];
        //创建2个对象，添加到数组中
        for (int i=0; i<2; i++) {
            Person *p=[[Person alloc]init];
            [array1 addObject:p];
            [p release];
        }
        //复制之前数组对象的应用计数
        for (Person *p in array1) {
            NSLog(@"复制之前的引用计数：%ld",p.retainCount);
            NSLog(@"复制之前的指针：%p",p);
        }
        NSLog(@"-----------------------------------");
        //复制数组，array2是新复制出来的副本对象
        NSMutableArray *array2=[array1 mutableCopy];
        for (Person *p in array2) {
            NSLog(@"复制之后的引用计数：%ld",p.retainCount);
            NSLog(@"复制之后的指针：%p",p);
        }
        /*
         * 结论：
         * 1.数组复制出来的副本对象，副本对象中的元素知识引用计数+1
         * 说明此副本对象只是对所持有的元素对象retain，而没有复制
         * 2.说明数组的拷贝是浅拷贝
         */
    
    }
    return 0;
}
