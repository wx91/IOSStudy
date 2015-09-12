//
//  Person.m
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)setName:(NSString *)name{
    _name=name;
}
//第一种形式
//-(void)setDog:(Dog *)dog{
//    _dog=[dog retain];
//}

//第二种形式
//-(void)setDog:(Dog *)dog{
//    [_dog release];
//    _dog =[dog retain];
//}

-(void)setDog:(Dog *)dog{
    if (_dog!=dog) {
        [_dog release];
        _dog=[dog retain];
    }
}

-(Dog *)dog{
    return _dog;
}


@end
