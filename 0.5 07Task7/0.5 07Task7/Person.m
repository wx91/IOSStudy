//
//  Person.m
//  0.5 07Task7
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

-(void)dealloc{
    NSLog(@"Person dealloc");
    [_dog release];
    [super dealloc];
}

@end
