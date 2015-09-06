//
//  Student.m
//  02.03 Student
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Student.h"

@implementation Student

//工作
-(void)work{
    //调用父类的work方法，没有问题
    [super work];
    //死循环，递归调用当前的方法
//    [self work]; //错误
    NSLog(@"学生开始学习了！");
}

@end
