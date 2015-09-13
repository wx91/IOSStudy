//
//  Person.m
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person


-(instancetype)initwithDog:(Dog *)dog{
    self=[super init];
    if (self) {
        _dog=[dog retain];
    }
    return self;
}

-(void)setName:(NSString *)name{
    if(_name!=name){
        [_name release];
        _name=[name copy];
    }
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
//遛狗
-(void)playDog{
    NSLog(@"遛狗%@",_dog.name);
}

-(void)dealloc{
    
    [_name release];
    [_dog release];//释放持有狗的对象所有权
    NSLog(@"Person dealloc");
    [super dealloc];
}

@end
