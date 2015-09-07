//
//  main.m
//  02.04 Animal
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Rabbit.h"
#import "Tiger.h"

int main(int argc, const char * argv[]) {
    //1.创建兔子
    Rabbit *rabbit=[[Rabbit alloc]init];
    [rabbit eat];
    [rabbit sleep];
    
    //2.创建老虎
    Tiger *tiger=[[Tiger alloc]init];
    [tiger eat];
    [tiger sleep];
    return 0;
}
