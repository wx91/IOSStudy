//
//  Person.m
//  04.02 task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"
//延展
@interface Person(private)

-(void)_showInfo;
@end

@implementation Person

-(void)work{
    NSLog(@"开始工作了!");
    [self _showInfo];
}

-(void)_showInfo{
    NSLog(@"我的信息是:");
}

@end
