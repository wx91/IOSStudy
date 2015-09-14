//
//  main.m
//  06.01 Task1
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //数组对象进行retain
//        NSMutableArray *array1=[NSMutableArray arrayWithObjects:@"one",@"two", nil];
//        //retain只是引用计数+1，没有创建新的对象
//        //array1与array2指针相同，指向同一个对象。
//        NSMutableArray *array2=[array1 retain];
//        if (array1==array2) {
//            NSLog(@"array1=array2");
//            NSLog(@"array1的引用计数:%ld",array2.retainCount);
//        }
        //数组对象copy
//        NSMutableArray *array1=[NSMutableArray arrayWithObjects:@"one",@"two", nil];
//        [array1 retain];//引用计数:2
//        //复制对象，创建一个新的副本对象,复制copy出来的对象是NSMutableArray调用的是
//        //NSArray中NSCoding中copyWithZone
//        NSArray *array2=[array1 copy];//array2计数为:1 因为是心创建出来的对象
//        if (array1!=array2) {
//            NSLog(@"array1!=array2是两个对象");
//            NSLog(@"array1的引用计数:%ld",array1.retainCount);
//            NSLog(@"array2的引用计数:%ld",array2.retainCount);
//        }
//        [array2 release];
//        [array1 release];
        
        //copy和mutableCopy的区别
        /*
         *copy与mutablecopy都是复制对象，都能复制一个新的副本对象出来
         *copy复制出来的对象，是不可变的对象
         *mutablecopy复制出来的对象，是可变的对象
         */
        NSMutableArray *array1=[NSMutableArray arrayWithObjects:@"one",@"two", nil];
        //copy复制出来的对象是不可变的,指针是NSArray，不能调用NSMutableArray方法
        NSArray *array2=[array1 copy];//NSCoding
        
        //mutableCopy 复制出来的对象是可变的
        NSMutableArray *array3=[array2 mutableCopy];//NSMutableCopying
        [array3 addObject:@"asdfdsa"];
        NSLog(@"array3=%@",array3);
        
//        NSNumber *number=@123;
        //NSNumber没有实现NSMutableCopying协议
//        [number mutableCopy];
        
        
    }
    return 0;
}
