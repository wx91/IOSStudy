//
//  main.m
//  05.06 Task6
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {

    
//    Dog *dog1=[[Dog alloc]init];
//    
//    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
//    [dog1 retain];//计数为2
//    
//    //将dog1对象放入到自动释放池
//    [dog1 autorelease];
//    NSLog(@"dog1计数:%ld",dog1.retainCount);
//    
//    //当自动释放池销毁的时候，会对池子中的每一个对象发送release消息（调用了release方法）
//    [pool release];//dog1 计数1
//    
//    [dog1 release];
//    
//    
//    @autoreleasepool {//等价于NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
//        //dog2变量只能在{}作用域中有效
//        Dog *dog2=[[Dog alloc]init];
//        [dog2 retain];
//    
//    }//等价于[pool release];
    
    //自动释放池的嵌套
//    NSAutoreleasePool *pool1=[[NSAutoreleasePool alloc]init];
//    Dog *dog1=[[Dog alloc]init];
//    dog1.name=@"小黑";
//    [dog1 autorelease];
//    //自动释放池的就近原则，向上查找到最近的自动释放池，
//    NSAutoreleasePool *pool2=[[NSAutoreleasePool alloc]init];
//    Dog *dog2=[[Dog alloc]init];
//    dog2.name=@"大黄";
//    
//    [dog2 autorelease];
//    [pool2 release];
//    
//    
//    [pool1 release];
//使用自动释放池优化内存
    NSMutableArray *array=[[NSMutableArray alloc]init];
    for (int i=0; i<10000; i++) {
        Dog *dog=[[Dog alloc]init];
        [array addObject:dog];
        [dog release];
    }
    
    
    return 0;
}
