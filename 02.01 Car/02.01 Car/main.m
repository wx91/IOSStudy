//
//  main.m
//  02.01 Car
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

/*
 * 面向对象的封装
 *1. 对属性的封装
 *2. 对功能的实现细节进行封装
 *封装之后，这个类开放方法给调用者用，调用者不需要关心此类的实现细节。
 *只需要知道此类具备什么功能(方法)
 */
int main(int argc, const char * argv[]) {
    Car *car=[[Car alloc]init];
    [car setCapcity:2.8];
    
    [car run:0.4];
//    car->capcity=2.8;
//    NSLog(@"%f",car->capcity);
    
    return 0;
}
