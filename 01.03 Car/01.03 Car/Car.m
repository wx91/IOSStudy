//
//  Car.m
//  01.03 Car
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)setName:(NSString *)name{
    _name=name;
}
-(void)setSpeed:(NSUInteger *)speed{
    _speed=speed;
}

-(void)run{
    NSLog(@"%@汽车启动了，时速为%ld",_name,(NSUInteger)_speed);
}

@end
