//
//  Person.m
//  08.01 Task1
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
@implementation Person

-(NSString *)description{
    NSString *s=[NSString stringWithFormat:@"name=%@,age=%ld",_name,_age];
    return s;
}
-(void)setDog:(Dog *)dog{
    if (_dog!=dog) {
        [_dog release];
        _dog=[dog retain];
    }
}


@end
