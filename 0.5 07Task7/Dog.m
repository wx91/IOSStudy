//
//  Dog.m
//  0.5 07Task7
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)dealloc{
    NSLog(@"Person dealloc");
//    [_person release];
    [super dealloc];
}

@end
