//
//  main.m
//  02.07 Pricate
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Taxi.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    Taxi *t=[[Taxi alloc]initWithName:@"东风"];
    [t run];
//    [t privateMethod];
//    [t privateFunction];
    return 0;
}
