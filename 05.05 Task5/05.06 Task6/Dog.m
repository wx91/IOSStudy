//
//  Dog.m
//  05.06 Task6
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)dealloc{
    NSLog(@"Dog dealloc%@",self.name);
    [super dealloc];
}

@end
