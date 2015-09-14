//
//  main.m
//  0.5 07Task7
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    //循环应用导致内存泄露
    Person *p=[[Person alloc]init]; //person计数为：1
    Dog *dog=[[Dog alloc]init];     //dog计数为：1
    
    [p setDog:dog]; //dog 计数：2
    [dog setPerson:p];//person计数：2
    
    [p release];//person计数：1
    [dog release];//dog计数：1
    
    
    return 0;
}
