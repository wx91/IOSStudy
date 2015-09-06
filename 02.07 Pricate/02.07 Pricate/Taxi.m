//
//  Taxi.m
//  02.07 Pricate
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Taxi.h"
static void privateFunction(){
    NSLog(@"privateMethod");
}


@implementation Taxi
//OC中私有的方法，只是一个约定而已，在语法上没有真正的私有方法
-(void)privateMethod{
    NSLog(@"privateMethod 私有的方法");
}

-(void)run{
    //当前类调用私有的方法
//    [self privateMethod];
//    privateFunction();//C语言的私有方法
    //_brand 此属性父类私有的，子类不能访问，不能被子类继承
//    _brand=@"";//错误的
    NSLog(@"%@出租车启动了",_name);
}

@end
