//
//  main.m
//  02.03 Student
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
/*
 *方法重写必须满足的两个条件：
 *1.必须要继承
 *2.方法名、参数列表必须都一样
 */
int main(int argc, const char * argv[]) {
    Student *st=[[Student alloc]init];
    [st work];
    return 0;
}
