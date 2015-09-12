//
//  Dog.m
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)dealloc{
    [super dealloc];
    NSLog(@"Dog对象销毁");
}

-(void)setName:(NSString *)name{
    _name=name;
}

-(NSString *)name{
    return _name;
}

@end
