//
//  main.m
//  01.03 Car
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

/*
 *1.定义一个汽车Car，它有两个属性，名称（name）速度（speed）。还有一个启动的方法，该方法
 实现就打印xx汽车启动了，时速是xx 
 */

#import <Foundation/Foundation.h>
#import "Car.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *car=[[Car alloc]init];
        //调用设置车名的方法
        [car setName:@"保时捷"];
        //设置速度的方法
        [car setSpeed:120];
        //修改汽车的速度
        [car setSpeed:220];
        //调用车的启动方法
        [car run];
    }
    return 0;
}
