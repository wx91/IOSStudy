//
//  Person.m
//  05.06 Task6
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person

+(instancetype)PersonWithName:(NSString *)name{
    //此处的self不是指向当前对象，而是指向Person类
    Person *person=[[self alloc]init];//等价与[[Person alloc]init];
    return [person autorelease];
}
-(void)dealloc{
    NSLog(@"Person dealloc");
    [super dealloc];
}

@end
