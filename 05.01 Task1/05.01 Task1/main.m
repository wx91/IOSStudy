//
//  main.m
//  05.01 Task1
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p=[[Person alloc]init];
    NSLog(@"1.引用计数:%ld",p.retainCount);
    
    
    [p retain]; //使引用计数+1
    NSLog(@"2.引用计数:%ld",p.retainCount);
    
    [p retain]; //使引用计数+1
    NSLog(@"3.引用计数:%ld",p.retainCount);
    
    [p release];    //使引用计数-1
    NSLog(@"4.引用计数:%ld",p.retainCount);
    
    [p release];
    [p release];    //引用计数为0,对象会自动销毁掉，销毁之前调用dealloc方法
    
    
    return 0;
}
