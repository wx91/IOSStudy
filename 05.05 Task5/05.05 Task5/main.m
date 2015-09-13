//
//  main.m
//  05.05 Task5
//
//  Created by wangx on 15/9/13.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    
    Dog *dog1=[[Dog alloc]init];
    Dog *dog2=[[Dog alloc]init];
    
    NSMutableArray *array=[[NSMutableArray alloc]init];
    //数组会对每一个元素retian
    [array addObject:dog1]; //dog1的引用计数为2
    [array addObject:dog2]; //dog2的引用计数为2
    NSLog(@"dog1 计数:%ld",dog1.retainCount);
    NSLog(@"dog2 计数:%ld",dog1.retainCount);
    
    [dog1 release];
    [dog2 release];
    //1.数组销毁的时候，会将数组中的每一个元素release
//    [array release];
    //2.将所有元素移除时
//    [array removeAllObjects];
    //3.移除指定对象，那么此对象会release
//    [array removeObjectAtIndex:0];
    
    
    return 0;
}
